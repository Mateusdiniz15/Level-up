import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CampusRecord extends FirestoreRecord {
  CampusRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Campus');

  static Stream<CampusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CampusRecord.fromSnapshot(s));

  static Future<CampusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CampusRecord.fromSnapshot(s));

  static CampusRecord fromSnapshot(DocumentSnapshot snapshot) => CampusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CampusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CampusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CampusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CampusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCampusRecordData({
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class CampusRecordDocumentEquality implements Equality<CampusRecord> {
  const CampusRecordDocumentEquality();

  @override
  bool equals(CampusRecord? e1, CampusRecord? e2) {
    return e1?.nome == e2?.nome;
  }

  @override
  int hash(CampusRecord? e) => const ListEquality().hash([e?.nome]);

  @override
  bool isValidKey(Object? o) => o is CampusRecord;
}
