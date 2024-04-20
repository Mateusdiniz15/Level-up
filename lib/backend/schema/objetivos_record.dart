import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ObjetivosRecord extends FirestoreRecord {
  ObjetivosRecord._(
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
      FirebaseFirestore.instance.collection('objetivos');

  static Stream<ObjetivosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ObjetivosRecord.fromSnapshot(s));

  static Future<ObjetivosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ObjetivosRecord.fromSnapshot(s));

  static ObjetivosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ObjetivosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ObjetivosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ObjetivosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ObjetivosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ObjetivosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createObjetivosRecordData({
  String? titulo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ObjetivosRecordDocumentEquality implements Equality<ObjetivosRecord> {
  const ObjetivosRecordDocumentEquality();

  @override
  bool equals(ObjetivosRecord? e1, ObjetivosRecord? e2) {
    return e1?.titulo == e2?.titulo;
  }

  @override
  int hash(ObjetivosRecord? e) => const ListEquality().hash([e?.titulo]);

  @override
  bool isValidKey(Object? o) => o is ObjetivosRecord;
}
