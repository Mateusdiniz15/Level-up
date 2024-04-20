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

  // "numeroMentorias" field.
  int? _numeroMentorias;
  int get numeroMentorias => _numeroMentorias ?? 0;
  bool hasNumeroMentorias() => _numeroMentorias != null;

  // "sobreMim" field.
  String? _sobreMim;
  String get sobreMim => _sobreMim ?? '';
  bool hasSobreMim() => _sobreMim != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "informcoes_adicionais" field.
  String? _informcoesAdicionais;
  String get informcoesAdicionais => _informcoesAdicionais ?? '';
  bool hasInformcoesAdicionais() => _informcoesAdicionais != null;

  // "campus" field.
  String? _campus;
  String get campus => _campus ?? '';
  bool hasCampus() => _campus != null;

  // "aceite" field.
  bool? _aceite;
  bool get aceite => _aceite ?? false;
  bool hasAceite() => _aceite != null;

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
    _numeroMentorias = castToType<int>(snapshotData['numeroMentorias']);
    _sobreMim = snapshotData['sobreMim'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _informcoesAdicionais = snapshotData['informcoes_adicionais'] as String?;
    _campus = snapshotData['campus'] as String?;
    _aceite = snapshotData['aceite'] as bool?;
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
  int? numeroMentorias,
  String? sobreMim,
  double? rating,
  String? informcoesAdicionais,
  String? campus,
  bool? aceite,
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
      'numeroMentorias': numeroMentorias,
      'sobreMim': sobreMim,
      'rating': rating,
      'informcoes_adicionais': informcoesAdicionais,
      'campus': campus,
      'aceite': aceite,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.tipoUsuario == e2?.tipoUsuario &&
        e1?.especialidade == e2?.especialidade &&
        e1?.linkedIn == e2?.linkedIn &&
        e1?.numeroMentorias == e2?.numeroMentorias &&
        e1?.sobreMim == e2?.sobreMim &&
        e1?.rating == e2?.rating &&
        e1?.informcoesAdicionais == e2?.informcoesAdicionais &&
        e1?.campus == e2?.campus &&
        e1?.aceite == e2?.aceite;
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
        e?.numeroMentorias,
        e?.sobreMim,
        e?.rating,
        e?.informcoesAdicionais,
        e?.campus,
        e?.aceite
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
