import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FavoritosRecord extends FirestoreRecord {
  FavoritosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idMentor" field.
  DocumentReference? _idMentor;
  DocumentReference? get idMentor => _idMentor;
  bool hasIdMentor() => _idMentor != null;

  // "idAluno" field.
  DocumentReference? _idAluno;
  DocumentReference? get idAluno => _idAluno;
  bool hasIdAluno() => _idAluno != null;

  void _initializeFields() {
    _idMentor = snapshotData['idMentor'] as DocumentReference?;
    _idAluno = snapshotData['idAluno'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favoritos');

  static Stream<FavoritosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoritosRecord.fromSnapshot(s));

  static Future<FavoritosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoritosRecord.fromSnapshot(s));

  static FavoritosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoritosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoritosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoritosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoritosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoritosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoritosRecordData({
  DocumentReference? idMentor,
  DocumentReference? idAluno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idMentor': idMentor,
      'idAluno': idAluno,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoritosRecordDocumentEquality implements Equality<FavoritosRecord> {
  const FavoritosRecordDocumentEquality();

  @override
  bool equals(FavoritosRecord? e1, FavoritosRecord? e2) {
    return e1?.idMentor == e2?.idMentor && e1?.idAluno == e2?.idAluno;
  }

  @override
  int hash(FavoritosRecord? e) =>
      const ListEquality().hash([e?.idMentor, e?.idAluno]);

  @override
  bool isValidKey(Object? o) => o is FavoritosRecord;
}
