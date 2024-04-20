import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AreasConhecimentosRecord extends FirestoreRecord {
  AreasConhecimentosRecord._(
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
      FirebaseFirestore.instance.collection('areas_conhecimentos');

  static Stream<AreasConhecimentosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AreasConhecimentosRecord.fromSnapshot(s));

  static Future<AreasConhecimentosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AreasConhecimentosRecord.fromSnapshot(s));

  static AreasConhecimentosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AreasConhecimentosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AreasConhecimentosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AreasConhecimentosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AreasConhecimentosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AreasConhecimentosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAreasConhecimentosRecordData({
  String? titulo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
    }.withoutNulls,
  );

  return firestoreData;
}

class AreasConhecimentosRecordDocumentEquality
    implements Equality<AreasConhecimentosRecord> {
  const AreasConhecimentosRecordDocumentEquality();

  @override
  bool equals(AreasConhecimentosRecord? e1, AreasConhecimentosRecord? e2) {
    return e1?.titulo == e2?.titulo;
  }

  @override
  int hash(AreasConhecimentosRecord? e) =>
      const ListEquality().hash([e?.titulo]);

  @override
  bool isValidKey(Object? o) => o is AreasConhecimentosRecord;
}
