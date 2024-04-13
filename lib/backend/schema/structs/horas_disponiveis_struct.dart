// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HorasDisponiveisStruct extends FFFirebaseStruct {
  HorasDisponiveisStruct({
    DateTime? dataHora,
    bool? disponibilidade,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dataHora = dataHora,
        _disponibilidade = disponibilidade,
        super(firestoreUtilData);

  // "dataHora" field.
  DateTime? _dataHora;
  DateTime? get dataHora => _dataHora;
  set dataHora(DateTime? val) => _dataHora = val;
  bool hasDataHora() => _dataHora != null;

  // "disponibilidade" field.
  bool? _disponibilidade;
  bool get disponibilidade => _disponibilidade ?? false;
  set disponibilidade(bool? val) => _disponibilidade = val;
  bool hasDisponibilidade() => _disponibilidade != null;

  static HorasDisponiveisStruct fromMap(Map<String, dynamic> data) =>
      HorasDisponiveisStruct(
        dataHora: data['dataHora'] as DateTime?,
        disponibilidade: data['disponibilidade'] as bool?,
      );

  static HorasDisponiveisStruct? maybeFromMap(dynamic data) => data is Map
      ? HorasDisponiveisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dataHora': _dataHora,
        'disponibilidade': _disponibilidade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dataHora': serializeParam(
          _dataHora,
          ParamType.DateTime,
        ),
        'disponibilidade': serializeParam(
          _disponibilidade,
          ParamType.bool,
        ),
      }.withoutNulls;

  static HorasDisponiveisStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HorasDisponiveisStruct(
        dataHora: deserializeParam(
          data['dataHora'],
          ParamType.DateTime,
          false,
        ),
        disponibilidade: deserializeParam(
          data['disponibilidade'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'HorasDisponiveisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HorasDisponiveisStruct &&
        dataHora == other.dataHora &&
        disponibilidade == other.disponibilidade;
  }

  @override
  int get hashCode => const ListEquality().hash([dataHora, disponibilidade]);
}

HorasDisponiveisStruct createHorasDisponiveisStruct({
  DateTime? dataHora,
  bool? disponibilidade,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HorasDisponiveisStruct(
      dataHora: dataHora,
      disponibilidade: disponibilidade,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HorasDisponiveisStruct? updateHorasDisponiveisStruct(
  HorasDisponiveisStruct? horasDisponiveis, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    horasDisponiveis
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHorasDisponiveisStructData(
  Map<String, dynamic> firestoreData,
  HorasDisponiveisStruct? horasDisponiveis,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (horasDisponiveis == null) {
    return;
  }
  if (horasDisponiveis.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && horasDisponiveis.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final horasDisponiveisData =
      getHorasDisponiveisFirestoreData(horasDisponiveis, forFieldValue);
  final nestedData =
      horasDisponiveisData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = horasDisponiveis.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHorasDisponiveisFirestoreData(
  HorasDisponiveisStruct? horasDisponiveis, [
  bool forFieldValue = false,
]) {
  if (horasDisponiveis == null) {
    return {};
  }
  final firestoreData = mapToFirestore(horasDisponiveis.toMap());

  // Add any Firestore field values
  horasDisponiveis.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHorasDisponiveisListFirestoreData(
  List<HorasDisponiveisStruct>? horasDisponiveiss,
) =>
    horasDisponiveiss
        ?.map((e) => getHorasDisponiveisFirestoreData(e, true))
        .toList() ??
    [];
