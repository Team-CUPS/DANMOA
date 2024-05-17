import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';
import 'package:logger/logger.dart';

import 'package:flutter/foundation.dart';
import 'schema/users_record.dart';
import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';

export 'dart:io'; // for use FILE type
export 'dart:async' show StreamSubscription;
export 'package:image_picker/image_picker.dart'; // for user to pick image from (gallery/camera)
export '../auth/firebase_auth/auth_util.dart'; // for use currentUserUid in other pages
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'package:flutter/foundation.dart';
export 'schema/users_record.dart';
export 'package:logger/logger.dart';
export 'package:url_launcher/url_launcher.dart';


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
Future<void> storeQAData(data) async {
  await FirebaseFirestore.instance.collection('qa').add(data).then((docRef) {
    print("Document written with ID: ${docRef.id}");
  }).catchError((error) {
    print("Error adding document: $error");
  });
}

Future<String?> storeStudyImageToStorage(imagePath, dirName, stdName) async {
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


Future<String?> storeProfileImageToStorage(imagePath, String uid) async {
  if (imagePath == null) {
    return null;
  }
  File file = File(imagePath);
  // Firebase Storage에 이미지 업로드
  TaskSnapshot snapshot = await FirebaseStorage.instance
    .ref('users/$uid/uploads/${file.uri.pathSegments.last}')
    .putFile(file);

  // 업로드된 파일의 URL 획득
  String downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
}





// load data

Future<List<Map<String, dynamic>>> getStudyData(int flag) async {
  final query = _getSortedStudyQuery(flag);

  final snapshot = await query.get();

  return snapshot.docs.map((doc) {
    final data = doc.data();
    data['std_created_time'] = data['std_created_time'].toDate();
    data['std_updated_time'] = data['std_updated_time'].toDate();
    return data;
  }).toList();
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



Future<List<Map<String, dynamic>>> loadUserData() async {
  var snapshot = await FirebaseFirestore.instance.collection('users').get();
  final data = snapshot.docs.map((doc) {
    final data = doc.data();
    data['created_time'] = (data['created_time'] as Timestamp).toDate(); // Timestamp를 DateTime으로 변환
    return data;
  }).toList();

  return data;
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
    };
  }).toList();
}

Future<Map<String, dynamic>> loadStudyDataByName(String stdName) async {
  try {
    // 'study' 컬렉션에서 'std_name'이 주어진 stdName과 일치하는 문서를 조회
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('study')
        .where('std_name', isEqualTo: stdName)
        .limit(1)  // 이름이 유니크하다고 가정하고 한 개만 가져옴
        .get();

    // 문서가 존재하면 해당 문서의 데이터를 리스트로 반환
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data() as Map<String, dynamic>;
    } else {
      // 해당 이름을 가진 스터디가 없는 경우 빈 리스트 반환
      return {};
    }
  } catch (e) {
    // 예외 발생 시 콘솔에 오류 메시지 출력
    print('Error: $e');
    // 오류 발생 시 빈 리스트 반환
    return {};
  }
}




Future<List<Map<String, dynamic>>> loadFilteredQAData(String currentUserUid) async {
  try {
    List<Map<String, dynamic>> loadedQAs = await loadQAData();
    List<Map<String, dynamic>> filteredQAList = loadedQAs.where((qa) {
      return qa['user_uid'] == currentUserUid && qa['signal'] == 2;
    }).toList();
    return filteredQAList;
  } catch (error) {
    logger.i("Error loading study data: $error");
    rethrow; // 에러가 발생하면 Future의 에러로 전달
  }
}