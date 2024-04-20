import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FormacaoAcademicaRecord extends FirestoreRecord {
  FormacaoAcademicaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "graduacao" field.
  DocumentReference? _graduacao;
  DocumentReference? get graduacao => _graduacao;
  bool hasGraduacao() => _graduacao != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "instituicao" field.
  DocumentReference? _instituicao;
  DocumentReference? get instituicao => _instituicao;
  bool hasInstituicao() => _instituicao != null;

  // "mesAnoinicio" field.
  DateTime? _mesAnoinicio;
  DateTime? get mesAnoinicio => _mesAnoinicio;
  bool hasMesAnoinicio() => _mesAnoinicio != null;

  // "mesAnoConclusao" field.
  DateTime? _mesAnoConclusao;
  DateTime? get mesAnoConclusao => _mesAnoConclusao;
  bool hasMesAnoConclusao() => _mesAnoConclusao != null;

  void _initializeFields() {
    _graduacao = snapshotData['graduacao'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _instituicao = snapshotData['instituicao'] as DocumentReference?;
    _mesAnoinicio = snapshotData['mesAnoinicio'] as DateTime?;
    _mesAnoConclusao = snapshotData['mesAnoConclusao'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('formacao_academica');

  static Stream<FormacaoAcademicaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormacaoAcademicaRecord.fromSnapshot(s));

  static Future<FormacaoAcademicaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FormacaoAcademicaRecord.fromSnapshot(s));

  static FormacaoAcademicaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FormacaoAcademicaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormacaoAcademicaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormacaoAcademicaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormacaoAcademicaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormacaoAcademicaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormacaoAcademicaRecordData({
  DocumentReference? graduacao,
  DocumentReference? user,
  DocumentReference? instituicao,
  DateTime? mesAnoinicio,
  DateTime? mesAnoConclusao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'graduacao': graduacao,
      'user': user,
      'instituicao': instituicao,
      'mesAnoinicio': mesAnoinicio,
      'mesAnoConclusao': mesAnoConclusao,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormacaoAcademicaRecordDocumentEquality
    implements Equality<FormacaoAcademicaRecord> {
  const FormacaoAcademicaRecordDocumentEquality();

  @override
  bool equals(FormacaoAcademicaRecord? e1, FormacaoAcademicaRecord? e2) {
    return e1?.graduacao == e2?.graduacao &&
        e1?.user == e2?.user &&
        e1?.instituicao == e2?.instituicao &&
        e1?.mesAnoinicio == e2?.mesAnoinicio &&
        e1?.mesAnoConclusao == e2?.mesAnoConclusao;
  }

  @override
  int hash(FormacaoAcademicaRecord? e) => const ListEquality().hash([
        e?.graduacao,
        e?.user,
        e?.instituicao,
        e?.mesAnoinicio,
        e?.mesAnoConclusao
      ]);

  @override
  bool isValidKey(Object? o) => o is FormacaoAcademicaRecord;
}
