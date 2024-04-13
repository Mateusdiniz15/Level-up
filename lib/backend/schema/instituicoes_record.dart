import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class InstituicoesRecord extends FirestoreRecord {
  InstituicoesRecord._(
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
      FirebaseFirestore.instance.collection('Instituicoes');

  static Stream<InstituicoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InstituicoesRecord.fromSnapshot(s));

  static Future<InstituicoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InstituicoesRecord.fromSnapshot(s));

  static InstituicoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstituicoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstituicoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstituicoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstituicoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstituicoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstituicoesRecordData({
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstituicoesRecordDocumentEquality
    implements Equality<InstituicoesRecord> {
  const InstituicoesRecordDocumentEquality();

  @override
  bool equals(InstituicoesRecord? e1, InstituicoesRecord? e2) {
    return e1?.nome == e2?.nome;
  }

  @override
  int hash(InstituicoesRecord? e) => const ListEquality().hash([e?.nome]);

  @override
  bool isValidKey(Object? o) => o is InstituicoesRecord;
}
