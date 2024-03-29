import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CompetitionRecord extends FirestoreRecord {
  CompetitionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  void _initializeFields() {}

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('competition');

  static Stream<CompetitionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompetitionRecord.fromSnapshot(s));

  static Future<CompetitionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompetitionRecord.fromSnapshot(s));

  static CompetitionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompetitionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompetitionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompetitionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompetitionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompetitionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompetitionRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class CompetitionRecordDocumentEquality implements Equality<CompetitionRecord> {
  const CompetitionRecordDocumentEquality();

  @override
  bool equals(CompetitionRecord? e1, CompetitionRecord? e2) {
    return;
  }

  @override
  int hash(CompetitionRecord? e) => const ListEquality().hash([]);

  @override
  bool isValidKey(Object? o) => o is CompetitionRecord;
}
