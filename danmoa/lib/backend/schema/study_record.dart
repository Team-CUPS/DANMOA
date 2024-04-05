import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudyRecord extends FirestoreRecord {
  StudyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "std_leader_id" field.
  String? _stdLeaderId;
  String get stdLeaderId => _stdLeaderId ?? '';
  bool hasStdLeaderId() => _stdLeaderId != null;

  // "std_member_ids" field.
  List<String>? _stdMemberIds;
  List<String> get stdMemberIds => _stdMemberIds ?? const [];
  bool hasStdMemberIds() => _stdMemberIds != null;

  // "std_name" field.
  String? _stdName;
  String get stdName => _stdName ?? '';
  bool hasStdName() => _stdName != null;

  // "std_prf_picture" field.
  String? _stdPrfPicture;
  String get stdPrfPicture => _stdPrfPicture ?? '';
  bool hasStdPrfPicture() => _stdPrfPicture != null;

  // "std_position" field.
  String? _stdPosition;
  String get stdPosition => _stdPosition ?? '';
  bool hasStdPosition() => _stdPosition != null;

  // "std_field" field.
  List<String>? _stdField;
  List<String> get stdField => _stdField ?? const [];
  bool hasStdField() => _stdField != null;

  // "std_dues" field.
  int? _stdDues;
  int get stdDues => _stdDues ?? 0;
  bool hasStdDues() => _stdDues != null;

  // "std_pw" field.
  int? _stdPw;
  int get stdPw => _stdPw ?? 0;
  bool hasStdPw() => _stdPw != null;

  // "std_created_time" field.
  DateTime? _stdCreatedTime;
  DateTime? get stdCreatedTime => _stdCreatedTime;
  bool hasStdCreatedTime() => _stdCreatedTime != null;

  // "std_score" field.
  int? _stdScore;
  int get stdScore => _stdScore ?? 0;
  bool hasStdScore() => _stdScore != null;

  // "std_time" field.
  List<String>? _stdTime;
  List<String> get stdTime => _stdTime ?? const [];
  bool hasStdTime() => _stdTime != null;

  void _initializeFields() {
    _stdLeaderId = snapshotData['std_leader_id'] as String?;
    _stdMemberIds = getDataList(snapshotData['std_member_ids']);
    _stdName = snapshotData['std_name'] as String?;
    _stdPrfPicture = snapshotData['std_prf_picture'] as String?;
    _stdPosition = snapshotData['std_position'] as String?;
    _stdField = getDataList(snapshotData['std_field']);
    _stdDues = castToType<int>(snapshotData['std_dues']);
    _stdPw = castToType<int>(snapshotData['std_pw']);
    _stdCreatedTime = snapshotData['std_created_time'] as DateTime?;
    _stdScore = castToType<int>(snapshotData['std_score']);
    _stdTime = getDataList(snapshotData['std_time']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('study');

  static Stream<StudyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudyRecord.fromSnapshot(s));

  static Future<StudyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudyRecord.fromSnapshot(s));

  static StudyRecord fromSnapshot(DocumentSnapshot snapshot) => StudyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudyRecordData({
  String? stdLeaderId,
  String? stdName,
  String? stdPrfPicture,
  String? stdPosition,
  int? stdDues,
  int? stdPw,
  DateTime? stdCreatedTime,
  int? stdScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'std_leader_id': stdLeaderId,
      'std_name': stdName,
      'std_prf_picture': stdPrfPicture,
      'std_position': stdPosition,
      'std_dues': stdDues,
      'std_pw': stdPw,
      'std_created_time': stdCreatedTime,
      'std_score': stdScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudyRecordDocumentEquality implements Equality<StudyRecord> {
  const StudyRecordDocumentEquality();

  @override
  bool equals(StudyRecord? e1, StudyRecord? e2) {
    const listEquality = ListEquality();
    return e1?.stdLeaderId == e2?.stdLeaderId &&
        listEquality.equals(e1?.stdMemberIds, e2?.stdMemberIds) &&
        e1?.stdName == e2?.stdName &&
        e1?.stdPrfPicture == e2?.stdPrfPicture &&
        e1?.stdPosition == e2?.stdPosition &&
        listEquality.equals(e1?.stdField, e2?.stdField) &&
        e1?.stdDues == e2?.stdDues &&
        e1?.stdPw == e2?.stdPw &&
        e1?.stdCreatedTime == e2?.stdCreatedTime &&
        e1?.stdScore == e2?.stdScore &&
        listEquality.equals(e1?.stdTime, e2?.stdTime);
  }

  @override
  int hash(StudyRecord? e) => const ListEquality().hash([
        e?.stdLeaderId,
        e?.stdMemberIds,
        e?.stdName,
        e?.stdPrfPicture,
        e?.stdPosition,
        e?.stdField,
        e?.stdDues,
        e?.stdPw,
        e?.stdCreatedTime,
        e?.stdScore,
        e?.stdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is StudyRecord;
}
