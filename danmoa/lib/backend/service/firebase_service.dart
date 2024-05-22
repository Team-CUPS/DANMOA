import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'util_service.dart'; // UtilService를 불러오기
import 'package:logger/logger.dart';
export 'package:image_picker/image_picker.dart';
export 'util_service.dart';
export 'package:danmoa/auth/firebase_auth/auth_util.dart';
export 'package:url_launcher/url_launcher.dart';
import 'package:danmoa/backend/service/local_push_notification_service.dart';
import 'dart:async';



var logger = Logger(
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
);

class FirebaseService {
  // 프라이빗 생성자
  FirebaseService._privateConstructor();

  // 싱글 인스턴스
  static final FirebaseService instance = FirebaseService._privateConstructor();

  // StreamSubscription<DocumentSnapshot>? _subscription;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _subscription; // 전체 QA 조건
  

  // 스터디 이름이 고유한지 확인
  Future<bool> isStudyNameUnique(String stdName) async {
    final hash = UtilService.generateHash(stdName.toLowerCase());
    final studyDoc = await FirebaseFirestore.instance.collection('study').doc(hash).get();
    return !studyDoc.exists;
  }

  // display_name이 고유한지 확인
  Future<bool> isDisplayNameUnique(String displayName) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('display_name', isEqualTo: displayName)
        .get();
    return querySnapshot.docs.isEmpty;
  }


  // 사용자가 스터디에 가입한 정보를 사용자 컬렉션에 저장 (studies: 서브 컬렉션)
  Future<void> addUserStudy(String stdName, String uid, DateTime stdUpdatedTime) async {
    final hash = UtilService.generateHash(stdName.toLowerCase());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('studies')
        .doc(hash)
        .set({
      'stdName': stdName, // 개발할 때 스터디 구별 + 확장성을 대비
      'std_updated_time': stdUpdatedTime,
    });
  }

  // 가입된 유저 한해서 시간 업데이트
  Future<void> updateUserStudyIfJoined(String stdName, String uid) async {
    final hash = UtilService.generateHash(stdName.toLowerCase());
    final userDocRef = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('studies')
        .doc(hash);

    final studyDocRef = FirebaseFirestore.instance
        .collection('study')
        .doc(hash);

    try {
      // 문서가 존재하는지 확인
      final userDocSnapshot = await userDocRef.get();
      if (userDocSnapshot.exists) {
        final now = DateTime.now();
        // 문서가 존재하면 업데이트
        await userDocRef.update({
          'std_updated_time': now, // 수동으로 시간 업데이트
        });

        // 스터디 문서도 업데이트
        await studyDocRef.update({
          'std_updated_time': now, // 스터디의 std_updated_time 업데이트
        });

      } else {
        // 문서가 존재하지 않으면 예외 처리
        logger.w('User is not joined to the study: $stdName');
      }
    } catch (e) {
      logger.e('Error updating study: $e');
    }
  }


  // 스터디 모든 데이터를 study 컬렉션에 저장
  Future<void> addStudyData(String stdName, Map<String, dynamic> data) async {
    final hash = UtilService.generateHash(stdName.toLowerCase());

    await FirebaseFirestore.instance
        .collection('study')
        .doc(hash)
        .set(data);
  }

  // 특정 사용자가 스터디에 가입시 users, studies 콜렉션에 해당 스터디 데이터를 저장
  Future<void> storeUserStudy(String stdName, String uid, Map<String, dynamic> data) async {
    await addUserStudy(stdName, uid, DateTime.now()); // users subcollection으로 studies콜렉션에 'stdName': stdName, 'std_updated_time': stdUpdatedTime
    await addStudyData(stdName, data); // 스터디 모든 데이터를 study콜렉션에 저장
  }

  // 특정 사용자가 가입한 스터디의 전체 데이터를 가져와서 리스트에 저장
  Future<List<Map<String, dynamic>>> getUserStudies(String uid, int flag) async {
    // 사용자의 스터디 목록을 가져옴
    final userStudiesSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('studies')
        .orderBy(flag == 1 ? 'std_updated_time' : 'std_created_time', descending: true)
        .get();

    // 각 스터디 문서를 가져오는 Future 리스트 생성
    final studyFutures = userStudiesSnapshot.docs.map((doc) {
      final studyHash = doc.id;
      return FirebaseFirestore.instance.collection('study').doc(studyHash).get();
    });

    // 모든 Future가 완료될 때까지 대기
    final studyDocs = await Future.wait(studyFutures);

    // 존재하는 스터디 문서만 필터링하고 데이터 추출
    return studyDocs.where((doc) => doc.exists).map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  // 스터디 생성 (확장 가능성)
  Future<void> createStudy(String stdName, String uid, Map<String, dynamic> data) async {
    await storeUserStudy(stdName, uid, data);
  }

  // 스터디 가입 (확장 가능성)
  Future<void> joinStudy(String stdName, String uid, String prfName) async {
    await addUserStudy(stdName, uid, DateTime.now());
    await storeStudyMember(stdName, uid, prfName);
  }

  // 스터디 가입시 멤버 정보를 스터디 문서에 추가
  Future<void> storeStudyMember(String stdName, String uid, String name) async {
    final hash = UtilService.generateHash(stdName.toLowerCase());
    final studyDoc = FirebaseFirestore.instance.collection('study').doc(hash);

    await studyDoc.update({
      'std_members': FieldValue.arrayUnion([
        {'uid': uid, 'name': name}
      ])
    });
  }

  // 전체 스터디 데이터를 가져옴
  Future<List<Map<String, dynamic>>> getStudyData(int flag) async {
    final query = _getSortedStudyQuery(flag);
    final snapshot = await query.get();

    final data = snapshot.docs.map((doc) {
      final data = doc.data();
      data['std_created_time'] = data['std_created_time'].toDate();
      data['std_updated_time'] = data['std_updated_time'].toDate();
      return data;
    }).toList();

    return data;
  }

  Query<Map<String, dynamic>> _getSortedStudyQuery(int flag) {
    final collection = FirebaseFirestore.instance.collection('study');

    switch (flag) {
      case 1:
        return collection.orderBy('std_updated_time', descending: true);
      case 2:
        return collection.orderBy('std_created_time', descending: true);
      default:
        throw Exception("Invalid flag value");
    }
  }

  /*
  // 전체 유저 데이터를 가져옴
  Future<List<Map<String, dynamic>>> getUserData() async {
    if (_isCacheValid(_usersCacheTimestamp)) {
      return _cachedUsers!;
    }

    var snapshot = await FirebaseFirestore.instance.collection('users').get();
    final data = snapshot.docs.map((doc) {
      final data = doc.data();
      data['created_time'] = (data['created_time'] as Timestamp).toDate(); // Timestamp를 DateTime으로 변환
      return data;
    }).toList();

    _cachedUsers = data;
    _usersCacheTimestamp = DateTime.now();

    return data;
  }
  */

  Future<Map<String, dynamic>> getStudyDataByName(String stdName) async {
    try {
      final hash = UtilService.generateHash(stdName.toLowerCase());

      // 'study' 컬렉션에서 해시 값이 주어진 해시와 일치하는 문서를 조회
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('study')
          .doc(hash)
          .get();

      // 문서가 존재하면 해당 문서의 데이터를 반환
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      } else {
        // 해당 해시 값을 가진 스터디가 없는 경우 빈 맵 반환
        return {};
      }
    } catch (e) {
      // 예외 발생 시 콘솔에 오류 메시지 출력
      logger.e('Error: $e');
      // 오류 발생 시 빈 맵 반환
      return {};
    }
  }

  Future<Map<String, dynamic>> getUserDataByUid(String uid) async {
    try {
      // document ID가 uid와 같으므로 바로 문서 참조를 가져옵니다.
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      // 문서가 존재하면 해당 문서의 데이터를 반환
      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>;
      } else {
        // 해당 UID를 가진 사용자가 없는 경우 빈 맵 반환
        return {};
      }
    } catch (e) {
      // 예외 발생 시 콘솔에 오류 메시지 출력
      logger.e('Error in loadUserDataByUid: $e');
      // 오류 발생 시 빈 맵 반환
      return {};
    }
  }


  // 특정 스터디에 가입된 팀원들의 데이터를 가져오는 메소드
  Future<List<Map<String, dynamic>>> getMembersDataFromStudyData(Map<String, dynamic> studyData) async {
    List<Map<String, dynamic>> selectedUsers = [];

    if (studyData['std_members'] == null || studyData['std_members'].isEmpty) {
      return [];
    }

    for (var member in studyData['std_members']) {
      String uid = member['uid'];
      Map<String, dynamic> userInfo = await getUserDataByUid(uid);

      if (userInfo.isNotEmpty) {
        selectedUsers.add(userInfo);
      }
    }
    return selectedUsers;
  }



  // 유저 이미지 링크 반환 (나중에 앱이 확장되면 해당 메소드를 하드코딩 -> path방식으로 변경하면 됨 / 이 때는 Future 사용)
  String getUserPhotoUrl(String? imgPath) {
    if (UtilService.isDefaultImage(imgPath)) {
      return 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/users%2Fdefault%2F1000000036.jpg?alt=media&token=e89a0182-6090-465d-8065-ee98fc2c7c35';
    } else {
      return imgPath!;
    }
  }

  
  // 스터디 이미지 링크 반환 (나중에 앱이 확장되면 해당 메소드를 하드코딩 -> path방식으로 변경하면 됨 / 이 때는 Future 사용)
  String getStudyPhotoUrl(String? imgPath) {
    if (UtilService.isDefaultImage(imgPath)) {
      return 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/study%2Fdefault%2Fbearstudyblue.jpg?alt=media&token=c0a9e16d-dd9e-47c2-bebc-907bab756880';
      //return 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/study%2Fdefault%2Fbearstudy.jpg?alt=media&token=75debbe7-c83e-4f86-8035-35ceb3333b35';
      //return 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/study%2Fdefault%2Fdefault_white.png?alt=media&token=e78c656d-4dc3-4b91-b2ad-2bb69a913f64';
    } else {
      return imgPath!;
    }
  }


  // 필터링 키워드를 줬을 때 해당 필터링을 만족하는 스터디 데이터만 반환
  Future<List<Map<String, dynamic>>> getFilteredStudyData({
    String? stdPosition,
    List<String>? stdTimes,
    String? stdField,
  }) async {
    try {
      List<Map<String, dynamic>> loadedStudies = await getStudyData(2);
      List<Map<String, dynamic>> filteredStudyList = loadedStudies.where((study) {
        bool positionMatch = stdPosition == null || study['std_position'] == stdPosition;
        bool timesMatch = stdTimes == null || stdTimes.isEmpty || listEquals(stdTimes, study['std_times'].sublist(0, study['std_times'].length - 1));
        bool fieldMatch = stdField == null || study['std_field'] == stdField;

        return positionMatch && timesMatch && fieldMatch;
      }).toList();
      return filteredStudyList;
    } catch (error) {
      throw Exception('Data loading failed: $error');
    }
  }

  Future<List<Map<String, dynamic>>> getFilteredSearchStudyData(List<Map<String, dynamic>> studyData, filter) async {
    // studyData가 `filter`를 포함하는 데이터만 필터링하여 `filtered` 리스트 생성
    var filtered = studyData.where((data) {
      var name = data['std_name'];
      if (name == null || filter.isEmpty) {
        return false; // 이름이나 필터가 비어있다면 제외
      }
      return name.toLowerCase().contains(filter.toLowerCase());
    }).toList();

    // 필터링된 리스트 반환 (아무 것도 없으면 빈 리스트 반환)
    return filtered;
  }


  // 스터디 사진 firestore에 업로드 후 해당 경로 반환
  Future<String?> storeStudyImageToStorage(imagePath, dirName, stdName) async {
    // 기본 이미지(참고) : 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/study%2Fdefault%2Fdefault_white.png?alt=media&token=e78c656d-4dc3-4b91-b2ad-2bb69a913f64'
    if (imagePath == null) {
      return null;
    }
    File file = File(imagePath);
    // Firebase Storage에 이미지 업로드
    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref('study/$stdName/$dirName/${file.uri.pathSegments.last}')
        .putFile(file);

    // 업로드된 파일의 URL 획득
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  // 유저 사진 firestore에 업로드 후 해당 경로 반환
  Future<String?> storeUserImageToStorage(imagePath, dirName, prfName) async {
    // 기본 이미지(참고) : 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/users%2Fdefault%2F1000000036.jpg?alt=media&token=e89a0182-6090-465d-8065-ee98fc2c7c35'
    if (imagePath == null) {
      return null;
    }
    File file = File(imagePath);
    // Firebase Storage에 이미지 업로드
    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref('users/$prfName/$dirName/${file.uri.pathSegments.last}')
        .putFile(file);

    // 업로드된 파일의 URL 획득
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  // 스터디 정보 수정(업데이트)
  Future<void> updateStudyDetails(String stdName, {String stdPosition = "", List<String> stdTimes = const [], String stdField = "", String? stdPrfPicture = "", String stdIntro = "", String stdPrfUrl = ""}) async {
    CollectionReference studyCollection = FirebaseFirestore.instance.collection('study');
    final String hash = UtilService.generateHash(stdName.toLowerCase());
    DocumentReference studyDoc = studyCollection.doc(hash);
    Map<String, dynamic> updates = {};

    if (stdPosition.isNotEmpty) {
      updates['std_position'] = stdPosition;
    }
    if (stdTimes.isNotEmpty && stdTimes.length != 2) {
      updates['std_times'] = stdTimes;
    }
    if (stdField.isNotEmpty) {
      updates['std_field'] = stdField;
    }
    if (stdPrfUrl.isNotEmpty) {
      updates['std_prf_url'] = stdPrfUrl;
    }
    if (stdIntro.isNotEmpty) {
      updates['std_intro'] = stdIntro;
    }
    
    updates['std_prf_picture'] = stdPrfPicture;
    updates['std_updated_time'] = DateTime.now();

    if (updates.isNotEmpty) {
      try {
        DocumentSnapshot studySnapshot = await studyDoc.get();
        if (studySnapshot.exists) {
          logger.i('Fetched study document: ${studySnapshot.data()}');
          await studyDoc.update(updates);
          logger.i('Study details updated successfully.');

          // 가입된 유저들의 studies 서브 컬렉션 업데이트
          Map<String, dynamic> studyData = studySnapshot.data() as Map<String, dynamic>;
          String leaderUid = studyData['std_leader']['uid'];
          List<dynamic> members = studyData['std_members'];

          Set<String> userIds = {leaderUid};
          for (var member in members) {
            userIds.add(member['uid']);
          }

          await Future.forEach(userIds, (String uid) async {
            await updateUserStudyIfJoined(stdName, uid);
          });

        } else {
          logger.w('Document reference found, but the document does not exist.');
        }
      } catch (e) {
        logger.e('Error updating study details: $e');
      }
    } else {
      logger.w('No valid fields to update.');
    }
  }

  // 프로필 수정(업데이트)
  Future<void> updateProfile(String uid, String displayName, String prfIntro, String prfMajor, String prfPosition, String? photoUrl) async {
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
    Map<String, dynamic> updates = {
      'display_name': displayName,
      'prf_intro': prfIntro,
      'prf_major': prfMajor,
      'prf_position': prfPosition,
      'photo_url': photoUrl,
    };

    try {
      logger.i('Updating profile for user: $uid');
      DocumentReference userDoc = usersCollection.doc(uid);

      logger.i('Document reference obtained: ${userDoc.id}');
      await userDoc.update(updates);
      
      logger.i('User details updated successfully.');
    } catch (e) {
      logger.e('Error updating user details: $e');

      // 구체적인 오류 처리
      if (e is FirebaseException) {
        logger.e('FirebaseException: ${e.message}');
      } else {
        logger.e('Unexpected error: $e');
      }
    }
  }


  // 스터디 삭제
  Future<void> deleteStudy(String stdName) async {
    final hash = UtilService.generateHash(stdName.toLowerCase());
    final studyDoc = FirebaseFirestore.instance.collection('study').doc(hash);

    try {
      // 스터디 문서 가져오기
      final studySnapshot = await studyDoc.get();

      if (studySnapshot.exists) {
        final studyData = studySnapshot.data() as Map<String, dynamic>;
        final members = studyData['std_members'] as List<dynamic>;

        // 각 멤버의 studies 서브 컬렉션에서 해당 스터디 문서 삭제
        for (var member in members) {
          final uid = member['uid'];
          final userStudyDoc = FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .collection('studies')
              .doc(hash);

          await userStudyDoc.delete();
        }

        // 팀장 UID 가져오기
        final leaderUid = studyData['std_leader']['uid'];

        // 팀장의 studies 서브 컬렉션에서 해당 스터디 문서 삭제
        final leaderStudyDoc = FirebaseFirestore.instance
            .collection('users')
            .doc(leaderUid)
            .collection('studies')
            .doc(hash);

        await leaderStudyDoc.delete();

        // 스터디 문서 삭제
        await studyDoc.delete();

        // 로그 출력
        logger.i('Study deleted successfully: $stdName');
      } else {
        // 스터디 문서가 존재하지 않으면 예외 처리
        logger.w('Study does not exist: $stdName');
      }
    } catch (e) {
      // 오류 발생 시 로그 출력
      logger.e('Error deleting study: $e');
    }
  }

  // 스터디 멤버 추방
  Future<void> removeMemberFromStudy(String stdName, String uid) async {
    final hash = UtilService.generateHash(stdName.toLowerCase());
    final studyDocRef = FirebaseFirestore.instance.collection('study').doc(hash);

    try {
      // 스터디 문서 가져오기
      final studyDocSnapshot = await studyDocRef.get();

      if (studyDocSnapshot.exists) {
        final studyData = studyDocSnapshot.data() as Map<String, dynamic>;

        // 멤버 목록에서 해당 UID를 가진 멤버 제거
        final updatedMembers = List<Map<String, dynamic>>.from(studyData['std_members'])
          ..removeWhere((member) => member['uid'] == uid);

        // Firestore 문서 업데이트
        await studyDocRef.update({'std_members': updatedMembers});

        // 유저 컬렉션의 studies 서브 컬렉션에서도 해당 스터디를 제거
        final userStudyDocRef = FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('studies')
            .doc(hash);

        await userStudyDocRef.delete();

        // 로그 출력
        logger.i('Member removed successfully from study: $stdName and user\'s studies subcollection.');
      } else {
        logger.w('Study does not exist: $stdName');
      }
    } catch (e) {
      logger.e('Error removing member from study: $e');
    }
  }


  // 회원 탈퇴
  Future<void> deleteUserAccount(String currentUserUid) async {
    // 유저의 스터디 목록 가져오기
    var userStudies = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserUid)
        .collection('studies');

    // 각 스터디에 대해 처리
    final userStudiesSnapshot = await userStudies.get();
    for (var studyDoc in userStudiesSnapshot.docs) {
      var hash = studyDoc.id; // 스터디 ID (해시)

      // 스터디 문서 가져오기
      var studyRef = FirebaseFirestore.instance.collection('study').doc(hash);

      // 스터디 문서에서 리더와 멤버 정보 업데이트
      var studySnapshot = await studyRef.get();
      if (studySnapshot.exists) {
        Map<String, dynamic> studyData = studySnapshot.data() as Map<String, dynamic>;
        // 스터디 리더가 현재 유저인 경우, 스터디 문서 삭제
        if (studyData['std_leader']['uid'] == currentUserUid) {
          logger.w('팀장: ${studyData['std_leader']['uid']}');
          await studyRef.delete();
        } else {
          // 멤버 리스트에서 현재 유저 제거
          logger.w('팀원');
          List<dynamic> members = studyData['std_members'];
          members.removeWhere((member) => member['uid'] == currentUserUid);
          await studyRef.update({'std_members': members});
        }
      }

      // 유저의 스터디 목록에서 해당 스터디 제거 (하지않으면 users에 해당 uid의 문서가 삭제되지 않는다)
      await userStudies.doc(hash).delete();
    }

    // qa 컬렉션에서 현재 유저의 문서 삭제
    var userQADocs = FirebaseFirestore.instance
        .collection('qa')
        .where('user_uid', isEqualTo: currentUserUid);
    
    final userQADocsSnapshot = await userQADocs.get();
    for (var doc in userQADocsSnapshot.docs) {
      await doc.reference.delete();
    }

    logger.i('user dataall deleted. now delete user document');
    // 유저 문서 삭제
    await FirebaseFirestore.instance.collection('users').doc(currentUserUid).delete();
  }



  Future<bool> doesStudyExist(String stdName) async {
    final hash = UtilService.generateHash(stdName.toLowerCase());
    final studyDoc = await FirebaseFirestore.instance.collection('study').doc(hash).get();
    return studyDoc.exists;
  }

  // QA
  Future<void> storeQAData(Map<String, dynamic> data) async {
    // 데이터를 'qa' 컬렉션에 추가하고 DocumentReference를 받는다.
    DocumentReference documentReference = await FirebaseFirestore.instance.collection('qa').add(data);

    await documentReference.update({
      'doc_id': documentReference.id  // 문서 ID를 필드로 설정
    });

  }


  Future<void> deleteQAData(String docId) async {
    await FirebaseFirestore.instance.collection('qa').doc(docId).delete();
  }


  Future<List<Map<String, dynamic>>> loadQAData() async {
    var snapshot = await FirebaseFirestore.instance.collection('qa').get();
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data();

      return {
        'signal': data['signal'],
        'ai_score': data['ai_score'],
        'usr_score': data['usr_score'],
        'usr_input_txt': data['usr_input_txt'],
        'ai_output': data['ai_output'],
        'user_uid': data['user_uid'],
        'created_time': data['created_time'],
        'doc_id': data['doc_id'],
      };
    }).toList();
  }


  Future<List<Map<String, dynamic>>> loadUserAnsweredQAData(String uid) async {
    try {
      List<Map<String, dynamic>> loadedQAs = await loadQAData();
      List<Map<String, dynamic>> filteredQAList = loadedQAs.where((qa) {
        return qa['signal'] == 3 && qa['user_uid'] == uid;
      }).toList();
      return filteredQAList;
    } catch (error) {
      logger.i("Error loading study data: $error");
      rethrow; // 에러가 발생하면 Future의 에러로 전달
    }
  }

  Future<void> setEndWaitingForAnswer(String docId) async {
    DocumentReference doc = FirebaseFirestore.instance.collection('qa').doc(docId);
    await doc.update({'signal': 3});
  }

  Future<bool> isWaitingForAnswer(String userId) async {
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    final data = docSnapshot.data();
    if (data != null && data is Map<String, dynamic>) {
      if (data['signal'] == 0 || data['signal'] == 2) { // 2 -> 3되는 시간도 고려
        return true;
      }
      else {
        return false;
      }
    } 
    logger.e('data is null or type error in isWaitingForAnswer');
    return false;
  }


  void listenToDocumentChange(String uid) {
  _subscription?.cancel(); // 기존 구독 취소
  _subscription = FirebaseFirestore.instance.collection('qa')
    .where('user_uid', isEqualTo: uid)
    .where('signal', isEqualTo: 2)
    .snapshots()
    .listen((querySnapshot) {
      for (var documentSnapshot in querySnapshot.docs) {
        if (documentSnapshot.exists) {
          final data = documentSnapshot.data();
          logger.i('Signal 2 detected');
          if (data['signal'] == 2) {
            LocalPushNotifications.showSimpleNotification(
              title: "QA 답변완료",
              body: "단모아가 QA답변을 완료했어요!\n질문리스트로 이동해보세요!",
              payload: 'QA2'
            );
            setEndWaitingForAnswer(documentSnapshot.id);
            cancelSubscription(); // 작업 완료 후 구독 취소
          }
        }
      }
    });
  }
  
  

  void cancelSubscription() {
    _subscription?.cancel();
    _subscription = null;
  }
  

  static Future<bool> updateUnansweredQAs(String uid) async {
    bool hasQA = false;
    FirebaseFirestore db = FirebaseFirestore.instance;
    // uid와 signal 조건에 맞는 문서 검색
    QuerySnapshot querySnapshot = await db.collection('qa')
        .where('user_uid', isEqualTo: uid)
        .where('signal', isEqualTo: 2)
        .get();

    // 검색된 문서가 하나라도 있으면 모두 signal을 3으로 업데이트
    if (querySnapshot.docs.isNotEmpty) {
      hasQA = true;
      for (var doc in querySnapshot.docs) {
        await doc.reference.update({'signal': 3});
      }
      return hasQA;
    }
    return false;
  }
}
