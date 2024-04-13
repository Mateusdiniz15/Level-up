import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GraduacoesRecord extends FirestoreRecord {
  GraduacoesRecord._(
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
      FirebaseFirestore.instance.collection('Graduacoes');

  static Stream<GraduacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GraduacoesRecord.fromSnapshot(s));

  static Future<GraduacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GraduacoesRecord.fromSnapshot(s));

  static GraduacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GraduacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GraduacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GraduacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GraduacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GraduacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGraduacoesRecordData({
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class GraduacoesRecordDocumentEquality implements Equality<GraduacoesRecord> {
  const GraduacoesRecordDocumentEquality();

  @override
  bool equals(GraduacoesRecord? e1, GraduacoesRecord? e2) {
    return e1?.nome == e2?.nome;
  }

  @override
  int hash(GraduacoesRecord? e) => const ListEquality().hash([e?.nome]);

  @override
  bool isValidKey(Object? o) => o is GraduacoesRecord;
}
