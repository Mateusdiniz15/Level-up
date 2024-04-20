// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataHorasStruct extends FFFirebaseStruct {
  DataHorasStruct({
    DateTime? data,
    List<DateTime>? horas,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        _horas = horas,
        super(firestoreUtilData);

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;
  bool hasData() => _data != null;

  // "horas" field.
  List<DateTime>? _horas;
  List<DateTime> get horas => _horas ?? const [];
  set horas(List<DateTime>? val) => _horas = val;
  void updateHoras(Function(List<DateTime>) updateFn) =>
      updateFn(_horas ??= []);
  bool hasHoras() => _horas != null;

  static DataHorasStruct fromMap(Map<String, dynamic> data) => DataHorasStruct(
        data: data['data'] as DateTime?,
        horas: getDataList(data['horas']),
      );

  static DataHorasStruct? maybeFromMap(dynamic data) => data is Map
      ? DataHorasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data,
        'horas': _horas,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
        'horas': serializeParam(
          _horas,
          ParamType.DateTime,
          true,
        ),
      }.withoutNulls;

  static DataHorasStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataHorasStruct(
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
        horas: deserializeParam<DateTime>(
          data['horas'],
          ParamType.DateTime,
          true,
        ),
      );

  @override
  String toString() => 'DataHorasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataHorasStruct &&
        data == other.data &&
        listEquality.equals(horas, other.horas);
  }

  @override
  int get hashCode => const ListEquality().hash([data, horas]);
}

DataHorasStruct createDataHorasStruct({
  DateTime? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataHorasStruct(
      data: data,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataHorasStruct? updateDataHorasStruct(
  DataHorasStruct? dataHoras, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataHoras
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataHorasStructData(
  Map<String, dynamic> firestoreData,
  DataHorasStruct? dataHoras,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataHoras == null) {
    return;
  }
  if (dataHoras.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dataHoras.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataHorasData = getDataHorasFirestoreData(dataHoras, forFieldValue);
  final nestedData = dataHorasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dataHoras.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataHorasFirestoreData(
  DataHorasStruct? dataHoras, [
  bool forFieldValue = false,
]) {
  if (dataHoras == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataHoras.toMap());

  // Add any Firestore field values
  dataHoras.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataHorasListFirestoreData(
  List<DataHorasStruct>? dataHorass,
) =>
    dataHorass?.map((e) => getDataHorasFirestoreData(e, true)).toList() ?? [];
