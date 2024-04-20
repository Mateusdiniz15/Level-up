import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PeriodoRecord extends FirestoreRecord {
  PeriodoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('periodo');

  static Stream<PeriodoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PeriodoRecord.fromSnapshot(s));

  static Future<PeriodoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PeriodoRecord.fromSnapshot(s));

  static PeriodoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PeriodoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PeriodoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PeriodoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PeriodoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PeriodoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPeriodoRecordData({
  String? titulo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
    }.withoutNulls,
  );

  return firestoreData;
}

class PeriodoRecordDocumentEquality implements Equality<PeriodoRecord> {
  const PeriodoRecordDocumentEquality();

  @override
  bool equals(PeriodoRecord? e1, PeriodoRecord? e2) {
    return e1?.titulo == e2?.titulo;
  }

  @override
  int hash(PeriodoRecord? e) => const ListEquality().hash([e?.titulo]);

  @override
  bool isValidKey(Object? o) => o is PeriodoRecord;
}
