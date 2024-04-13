// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormacaoStruct extends FFFirebaseStruct {
  FormacaoStruct({
    String? graduacao,
    String? instituicao,
    DateTime? mesAnoInicio,
    DateTime? mesAnoConclusao,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _graduacao = graduacao,
        _instituicao = instituicao,
        _mesAnoInicio = mesAnoInicio,
        _mesAnoConclusao = mesAnoConclusao,
        super(firestoreUtilData);

  // "graduacao" field.
  String? _graduacao;
  String get graduacao => _graduacao ?? '';
  set graduacao(String? val) => _graduacao = val;
  bool hasGraduacao() => _graduacao != null;

  // "instituicao" field.
  String? _instituicao;
  String get instituicao => _instituicao ?? '';
  set instituicao(String? val) => _instituicao = val;
  bool hasInstituicao() => _instituicao != null;

  // "mesAnoInicio" field.
  DateTime? _mesAnoInicio;
  DateTime? get mesAnoInicio => _mesAnoInicio;
  set mesAnoInicio(DateTime? val) => _mesAnoInicio = val;
  bool hasMesAnoInicio() => _mesAnoInicio != null;

  // "mesAnoConclusao" field.
  DateTime? _mesAnoConclusao;
  DateTime? get mesAnoConclusao => _mesAnoConclusao;
  set mesAnoConclusao(DateTime? val) => _mesAnoConclusao = val;
  bool hasMesAnoConclusao() => _mesAnoConclusao != null;

  static FormacaoStruct fromMap(Map<String, dynamic> data) => FormacaoStruct(
        graduacao: data['graduacao'] as String?,
        instituicao: data['instituicao'] as String?,
        mesAnoInicio: data['mesAnoInicio'] as DateTime?,
        mesAnoConclusao: data['mesAnoConclusao'] as DateTime?,
      );

  static FormacaoStruct? maybeFromMap(dynamic data) =>
      data is Map ? FormacaoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'graduacao': _graduacao,
        'instituicao': _instituicao,
        'mesAnoInicio': _mesAnoInicio,
        'mesAnoConclusao': _mesAnoConclusao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'graduacao': serializeParam(
          _graduacao,
          ParamType.String,
        ),
        'instituicao': serializeParam(
          _instituicao,
          ParamType.String,
        ),
        'mesAnoInicio': serializeParam(
          _mesAnoInicio,
          ParamType.DateTime,
        ),
        'mesAnoConclusao': serializeParam(
          _mesAnoConclusao,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static FormacaoStruct fromSerializableMap(Map<String, dynamic> data) =>
      FormacaoStruct(
        graduacao: deserializeParam(
          data['graduacao'],
          ParamType.String,
          false,
        ),
        instituicao: deserializeParam(
          data['instituicao'],
          ParamType.String,
          false,
        ),
        mesAnoInicio: deserializeParam(
          data['mesAnoInicio'],
          ParamType.DateTime,
          false,
        ),
        mesAnoConclusao: deserializeParam(
          data['mesAnoConclusao'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'FormacaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FormacaoStruct &&
        graduacao == other.graduacao &&
        instituicao == other.instituicao &&
        mesAnoInicio == other.mesAnoInicio &&
        mesAnoConclusao == other.mesAnoConclusao;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([graduacao, instituicao, mesAnoInicio, mesAnoConclusao]);
}

FormacaoStruct createFormacaoStruct({
  String? graduacao,
  String? instituicao,
  DateTime? mesAnoInicio,
  DateTime? mesAnoConclusao,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FormacaoStruct(
      graduacao: graduacao,
      instituicao: instituicao,
      mesAnoInicio: mesAnoInicio,
      mesAnoConclusao: mesAnoConclusao,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FormacaoStruct? updateFormacaoStruct(
  FormacaoStruct? formacao, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    formacao
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFormacaoStructData(
  Map<String, dynamic> firestoreData,
  FormacaoStruct? formacao,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (formacao == null) {
    return;
  }
  if (formacao.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && formacao.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final formacaoData = getFormacaoFirestoreData(formacao, forFieldValue);
  final nestedData = formacaoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = formacao.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFormacaoFirestoreData(
  FormacaoStruct? formacao, [
  bool forFieldValue = false,
]) {
  if (formacao == null) {
    return {};
  }
  final firestoreData = mapToFirestore(formacao.toMap());

  // Add any Firestore field values
  formacao.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFormacaoListFirestoreData(
  List<FormacaoStruct>? formacaos,
) =>
    formacaos?.map((e) => getFormacaoFirestoreData(e, true)).toList() ?? [];
