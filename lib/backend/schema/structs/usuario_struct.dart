// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuarioStruct extends FFFirebaseStruct {
  UsuarioStruct({
    String? email,
    String? displayName,
    String? photoUrl,
    String? uid,
    DateTime? createdTime,
    String? phoneNumber,
    String? tipoUsuario,
    String? especialidade,
    String? linkedIn,
    int? quantidadeMentorias,
    String? sobreMim,
    CampusStruct? campus,
    DocumentReference? id,
    List<FormacaoStruct>? formacoesAcademicas,
    String? objetivos,
    List<HorasDisponiveisStruct>? disponibilidade,
    bool? termoPrivacidade,
    double? rating,
    InstituicaoStruct? instituicao,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _displayName = displayName,
        _photoUrl = photoUrl,
        _uid = uid,
        _createdTime = createdTime,
        _phoneNumber = phoneNumber,
        _tipoUsuario = tipoUsuario,
        _especialidade = especialidade,
        _linkedIn = linkedIn,
        _quantidadeMentorias = quantidadeMentorias,
        _sobreMim = sobreMim,
        _campus = campus,
        _id = id,
        _formacoesAcademicas = formacoesAcademicas,
        _objetivos = objetivos,
        _disponibilidade = disponibilidade,
        _termoPrivacidade = termoPrivacidade,
        _rating = rating,
        _instituicao = instituicao,
        super(firestoreUtilData);

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "tipoUsuario" field.
  String? _tipoUsuario;
  String get tipoUsuario => _tipoUsuario ?? '';
  set tipoUsuario(String? val) => _tipoUsuario = val;
  bool hasTipoUsuario() => _tipoUsuario != null;

  // "especialidade" field.
  String? _especialidade;
  String get especialidade => _especialidade ?? '';
  set especialidade(String? val) => _especialidade = val;
  bool hasEspecialidade() => _especialidade != null;

  // "linkedIn" field.
  String? _linkedIn;
  String get linkedIn => _linkedIn ?? '';
  set linkedIn(String? val) => _linkedIn = val;
  bool hasLinkedIn() => _linkedIn != null;

  // "quantidadeMentorias" field.
  int? _quantidadeMentorias;
  int get quantidadeMentorias => _quantidadeMentorias ?? 0;
  set quantidadeMentorias(int? val) => _quantidadeMentorias = val;
  void incrementQuantidadeMentorias(int amount) =>
      _quantidadeMentorias = quantidadeMentorias + amount;
  bool hasQuantidadeMentorias() => _quantidadeMentorias != null;

  // "sobreMim" field.
  String? _sobreMim;
  String get sobreMim => _sobreMim ?? '';
  set sobreMim(String? val) => _sobreMim = val;
  bool hasSobreMim() => _sobreMim != null;

  // "campus" field.
  CampusStruct? _campus;
  CampusStruct get campus => _campus ?? CampusStruct();
  set campus(CampusStruct? val) => _campus = val;
  void updateCampus(Function(CampusStruct) updateFn) =>
      updateFn(_campus ??= CampusStruct());
  bool hasCampus() => _campus != null;

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  set id(DocumentReference? val) => _id = val;
  bool hasId() => _id != null;

  // "formacoesAcademicas" field.
  List<FormacaoStruct>? _formacoesAcademicas;
  List<FormacaoStruct> get formacoesAcademicas =>
      _formacoesAcademicas ?? const [];
  set formacoesAcademicas(List<FormacaoStruct>? val) =>
      _formacoesAcademicas = val;
  void updateFormacoesAcademicas(Function(List<FormacaoStruct>) updateFn) =>
      updateFn(_formacoesAcademicas ??= []);
  bool hasFormacoesAcademicas() => _formacoesAcademicas != null;

  // "objetivos" field.
  String? _objetivos;
  String get objetivos => _objetivos ?? '';
  set objetivos(String? val) => _objetivos = val;
  bool hasObjetivos() => _objetivos != null;

  // "disponibilidade" field.
  List<HorasDisponiveisStruct>? _disponibilidade;
  List<HorasDisponiveisStruct> get disponibilidade =>
      _disponibilidade ?? const [];
  set disponibilidade(List<HorasDisponiveisStruct>? val) =>
      _disponibilidade = val;
  void updateDisponibilidade(Function(List<HorasDisponiveisStruct>) updateFn) =>
      updateFn(_disponibilidade ??= []);
  bool hasDisponibilidade() => _disponibilidade != null;

  // "termoPrivacidade" field.
  bool? _termoPrivacidade;
  bool get termoPrivacidade => _termoPrivacidade ?? false;
  set termoPrivacidade(bool? val) => _termoPrivacidade = val;
  bool hasTermoPrivacidade() => _termoPrivacidade != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  set rating(double? val) => _rating = val;
  void incrementRating(double amount) => _rating = rating + amount;
  bool hasRating() => _rating != null;

  // "instituicao" field.
  InstituicaoStruct? _instituicao;
  InstituicaoStruct get instituicao => _instituicao ?? InstituicaoStruct();
  set instituicao(InstituicaoStruct? val) => _instituicao = val;
  void updateInstituicao(Function(InstituicaoStruct) updateFn) =>
      updateFn(_instituicao ??= InstituicaoStruct());
  bool hasInstituicao() => _instituicao != null;

  static UsuarioStruct fromMap(Map<String, dynamic> data) => UsuarioStruct(
        email: data['email'] as String?,
        displayName: data['display_name'] as String?,
        photoUrl: data['photo_url'] as String?,
        uid: data['uid'] as String?,
        createdTime: data['created_time'] as DateTime?,
        phoneNumber: data['phone_number'] as String?,
        tipoUsuario: data['tipoUsuario'] as String?,
        especialidade: data['especialidade'] as String?,
        linkedIn: data['linkedIn'] as String?,
        quantidadeMentorias: castToType<int>(data['quantidadeMentorias']),
        sobreMim: data['sobreMim'] as String?,
        campus: CampusStruct.maybeFromMap(data['campus']),
        id: data['id'] as DocumentReference?,
        formacoesAcademicas: getStructList(
          data['formacoesAcademicas'],
          FormacaoStruct.fromMap,
        ),
        objetivos: data['objetivos'] as String?,
        disponibilidade: getStructList(
          data['disponibilidade'],
          HorasDisponiveisStruct.fromMap,
        ),
        termoPrivacidade: data['termoPrivacidade'] as bool?,
        rating: castToType<double>(data['rating']),
        instituicao: InstituicaoStruct.maybeFromMap(data['instituicao']),
      );

  static UsuarioStruct? maybeFromMap(dynamic data) =>
      data is Map ? UsuarioStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'display_name': _displayName,
        'photo_url': _photoUrl,
        'uid': _uid,
        'created_time': _createdTime,
        'phone_number': _phoneNumber,
        'tipoUsuario': _tipoUsuario,
        'especialidade': _especialidade,
        'linkedIn': _linkedIn,
        'quantidadeMentorias': _quantidadeMentorias,
        'sobreMim': _sobreMim,
        'campus': _campus?.toMap(),
        'id': _id,
        'formacoesAcademicas':
            _formacoesAcademicas?.map((e) => e.toMap()).toList(),
        'objetivos': _objetivos,
        'disponibilidade': _disponibilidade?.map((e) => e.toMap()).toList(),
        'termoPrivacidade': _termoPrivacidade,
        'rating': _rating,
        'instituicao': _instituicao?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'tipoUsuario': serializeParam(
          _tipoUsuario,
          ParamType.String,
        ),
        'especialidade': serializeParam(
          _especialidade,
          ParamType.String,
        ),
        'linkedIn': serializeParam(
          _linkedIn,
          ParamType.String,
        ),
        'quantidadeMentorias': serializeParam(
          _quantidadeMentorias,
          ParamType.int,
        ),
        'sobreMim': serializeParam(
          _sobreMim,
          ParamType.String,
        ),
        'campus': serializeParam(
          _campus,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.DocumentReference,
        ),
        'formacoesAcademicas': serializeParam(
          _formacoesAcademicas,
          ParamType.DataStruct,
          true,
        ),
        'objetivos': serializeParam(
          _objetivos,
          ParamType.String,
        ),
        'disponibilidade': serializeParam(
          _disponibilidade,
          ParamType.DataStruct,
          true,
        ),
        'termoPrivacidade': serializeParam(
          _termoPrivacidade,
          ParamType.bool,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.double,
        ),
        'instituicao': serializeParam(
          _instituicao,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UsuarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsuarioStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        tipoUsuario: deserializeParam(
          data['tipoUsuario'],
          ParamType.String,
          false,
        ),
        especialidade: deserializeParam(
          data['especialidade'],
          ParamType.String,
          false,
        ),
        linkedIn: deserializeParam(
          data['linkedIn'],
          ParamType.String,
          false,
        ),
        quantidadeMentorias: deserializeParam(
          data['quantidadeMentorias'],
          ParamType.int,
          false,
        ),
        sobreMim: deserializeParam(
          data['sobreMim'],
          ParamType.String,
          false,
        ),
        campus: deserializeStructParam(
          data['campus'],
          ParamType.DataStruct,
          false,
          structBuilder: CampusStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Users'],
        ),
        formacoesAcademicas: deserializeStructParam<FormacaoStruct>(
          data['formacoesAcademicas'],
          ParamType.DataStruct,
          true,
          structBuilder: FormacaoStruct.fromSerializableMap,
        ),
        objetivos: deserializeParam(
          data['objetivos'],
          ParamType.String,
          false,
        ),
        disponibilidade: deserializeStructParam<HorasDisponiveisStruct>(
          data['disponibilidade'],
          ParamType.DataStruct,
          true,
          structBuilder: HorasDisponiveisStruct.fromSerializableMap,
        ),
        termoPrivacidade: deserializeParam(
          data['termoPrivacidade'],
          ParamType.bool,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.double,
          false,
        ),
        instituicao: deserializeStructParam(
          data['instituicao'],
          ParamType.DataStruct,
          false,
          structBuilder: InstituicaoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UsuarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UsuarioStruct &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        tipoUsuario == other.tipoUsuario &&
        especialidade == other.especialidade &&
        linkedIn == other.linkedIn &&
        quantidadeMentorias == other.quantidadeMentorias &&
        sobreMim == other.sobreMim &&
        campus == other.campus &&
        id == other.id &&
        listEquality.equals(formacoesAcademicas, other.formacoesAcademicas) &&
        objetivos == other.objetivos &&
        listEquality.equals(disponibilidade, other.disponibilidade) &&
        termoPrivacidade == other.termoPrivacidade &&
        rating == other.rating &&
        instituicao == other.instituicao;
  }

  @override
  int get hashCode => const ListEquality().hash([
        email,
        displayName,
        photoUrl,
        uid,
        createdTime,
        phoneNumber,
        tipoUsuario,
        especialidade,
        linkedIn,
        quantidadeMentorias,
        sobreMim,
        campus,
        id,
        formacoesAcademicas,
        objetivos,
        disponibilidade,
        termoPrivacidade,
        rating,
        instituicao
      ]);
}

UsuarioStruct createUsuarioStruct({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? tipoUsuario,
  String? especialidade,
  String? linkedIn,
  int? quantidadeMentorias,
  String? sobreMim,
  CampusStruct? campus,
  DocumentReference? id,
  String? objetivos,
  bool? termoPrivacidade,
  double? rating,
  InstituicaoStruct? instituicao,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsuarioStruct(
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      uid: uid,
      createdTime: createdTime,
      phoneNumber: phoneNumber,
      tipoUsuario: tipoUsuario,
      especialidade: especialidade,
      linkedIn: linkedIn,
      quantidadeMentorias: quantidadeMentorias,
      sobreMim: sobreMim,
      campus: campus ?? (clearUnsetFields ? CampusStruct() : null),
      id: id,
      objetivos: objetivos,
      termoPrivacidade: termoPrivacidade,
      rating: rating,
      instituicao:
          instituicao ?? (clearUnsetFields ? InstituicaoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsuarioStruct? updateUsuarioStruct(
  UsuarioStruct? usuario, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usuario
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsuarioStructData(
  Map<String, dynamic> firestoreData,
  UsuarioStruct? usuario,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usuario == null) {
    return;
  }
  if (usuario.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && usuario.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usuarioData = getUsuarioFirestoreData(usuario, forFieldValue);
  final nestedData = usuarioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = usuario.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsuarioFirestoreData(
  UsuarioStruct? usuario, [
  bool forFieldValue = false,
]) {
  if (usuario == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usuario.toMap());

  // Handle nested data for "campus" field.
  addCampusStructData(
    firestoreData,
    usuario.hasCampus() ? usuario.campus : null,
    'campus',
    forFieldValue,
  );

  // Handle nested data for "instituicao" field.
  addInstituicaoStructData(
    firestoreData,
    usuario.hasInstituicao() ? usuario.instituicao : null,
    'instituicao',
    forFieldValue,
  );

  // Add any Firestore field values
  usuario.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsuarioListFirestoreData(
  List<UsuarioStruct>? usuarios,
) =>
    usuarios?.map((e) => getUsuarioFirestoreData(e, true)).toList() ?? [];
