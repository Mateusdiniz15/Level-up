import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class DisponibilidadeMentoresRecord extends FirestoreRecord {
  DisponibilidadeMentoresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uidMentor" field.
  DocumentReference? _uidMentor;
  DocumentReference? get uidMentor => _uidMentor;
  bool hasUidMentor() => _uidMentor != null;

  // "dataHora" field.
  DataHorasStruct? _dataHora;
  DataHorasStruct get dataHora => _dataHora ?? DataHorasStruct();
  bool hasDataHora() => _dataHora != null;

  void _initializeFields() {
    _uidMentor = snapshotData['uidMentor'] as DocumentReference?;
    _dataHora = DataHorasStruct.maybeFromMap(snapshotData['dataHora']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('disponibilidade_mentores');

  static Stream<DisponibilidadeMentoresRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => DisponibilidadeMentoresRecord.fromSnapshot(s));

  static Future<DisponibilidadeMentoresRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DisponibilidadeMentoresRecord.fromSnapshot(s));

  static DisponibilidadeMentoresRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      DisponibilidadeMentoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DisponibilidadeMentoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DisponibilidadeMentoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DisponibilidadeMentoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DisponibilidadeMentoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDisponibilidadeMentoresRecordData({
  DocumentReference? uidMentor,
  DataHorasStruct? dataHora,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uidMentor': uidMentor,
      'dataHora': DataHorasStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "dataHora" field.
  addDataHorasStructData(firestoreData, dataHora, 'dataHora');

  return firestoreData;
}

class DisponibilidadeMentoresRecordDocumentEquality
    implements Equality<DisponibilidadeMentoresRecord> {
  const DisponibilidadeMentoresRecordDocumentEquality();

  @override
  bool equals(
      DisponibilidadeMentoresRecord? e1, DisponibilidadeMentoresRecord? e2) {
    return e1?.uidMentor == e2?.uidMentor && e1?.dataHora == e2?.dataHora;
  }

  @override
  int hash(DisponibilidadeMentoresRecord? e) =>
      const ListEquality().hash([e?.uidMentor, e?.dataHora]);

  @override
  bool isValidKey(Object? o) => o is DisponibilidadeMentoresRecord;
}
