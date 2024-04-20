// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DisponibilidadeStruct extends FFFirebaseStruct {
  DisponibilidadeStruct({
    String? dia,
    DateTime? inicio,
    DateTime? fim,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dia = dia,
        _inicio = inicio,
        _fim = fim,
        super(firestoreUtilData);

  // "dia" field.
  String? _dia;
  String get dia => _dia ?? '';
  set dia(String? val) => _dia = val;
  bool hasDia() => _dia != null;

  // "inicio" field.
  DateTime? _inicio;
  DateTime? get inicio => _inicio;
  set inicio(DateTime? val) => _inicio = val;
  bool hasInicio() => _inicio != null;

  // "fim" field.
  DateTime? _fim;
  DateTime? get fim => _fim;
  set fim(DateTime? val) => _fim = val;
  bool hasFim() => _fim != null;

  static DisponibilidadeStruct fromMap(Map<String, dynamic> data) =>
      DisponibilidadeStruct(
        dia: data['dia'] as String?,
        inicio: data['inicio'] as DateTime?,
        fim: data['fim'] as DateTime?,
      );

  static DisponibilidadeStruct? maybeFromMap(dynamic data) => data is Map
      ? DisponibilidadeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dia': _dia,
        'inicio': _inicio,
        'fim': _fim,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dia': serializeParam(
          _dia,
          ParamType.String,
        ),
        'inicio': serializeParam(
          _inicio,
          ParamType.DateTime,
        ),
        'fim': serializeParam(
          _fim,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DisponibilidadeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DisponibilidadeStruct(
        dia: deserializeParam(
          data['dia'],
          ParamType.String,
          false,
        ),
        inicio: deserializeParam(
          data['inicio'],
          ParamType.DateTime,
          false,
        ),
        fim: deserializeParam(
          data['fim'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DisponibilidadeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DisponibilidadeStruct &&
        dia == other.dia &&
        inicio == other.inicio &&
        fim == other.fim;
  }

  @override
  int get hashCode => const ListEquality().hash([dia, inicio, fim]);
}

DisponibilidadeStruct createDisponibilidadeStruct({
  String? dia,
  DateTime? inicio,
  DateTime? fim,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DisponibilidadeStruct(
      dia: dia,
      inicio: inicio,
      fim: fim,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DisponibilidadeStruct? updateDisponibilidadeStruct(
  DisponibilidadeStruct? disponibilidade, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    disponibilidade
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDisponibilidadeStructData(
  Map<String, dynamic> firestoreData,
  DisponibilidadeStruct? disponibilidade,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (disponibilidade == null) {
    return;
  }
  if (disponibilidade.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && disponibilidade.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final disponibilidadeData =
      getDisponibilidadeFirestoreData(disponibilidade, forFieldValue);
  final nestedData =
      disponibilidadeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = disponibilidade.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDisponibilidadeFirestoreData(
  DisponibilidadeStruct? disponibilidade, [
  bool forFieldValue = false,
]) {
  if (disponibilidade == null) {
    return {};
  }
  final firestoreData = mapToFirestore(disponibilidade.toMap());

  // Add any Firestore field values
  disponibilidade.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDisponibilidadeListFirestoreData(
  List<DisponibilidadeStruct>? disponibilidades,
) =>
    disponibilidades
        ?.map((e) => getDisponibilidadeFirestoreData(e, true))
        .toList() ??
    [];
