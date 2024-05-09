import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';
import 'package:logger/logger.dart';

import 'schema/users_record.dart';
import 'dart:io';

export 'dart:io'; // for use FILE type
export 'dart:async' show StreamSubscription;
export 'package:image_picker/image_picker.dart'; // for user to pick image from (gallery/camera)
export '../auth/firebase_auth/auth_util.dart'; // for use currentUserUid in other pages
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/users_record.dart';
export 'package:logger/logger.dart';

var logger = Logger(
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  );

/// Functions to query UsersRecords (as a Stream and as a Future).
Future<int> queryUsersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  getDocs(QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UsersRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUsersRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument = UsersRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUsersRecordData(email: email));
}




// store & upload data

Future<void> storeStudyData(data) async {
  await FirebaseFirestore.instance.collection('study').add(data).then((docRef) {
    print("Document written with ID: ${docRef.id}");
  }).catchError((error) {
    print("Error adding document: $error");
  });
}

Future<void> storeQAData(data) async {
  await FirebaseFirestore.instance.collection('qa').add(data).then((docRef) {
    print("Document written with ID: ${docRef.id}");
  }).catchError((error) {
    print("Error adding document: $error");
  });
}

Future<String?> storeImageToStorage(imagePath, stdName) async {
  if (imagePath == null) {
    return null;
  }
  File file = File(imagePath);
  // Firebase Storage에 이미지 업로드
  TaskSnapshot snapshot = await FirebaseStorage.instance
    .ref('study/$stdName/uploads/${file.uri.pathSegments.last}')
    .putFile(file);

  // 업로드된 파일의 URL 획득
  String downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
}


// load data

Future<List<Map<String, dynamic>>> loadStudyData(int flag) async {
  /*
  flag: 1 -> update time DESC
  flag: 2 -> create time DESC
  */
  QuerySnapshot<Map<String, dynamic>> snapshot;
  if (flag == 1) {
    snapshot = await FirebaseFirestore.instance.collection('study').orderBy('std_updated_time', descending: true).get();
  }
  else if (flag == 2) {
    snapshot = await FirebaseFirestore.instance.collection('study').orderBy('std_created_time', descending: true).get();
  }
  // else if (flag ==3) {
  //   snapshot = await FirebaseFirestore.instance.collection('study')
  // }
  else {
    throw Exception("Invalid flag value");
  }

  return snapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data();

    return {
      'std_name': data['std_name'],
      'std_leader': data['std_leader'],
      'std_members': data['std_member'],
      'std_position': data['std_position'],
      'std_field': data['std_field'],
      'std_times': data['std_times'], // 'std_times' is a Timestamp field
      'std_created_time': data['std_created_time'].toDate(),
      'std_updated_time': data['std_updated_time'].toDate(),
      'std_intro': data['std_intro'],
      'std_prf_picture': data['std_prf_picture'],
    };
  }).toList();
}

Future<List<Map<String, dynamic>>> loadQAData(String currentUserUid) async {
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
    };
  }).toList();
}

// load filtered data

Future<List<Map<String, dynamic>>> loadFilteredPersonalStudyData(int flag) async {
  try {
    List<Map<String, dynamic>> loadedStudies = await loadStudyData(flag);
    List<Map<String, dynamic>> filteredStudyList = loadedStudies.where((study) {
      bool isLeader = study['std_leader']['uid'] == currentUserUid;
      bool isMember = study['std_members'] != null && study['std_members'].any((member) => member['uid'] == currentUserUid);
      return isLeader || isMember;
    }).toList();
    return filteredStudyList;
  } catch (error) {
    throw Exception('Data loading failed: $error');
  }
}

Future<List<Map<String, dynamic>>> filteredSearchStudyData(List<Map<String, dynamic>> studyData, filter) async {
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

Future<List<Map<String, dynamic>>> filteredStudyData(List<Map<String, dynamic>> studyData, filter) async {
    var stdPosition, stdTimes, stdField = filter;


    //std_position, std_times, std_field

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





Future<List<Map<String, dynamic>>> loadFilteredQAData() async {
  try {
    List<Map<String, dynamic>> loadedQAs = await loadQAData(currentUserUid);
    List<Map<String, dynamic>> filteredQAList = loadedQAs.where((qa) {
      return qa['user_uid'] == currentUserUid && qa['signal'] == 2;
    }).toList();
    return filteredQAList;
  } catch (error) {
    logger.i("Error loading study data: $error");
    rethrow; // 에러가 발생하면 Future의 에러로 전달
  }
}


// update data

Future<void> updateStudyUpdateTime(String stdName) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('study').where('std_name', isEqualTo: stdName).get();

  if (querySnapshot.docs.isNotEmpty) {
    // 'std_name'이 유니크 값으로 가정
    DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

    await documentSnapshot.reference.update({
      'std_updated_time': FieldValue.serverTimestamp(),
    });
  } else {
    logger.i('Document with std_name $stdName not found.');
  }
}

String formatUpdateTime(DateTime updateTime) {
  DateTime now = DateTime.now();

  DateTime justNowDate = DateTime(now.year, now.month, now.day);
  DateTime justUpdateDate = DateTime(updateTime.year, updateTime.month, updateTime.day);

  int dayDiff = justNowDate.difference(justUpdateDate).inDays;

  if (dayDiff == 0) {
    return DateFormat.jm().format(updateTime);
  } else if (dayDiff == 1) {
    return '어제';
  } else if (updateTime.year == now.year) {
    return DateFormat('M월 d일').format(updateTime);
  } else {
    return DateFormat('yyyy. MM. dd').format(updateTime);
  }
}

// Future<void> updateAISignal(int signal) async  {
//   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('ai').where('uid', isEqualTo: currentUserUid).get();
// }


// get specific data

dynamic getUserInfo(fieldKey) async {
    var result = await FirebaseFirestore.instance.collection('users').doc(currentUserUid).get();
    return result.data()?[fieldKey];
}

Future getImageFromGallery() async {
  final XFile? returnedImg =  await ImagePicker().pickImage(source: ImageSource.gallery);
  return returnedImg;
}

List<dynamic> sortTime(stdTimes) {
  Map<String, int> dayPriority = {'월': 1, '화': 2, '수': 3, '목': 4, '금': 5, '토': 6, '일': 7};
  if (stdTimes != null) {
    stdTimes!.sort((a, b) {
    int? priorityA = dayPriority[a];
    int? priorityB = dayPriority[b];

    if (priorityA != null && priorityB != null) {
      return priorityA.compareTo(priorityB);
    } else if (priorityA != null && priorityB == null) {
      return -1;
    } else if (priorityA == null && priorityB != null) {
      return 1;
    } else {
      return 0;
    }
    });
  }
  return stdTimes;
}
