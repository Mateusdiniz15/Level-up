import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MentoriasRecord extends FirestoreRecord {
  MentoriasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "criada" field.
  DateTime? _criada;
  DateTime? get criada => _criada;
  bool hasCriada() => _criada != null;

  // "finalizada" field.
  bool? _finalizada;
  bool get finalizada => _finalizada ?? false;
  bool hasFinalizada() => _finalizada != null;

  // "aprovar" field.
  bool? _aprovar;
  bool get aprovar => _aprovar ?? false;
  bool hasAprovar() => _aprovar != null;

  // "hora" field.
  DateTime? _hora;
  DateTime? get hora => _hora;
  bool hasHora() => _hora != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "mentor" field.
  UsuarioStruct? _mentor;
  UsuarioStruct get mentor => _mentor ?? UsuarioStruct();
  bool hasMentor() => _mentor != null;

  // "aluno" field.
  UsuarioStruct? _aluno;
  UsuarioStruct get aluno => _aluno ?? UsuarioStruct();
  bool hasAluno() => _aluno != null;

  void _initializeFields() {
    _criada = snapshotData['criada'] as DateTime?;
    _finalizada = snapshotData['finalizada'] as bool?;
    _aprovar = snapshotData['aprovar'] as bool?;
    _hora = snapshotData['hora'] as DateTime?;
    _data = snapshotData['data'] as DateTime?;
    _mentor = UsuarioStruct.maybeFromMap(snapshotData['mentor']);
    _aluno = UsuarioStruct.maybeFromMap(snapshotData['aluno']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Mentorias');

  static Stream<MentoriasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MentoriasRecord.fromSnapshot(s));

  static Future<MentoriasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MentoriasRecord.fromSnapshot(s));

  static MentoriasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MentoriasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MentoriasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MentoriasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MentoriasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MentoriasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMentoriasRecordData({
  DateTime? criada,
  bool? finalizada,
  bool? aprovar,
  DateTime? hora,
  DateTime? data,
  UsuarioStruct? mentor,
  UsuarioStruct? aluno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'criada': criada,
      'finalizada': finalizada,
      'aprovar': aprovar,
      'hora': hora,
      'data': data,
      'mentor': UsuarioStruct().toMap(),
      'aluno': UsuarioStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "mentor" field.
  addUsuarioStructData(firestoreData, mentor, 'mentor');

  // Handle nested data for "aluno" field.
  addUsuarioStructData(firestoreData, aluno, 'aluno');

  return firestoreData;
}

class MentoriasRecordDocumentEquality implements Equality<MentoriasRecord> {
  const MentoriasRecordDocumentEquality();

  @override
  bool equals(MentoriasRecord? e1, MentoriasRecord? e2) {
    return e1?.criada == e2?.criada &&
        e1?.finalizada == e2?.finalizada &&
        e1?.aprovar == e2?.aprovar &&
        e1?.hora == e2?.hora &&
        e1?.data == e2?.data &&
        e1?.mentor == e2?.mentor &&
        e1?.aluno == e2?.aluno;
  }

  @override
  int hash(MentoriasRecord? e) => const ListEquality().hash([
        e?.criada,
        e?.finalizada,
        e?.aprovar,
        e?.hora,
        e?.data,
        e?.mentor,
        e?.aluno
      ]);

  @override
  bool isValidKey(Object? o) => o is MentoriasRecord;
}
