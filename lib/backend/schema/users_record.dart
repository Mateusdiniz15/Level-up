import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "tipoUsuario" field.
  String? _tipoUsuario;
  String get tipoUsuario => _tipoUsuario ?? '';
  bool hasTipoUsuario() => _tipoUsuario != null;

  // "especialidade" field.
  String? _especialidade;
  String get especialidade => _especialidade ?? '';
  bool hasEspecialidade() => _especialidade != null;

  // "linkedIn" field.
  String? _linkedIn;
  String get linkedIn => _linkedIn ?? '';
  bool hasLinkedIn() => _linkedIn != null;

  // "quantidadeMentorias" field.
  int? _quantidadeMentorias;
  int get quantidadeMentorias => _quantidadeMentorias ?? 0;
  bool hasQuantidadeMentorias() => _quantidadeMentorias != null;

  // "sobreMim" field.
  String? _sobreMim;
  String get sobreMim => _sobreMim ?? '';
  bool hasSobreMim() => _sobreMim != null;

  // "formacoesAcademica" field.
  List<FormacaoStruct>? _formacoesAcademica;
  List<FormacaoStruct> get formacoesAcademica =>
      _formacoesAcademica ?? const [];
  bool hasFormacoesAcademica() => _formacoesAcademica != null;

  // "objetivos" field.
  String? _objetivos;
  String get objetivos => _objetivos ?? '';
  bool hasObjetivos() => _objetivos != null;

  // "disponibilidade" field.
  List<HorasDisponiveisStruct>? _disponibilidade;
  List<HorasDisponiveisStruct> get disponibilidade =>
      _disponibilidade ?? const [];
  bool hasDisponibilidade() => _disponibilidade != null;

  // "termoPrivacidade" field.
  bool? _termoPrivacidade;
  bool get termoPrivacidade => _termoPrivacidade ?? false;
  bool hasTermoPrivacidade() => _termoPrivacidade != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "instituicao" field.
  InstituicaoStruct? _instituicao;
  InstituicaoStruct get instituicao => _instituicao ?? InstituicaoStruct();
  bool hasInstituicao() => _instituicao != null;

  // "campus" field.
  CampusStruct? _campus;
  CampusStruct get campus => _campus ?? CampusStruct();
  bool hasCampus() => _campus != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _tipoUsuario = snapshotData['tipoUsuario'] as String?;
    _especialidade = snapshotData['especialidade'] as String?;
    _linkedIn = snapshotData['linkedIn'] as String?;
    _quantidadeMentorias = castToType<int>(snapshotData['quantidadeMentorias']);
    _sobreMim = snapshotData['sobreMim'] as String?;
    _formacoesAcademica = getStructList(
      snapshotData['formacoesAcademica'],
      FormacaoStruct.fromMap,
    );
    _objetivos = snapshotData['objetivos'] as String?;
    _disponibilidade = getStructList(
      snapshotData['disponibilidade'],
      HorasDisponiveisStruct.fromMap,
    );
    _termoPrivacidade = snapshotData['termoPrivacidade'] as bool?;
    _rating = castToType<double>(snapshotData['rating']);
    _instituicao = InstituicaoStruct.maybeFromMap(snapshotData['instituicao']);
    _campus = CampusStruct.maybeFromMap(snapshotData['campus']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
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
  String? objetivos,
  bool? termoPrivacidade,
  double? rating,
  InstituicaoStruct? instituicao,
  CampusStruct? campus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'tipoUsuario': tipoUsuario,
      'especialidade': especialidade,
      'linkedIn': linkedIn,
      'quantidadeMentorias': quantidadeMentorias,
      'sobreMim': sobreMim,
      'objetivos': objetivos,
      'termoPrivacidade': termoPrivacidade,
      'rating': rating,
      'instituicao': InstituicaoStruct().toMap(),
      'campus': CampusStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "instituicao" field.
  addInstituicaoStructData(firestoreData, instituicao, 'instituicao');

  // Handle nested data for "campus" field.
  addCampusStructData(firestoreData, campus, 'campus');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.tipoUsuario == e2?.tipoUsuario &&
        e1?.especialidade == e2?.especialidade &&
        e1?.linkedIn == e2?.linkedIn &&
        e1?.quantidadeMentorias == e2?.quantidadeMentorias &&
        e1?.sobreMim == e2?.sobreMim &&
        listEquality.equals(e1?.formacoesAcademica, e2?.formacoesAcademica) &&
        e1?.objetivos == e2?.objetivos &&
        listEquality.equals(e1?.disponibilidade, e2?.disponibilidade) &&
        e1?.termoPrivacidade == e2?.termoPrivacidade &&
        e1?.rating == e2?.rating &&
        e1?.instituicao == e2?.instituicao &&
        e1?.campus == e2?.campus;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.tipoUsuario,
        e?.especialidade,
        e?.linkedIn,
        e?.quantidadeMentorias,
        e?.sobreMim,
        e?.formacoesAcademica,
        e?.objetivos,
        e?.disponibilidade,
        e?.termoPrivacidade,
        e?.rating,
        e?.instituicao,
        e?.campus
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
