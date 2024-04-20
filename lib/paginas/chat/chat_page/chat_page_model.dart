import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  Local state fields for this page.

  DocumentReference? chatRef;

  int indexaLocalState = 0;

  bool audio = true;

  bool photoVideo = false;

  bool leituraLocalState = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in chatPage widget.
  ChatsRecord? readChat;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Custom Action - splitFileAction] action in Icon widget.
  String? extension;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  ChatMessagesRecord? outCreateVideosChat;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  ChatMessagesRecord? outCreateAudioChat;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  ChatMessagesRecord? outCreateImagemChat;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  ChatMessagesRecord? outCreateFilesChat;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in videoIcon widget.
  ChatMessagesRecord? outCreateImageChat;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Backend Call - Create Document] action in photoIcon widget.
  ChatMessagesRecord? outCreateVideoRecChat;
  // State field(s) for txtMensagem widget.
  FocusNode? txtMensagemFocusNode;
  TextEditingController? txtMensagemTextController;
  String? Function(BuildContext, String?)? txtMensagemTextControllerValidator;
  AudioRecorder? audioRecorder;
  String? outStopAudio;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - Create Document] action in stopRec widget.
  ChatMessagesRecord? outCreateStopAudio;
  // Stores action output result for [Backend Call - Create Document] action in envioMensagem widget.
  ChatMessagesRecord? outCreateMessage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtMensagemFocusNode?.dispose();
    txtMensagemTextController?.dispose();
  }
}
