// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstituicaoStruct extends FFFirebaseStruct {
  InstituicaoStruct({
    String? nome,
    List<CampusStruct>? campus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _campus = campus,
        super(firestoreUtilData);

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  // "campus" field.
  List<CampusStruct>? _campus;
  List<CampusStruct> get campus => _campus ?? const [];
  set campus(List<CampusStruct>? val) => _campus = val;
  void updateCampus(Function(List<CampusStruct>) updateFn) =>
      updateFn(_campus ??= []);
  bool hasCampus() => _campus != null;

  static InstituicaoStruct fromMap(Map<String, dynamic> data) =>
      InstituicaoStruct(
        nome: data['nome'] as String?,
        campus: getStructList(
          data['campus'],
          CampusStruct.fromMap,
        ),
      );

  static InstituicaoStruct? maybeFromMap(dynamic data) => data is Map
      ? InstituicaoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'campus': _campus?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'campus': serializeParam(
          _campus,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static InstituicaoStruct fromSerializableMap(Map<String, dynamic> data) =>
      InstituicaoStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        campus: deserializeStructParam<CampusStruct>(
          data['campus'],
          ParamType.DataStruct,
          true,
          structBuilder: CampusStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'InstituicaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InstituicaoStruct &&
        nome == other.nome &&
        listEquality.equals(campus, other.campus);
  }

  @override
  int get hashCode => const ListEquality().hash([nome, campus]);
}

InstituicaoStruct createInstituicaoStruct({
  String? nome,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InstituicaoStruct(
      nome: nome,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InstituicaoStruct? updateInstituicaoStruct(
  InstituicaoStruct? instituicao, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    instituicao
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInstituicaoStructData(
  Map<String, dynamic> firestoreData,
  InstituicaoStruct? instituicao,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (instituicao == null) {
    return;
  }
  if (instituicao.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && instituicao.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final instituicaoData =
      getInstituicaoFirestoreData(instituicao, forFieldValue);
  final nestedData =
      instituicaoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = instituicao.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInstituicaoFirestoreData(
  InstituicaoStruct? instituicao, [
  bool forFieldValue = false,
]) {
  if (instituicao == null) {
    return {};
  }
  final firestoreData = mapToFirestore(instituicao.toMap());

  // Add any Firestore field values
  instituicao.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInstituicaoListFirestoreData(
  List<InstituicaoStruct>? instituicaos,
) =>
    instituicaos?.map((e) => getInstituicaoFirestoreData(e, true)).toList() ??
    [];
