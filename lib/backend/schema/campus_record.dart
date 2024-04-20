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

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('campus');

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
  String? titulo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CampusRecordDocumentEquality implements Equality<CampusRecord> {
  const CampusRecordDocumentEquality();

  @override
  bool equals(CampusRecord? e1, CampusRecord? e2) {
    return e1?.titulo == e2?.titulo;
  }

  @override
  int hash(CampusRecord? e) => const ListEquality().hash([e?.titulo]);

  @override
  bool isValidKey(Object? o) => o is CampusRecord;
}
