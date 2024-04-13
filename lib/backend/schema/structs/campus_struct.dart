// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CampusStruct extends FFFirebaseStruct {
  CampusStruct({
    DocumentReference? id,
    String? nome,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _nome = nome,
        super(firestoreUtilData);

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  set id(DocumentReference? val) => _id = val;
  bool hasId() => _id != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  static CampusStruct fromMap(Map<String, dynamic> data) => CampusStruct(
        id: data['id'] as DocumentReference?,
        nome: data['nome'] as String?,
      );

  static CampusStruct? maybeFromMap(dynamic data) =>
      data is Map ? CampusStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.DocumentReference,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
      }.withoutNulls;

  static CampusStruct fromSerializableMap(Map<String, dynamic> data) =>
      CampusStruct(
        id: deserializeParam(
          data['id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Campus'],
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CampusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CampusStruct && id == other.id && nome == other.nome;
  }

  @override
  int get hashCode => const ListEquality().hash([id, nome]);
}

CampusStruct createCampusStruct({
  DocumentReference? id,
  String? nome,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CampusStruct(
      id: id,
      nome: nome,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CampusStruct? updateCampusStruct(
  CampusStruct? campus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    campus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCampusStructData(
  Map<String, dynamic> firestoreData,
  CampusStruct? campus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (campus == null) {
    return;
  }
  if (campus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && campus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final campusData = getCampusFirestoreData(campus, forFieldValue);
  final nestedData = campusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = campus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCampusFirestoreData(
  CampusStruct? campus, [
  bool forFieldValue = false,
]) {
  if (campus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(campus.toMap());

  // Add any Firestore field values
  campus.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCampusListFirestoreData(
  List<CampusStruct>? campuss,
) =>
    campuss?.map((e) => getCampusFirestoreData(e, true)).toList() ?? [];
