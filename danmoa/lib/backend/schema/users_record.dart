import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "prf_name" field.
  String? _prfName;
  String get prfName => _prfName ?? '';
  bool hasPrfName() => _prfName != null;

  // "prf_gender" field.
  String? _prfGender;
  String get prfGender => _prfGender ?? '';
  bool hasPrfGender() => _prfGender != null;

  // "prf_birth" field.
  DateTime? _prfBirth;
  DateTime? get prfBirth => _prfBirth;
  bool hasPrfBirth() => _prfBirth != null;

  // "prf_major" field.
  String? _prfMajor;
  String get prfMajor => _prfMajor ?? '';
  bool hasPrfMajor() => _prfMajor != null;

  // "prf_position" field.
  String? _prfPosition;
  String get prfPosition => _prfPosition ?? '';
  bool hasPrfPosition() => _prfPosition != null;

  // "usr_score" field.
  int? _usrScore;
  int get usrScore => _usrScore ?? 0;
  bool hasUsrScore() => _usrScore != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _prfName = snapshotData['prf_name'] as String?;
    _prfGender = snapshotData['prf_gender'] as String?;
    _prfBirth = snapshotData['prf_birth'] as DateTime?;
    _prfMajor = snapshotData['prf_major'] as String?;
    _prfPosition = snapshotData['prf_position'] as String?;
    _usrScore = castToType<int>(snapshotData['usr_score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? prfName,
  String? prfGender,
  DateTime? prfBirth,
  String? prfMajor,
  String? prfPosition,
  int? usrScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'prf_name': prfName,
      'prf_gender': prfGender,
      'prf_birth': prfBirth,
      'prf_major': prfMajor,
      'prf_position': prfPosition,
      'usr_score': usrScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.prfName == e2?.prfName &&
        e1?.prfGender == e2?.prfGender &&
        e1?.prfBirth == e2?.prfBirth &&
        e1?.prfMajor == e2?.prfMajor &&
        e1?.prfPosition == e2?.prfPosition &&
        e1?.usrScore == e2?.usrScore;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.prfName,
        e?.prfGender,
        e?.prfBirth,
        e?.prfMajor,
        e?.prfPosition,
        e?.usrScore
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
