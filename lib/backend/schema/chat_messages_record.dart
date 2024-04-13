import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "chat_user" field.
  DocumentReference? _chatUser;
  DocumentReference? get chatUser => _chatUser;
  bool hasChatUser() => _chatUser != null;

  // "arquivo" field.
  String? _arquivo;
  String get arquivo => _arquivo ?? '';
  bool hasArquivo() => _arquivo != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _image = snapshotData['image'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _chatUser = snapshotData['chat_user'] as DocumentReference?;
    _arquivo = snapshotData['arquivo'] as String?;
    _video = snapshotData['video'] as String?;
    _audio = snapshotData['audio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_messages');

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  String? text,
  String? image,
  DateTime? timestamp,
  DocumentReference? user,
  DocumentReference? chatUser,
  String? arquivo,
  String? video,
  String? audio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'image': image,
      'timestamp': timestamp,
      'user': user,
      'chat_user': chatUser,
      'arquivo': arquivo,
      'video': video,
      'audio': audio,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.image == e2?.image &&
        e1?.timestamp == e2?.timestamp &&
        e1?.user == e2?.user &&
        e1?.chatUser == e2?.chatUser &&
        e1?.arquivo == e2?.arquivo &&
        e1?.video == e2?.video &&
        e1?.audio == e2?.audio;
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality().hash([
        e?.text,
        e?.image,
        e?.timestamp,
        e?.user,
        e?.chatUser,
        e?.arquivo,
        e?.video,
        e?.audio
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
