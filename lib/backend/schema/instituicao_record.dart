import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class InstituicaoRecord extends FirestoreRecord {
  InstituicaoRecord._(
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
      FirebaseFirestore.instance.collection('Instituicao');

  static Stream<InstituicaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InstituicaoRecord.fromSnapshot(s));

  static Future<InstituicaoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InstituicaoRecord.fromSnapshot(s));

  static InstituicaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstituicaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstituicaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstituicaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstituicaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstituicaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstituicaoRecordData({
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstituicaoRecordDocumentEquality implements Equality<InstituicaoRecord> {
  const InstituicaoRecordDocumentEquality();

  @override
  bool equals(InstituicaoRecord? e1, InstituicaoRecord? e2) {
    return e1?.nome == e2?.nome;
  }

  @override
  int hash(InstituicaoRecord? e) => const ListEquality().hash([e?.nome]);

  @override
  bool isValidKey(Object? o) => o is InstituicaoRecord;
}
