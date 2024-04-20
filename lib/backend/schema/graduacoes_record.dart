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

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('graduacoes');

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
  String? titulo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
    }.withoutNulls,
  );

  return firestoreData;
}

class GraduacoesRecordDocumentEquality implements Equality<GraduacoesRecord> {
  const GraduacoesRecordDocumentEquality();

  @override
  bool equals(GraduacoesRecord? e1, GraduacoesRecord? e2) {
    return e1?.titulo == e2?.titulo;
  }

  @override
  int hash(GraduacoesRecord? e) => const ListEquality().hash([e?.titulo]);

  @override
  bool isValidKey(Object? o) => o is GraduacoesRecord;
}
