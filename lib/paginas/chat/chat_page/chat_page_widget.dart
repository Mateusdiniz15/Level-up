import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/upload_data.dart';
import '/paginas/componentes/sem_item/sem_item_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    super.key,
    this.pChatUser,
    required this.userDoc,
  });

  final DocumentReference? pChatUser;
  final UsersRecord? userDoc;

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.readChat = await ChatsRecord.getDocumentOnce(widget.pChatUser!);
      if (currentUserReference != currentUserReference) {
        await widget.pChatUser!.update(createChatsRecordData(
          leitura: true,
        ));
      } else {
        return;
      }
    });

    _model.txtMensagemTextController ??= TextEditingController();
    _model.txtMensagemFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 52.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: CachedNetworkImage(
                                  fadeInDuration: const Duration(milliseconds: 500),
                                  fadeOutDuration: const Duration(milliseconds: 500),
                                  imageUrl: valueOrDefault<String>(
                                    widget.userDoc?.photoUrl,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.userDoc?.displayName,
                                    'Nome',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (false)
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 6.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: const Icon(
                              Icons.video_camera_front_rounded,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        if (false)
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 6.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: const Icon(
                              Icons.person_add_rounded,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                      ].divide(const SizedBox(width: 5.0)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<ChatMessagesRecord>>(
                          stream: queryChatMessagesRecord(
                            queryBuilder: (chatMessagesRecord) =>
                                chatMessagesRecord
                                    .where(
                                      'chat_user',
                                      isEqualTo: widget.pChatUser,
                                    )
                                    .orderBy('timestamp', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: LinearProgressIndicator(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              );
                            }
                            List<ChatMessagesRecord>
                                listViewChatMessagesRecordList = snapshot.data!;
                            if (listViewChatMessagesRecordList.isEmpty) {
                              return const SemItemWidget();
                            }
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              reverse: true,
                              primary: false,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewChatMessagesRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewChatMessagesRecord =
                                    listViewChatMessagesRecordList[
                                        listViewIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            listViewChatMessagesRecord.user !=
                                                currentUserReference,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            listViewChatMessagesRecord
                                                        .text !=
                                                    '',
                                            false,
                                          ),
                                      false,
                                    ))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                widget.userDoc?.photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  listViewChatMessagesRecord
                                                                      .text,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'dd/MM/yyyy',
                                                                      listViewChatMessagesRecord
                                                                          .timestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    '01/01/2000',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    if (valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            listViewChatMessagesRecord.user !=
                                                currentUserReference,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            listViewChatMessagesRecord
                                                        .image !=
                                                    '',
                                            false,
                                          ),
                                      false,
                                    ))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                widget.userDoc?.photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        listViewChatMessagesRecord
                                                            .image,
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    if (valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            listViewChatMessagesRecord.user !=
                                                currentUserReference,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            listViewChatMessagesRecord
                                                        .arquivo !=
                                                    '',
                                            false,
                                          ),
                                      false,
                                    ))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                widget.userDoc?.photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await launchURL(
                                                        listViewChatMessagesRecord
                                                            .arquivo);
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 3.0,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 220.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            15.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (valueOrDefault<
                                                                    bool>(
                                                                  FFAppState()
                                                                      .extensoesPPT
                                                                      .contains(
                                                                          functions
                                                                              .splitFile(listViewChatMessagesRecord.arquivo)),
                                                                  false,
                                                                )) {
                                                                  return ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/ppt.png',
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          35.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  );
                                                                } else if (valueOrDefault<
                                                                    bool>(
                                                                  FFAppState()
                                                                      .extensoesExcel
                                                                      .contains(
                                                                          functions
                                                                              .splitFile(listViewChatMessagesRecord.arquivo)),
                                                                  false,
                                                                )) {
                                                                  return ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/excel.png',
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          35.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  );
                                                                } else if (valueOrDefault<
                                                                    bool>(
                                                                  FFAppState()
                                                                      .extensoesWord
                                                                      .contains(
                                                                          functions
                                                                              .splitFile(listViewChatMessagesRecord.arquivo)),
                                                                  false,
                                                                )) {
                                                                  return ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/doc.png',
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          35.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  );
                                                                } else if (valueOrDefault<
                                                                    bool>(
                                                                  functions.splitFile(
                                                                          listViewChatMessagesRecord
                                                                              .arquivo) ==
                                                                      'pdf',
                                                                  false,
                                                                )) {
                                                                  return Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/pdf.png',
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            35.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Icon(
                                                                    Icons.feed,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 30.0,
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    'ssHHmmyyyyMMdd',
                                                                    listViewChatMessagesRecord
                                                                        .timestamp,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  '01012000',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    if (valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            listViewChatMessagesRecord.user !=
                                                currentUserReference,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            listViewChatMessagesRecord
                                                        .video !=
                                                    '',
                                            false,
                                          ),
                                      false,
                                    ))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                widget.userDoc?.photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child:
                                                        FlutterFlowVideoPlayer(
                                                      path:
                                                          listViewChatMessagesRecord
                                                              .video,
                                                      videoType:
                                                          VideoType.network,
                                                      autoPlay: false,
                                                      looping: false,
                                                      showControls: true,
                                                      allowFullScreen: true,
                                                      allowPlaybackSpeedMenu:
                                                          false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    if (valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            listViewChatMessagesRecord.user !=
                                                currentUserReference,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            listViewChatMessagesRecord
                                                        .audio !=
                                                    '',
                                            false,
                                          ),
                                      false,
                                    ))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                widget.userDoc?.photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child:
                                                        FlutterFlowAudioPlayer(
                                                      audio: Audio.network(
                                                        listViewChatMessagesRecord
                                                            .audio,
                                                        metas: Metas(
                                                          id: 'sample3.mp3-413c9903',
                                                          title: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              'ssHHmmyyyyMMdd',
                                                              listViewChatMessagesRecord
                                                                  .timestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '01012000',
                                                          ),
                                                        ),
                                                      ),
                                                      titleTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      playbackDurationTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      playbackButtonColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      activeTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      elevation: 4.0,
                                                      playInBackground:
                                                          PlayInBackground
                                                              .disabledRestoreOnForeground,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    if (valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            listViewChatMessagesRecord.user ==
                                                currentUserReference,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            listViewChatMessagesRecord
                                                        .text !=
                                                    '',
                                            false,
                                          ),
                                      false,
                                    ))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  listViewChatMessagesRecord
                                                                      .text,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'dd/MM/yyyy',
                                                                      listViewChatMessagesRecord
                                                                          .timestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    '01/01/2000',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Container(
                                              width: 30.0,
                                              height: 30.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    if (valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            listViewChatMessagesRecord.user ==
                                                currentUserReference,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            listViewChatMessagesRecord
                                                        .image !=
                                                    '',
                                            false,
                                          ),
                                      false,
                                    ))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        listViewChatMessagesRecord
                                                            .image,
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Container(
                                              width: 30.0,
                                              height: 30.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    if (valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            listViewChatMessagesRecord.user ==
                                                currentUserReference,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            listViewChatMessagesRecord
                                                        .arquivo !=
                                                    '',
                                            false,
                                          ),
                                      false,
                                    ))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await launchURL(
                                                        listViewChatMessagesRecord
                                                            .arquivo);
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 3.0,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 220.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            15.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (valueOrDefault<
                                                                    bool>(
                                                                  FFAppState()
                                                                      .extensoesPPT
                                                                      .contains(
                                                                          functions
                                                                              .splitFile(listViewChatMessagesRecord.arquivo)),
                                                                  false,
                                                                )) {
                                                                  return ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/ppt.png',
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          35.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  );
                                                                } else if (valueOrDefault<
                                                                    bool>(
                                                                  FFAppState()
                                                                      .extensoesExcel
                                                                      .contains(
                                                                          functions
                                                                              .splitFile(listViewChatMessagesRecord.arquivo)),
                                                                  false,
                                                                )) {
                                                                  return ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/excel.png',
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          35.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  );
                                                                } else if (valueOrDefault<
                                                                    bool>(
                                                                  FFAppState()
                                                                      .extensoesWord
                                                                      .contains(
                                                                          functions
                                                                              .splitFile(listViewChatMessagesRecord.arquivo)),
                                                                  false,
                                                                )) {
                                                                  return ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/doc.png',
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          35.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  );
                                                                } else if (valueOrDefault<
                                                                    bool>(
                                                                  functions.splitFile(
                                                                          listViewChatMessagesRecord
                                                                              .arquivo) ==
                                                                      'pdf',
                                                                  false,
                                                                )) {
                                                                  return Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/pdf.png',
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            35.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Icon(
                                                                    Icons.feed,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 30.0,
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    'ssHHmmyyyyMMdd',
                                                                    listViewChatMessagesRecord
                                                                        .timestamp,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  '01012000',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Container(
                                              width: 30.0,
                                              height: 30.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    if (valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            listViewChatMessagesRecord.user ==
                                                currentUserReference,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            listViewChatMessagesRecord
                                                        .video !=
                                                    '',
                                            false,
                                          ),
                                      false,
                                    ))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child:
                                                        FlutterFlowVideoPlayer(
                                                      path:
                                                          listViewChatMessagesRecord
                                                              .video,
                                                      videoType:
                                                          VideoType.network,
                                                      autoPlay: false,
                                                      looping: false,
                                                      showControls: true,
                                                      allowFullScreen: true,
                                                      allowPlaybackSpeedMenu:
                                                          false,
                                                      lazyLoad: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Container(
                                              width: 30.0,
                                              height: 30.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    if (valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            listViewChatMessagesRecord.user ==
                                                currentUserReference,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            listViewChatMessagesRecord
                                                        .audio !=
                                                    '',
                                            false,
                                          ),
                                      false,
                                    ))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child:
                                                        FlutterFlowAudioPlayer(
                                                      audio: Audio.network(
                                                        listViewChatMessagesRecord
                                                            .audio,
                                                        metas: Metas(
                                                          id: 'sample3.mp3-48ebc5b7',
                                                          title: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              'ssHHmmyyyyMMdd',
                                                              listViewChatMessagesRecord
                                                                  .timestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '01012000',
                                                          ),
                                                        ),
                                                      ),
                                                      titleTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      playbackDurationTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      playbackButtonColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      activeTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      elevation: 4.0,
                                                      playInBackground:
                                                          PlayInBackground
                                                              .disabledRestoreOnForeground,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Container(
                                              width: 30.0,
                                              height: 30.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-up-cffkwc/assets/9iq0osre2fkg/icone-utilisateur-gris.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 20.0, 12.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var shouldSetState = false;
                              final selectedFiles = await selectFiles(
                                multiFile: false,
                              );
                              if (selectedFiles != null) {
                                setState(() => _model.isDataUploading1 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedFiles
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedFiles.map(
                                      (f) async => await uploadData(
                                          f.storagePath, f.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedFiles.length &&
                                    downloadUrls.length ==
                                        selectedFiles.length) {
                                  setState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl1 =
                                        downloadUrls.first;
                                  });
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedFileUrl1 != '') {
                                _model.extension =
                                    await actions.splitFileAction(
                                  _model.uploadedFileUrl1,
                                );
                                shouldSetState = true;
                                if (FFAppState()
                                    .extensoesAppState
                                    .contains(_model.extension)) {
                                  var chatMessagesRecordReference1 =
                                      ChatMessagesRecord.collection.doc();
                                  await chatMessagesRecordReference1
                                      .set(createChatMessagesRecordData(
                                    chatUser: widget.pChatUser,
                                    user: currentUserReference,
                                    timestamp: getCurrentTimestamp,
                                    video: _model.uploadedFileUrl1,
                                  ));
                                  _model.outCreateVideosChat =
                                      ChatMessagesRecord.getDocumentFromData(
                                          createChatMessagesRecordData(
                                            chatUser: widget.pChatUser,
                                            user: currentUserReference,
                                            timestamp: getCurrentTimestamp,
                                            video: _model.uploadedFileUrl1,
                                          ),
                                          chatMessagesRecordReference1);
                                  shouldSetState = true;

                                  await _model.outCreateMessage!.chatUser!
                                      .update(createChatsRecordData(
                                    lastMessage: 'Vídeo',
                                    lastMessageTime: getCurrentTimestamp,
                                  ));
                                } else if (FFAppState()
                                    .extensoesAudioAppState
                                    .contains(_model.extension)) {
                                  var chatMessagesRecordReference2 =
                                      ChatMessagesRecord.collection.doc();
                                  await chatMessagesRecordReference2
                                      .set(createChatMessagesRecordData(
                                    chatUser: widget.pChatUser,
                                    user: currentUserReference,
                                    timestamp: getCurrentTimestamp,
                                    audio: _model.uploadedFileUrl1,
                                  ));
                                  _model.outCreateAudioChat =
                                      ChatMessagesRecord.getDocumentFromData(
                                          createChatMessagesRecordData(
                                            chatUser: widget.pChatUser,
                                            user: currentUserReference,
                                            timestamp: getCurrentTimestamp,
                                            audio: _model.uploadedFileUrl1,
                                          ),
                                          chatMessagesRecordReference2);
                                  shouldSetState = true;

                                  await _model.outCreateMessage!.chatUser!
                                      .update(createChatsRecordData(
                                    lastMessage: 'Áudio',
                                    lastMessageTime: getCurrentTimestamp,
                                  ));
                                } else if (FFAppState()
                                    .extensoesImg
                                    .contains(_model.extension)) {
                                  var chatMessagesRecordReference3 =
                                      ChatMessagesRecord.collection.doc();
                                  await chatMessagesRecordReference3
                                      .set(createChatMessagesRecordData(
                                    chatUser: widget.pChatUser,
                                    user: currentUserReference,
                                    timestamp: getCurrentTimestamp,
                                    image: _model.uploadedFileUrl1,
                                  ));
                                  _model.outCreateImagemChat =
                                      ChatMessagesRecord.getDocumentFromData(
                                          createChatMessagesRecordData(
                                            chatUser: widget.pChatUser,
                                            user: currentUserReference,
                                            timestamp: getCurrentTimestamp,
                                            image: _model.uploadedFileUrl1,
                                          ),
                                          chatMessagesRecordReference3);
                                  shouldSetState = true;

                                  await _model.outCreateMessage!.chatUser!
                                      .update(createChatsRecordData(
                                    lastMessage: 'Imagem',
                                    lastMessageTime: getCurrentTimestamp,
                                  ));
                                } else {
                                  var chatMessagesRecordReference4 =
                                      ChatMessagesRecord.collection.doc();
                                  await chatMessagesRecordReference4
                                      .set(createChatMessagesRecordData(
                                    chatUser: widget.pChatUser,
                                    user: currentUserReference,
                                    timestamp: getCurrentTimestamp,
                                    arquivo: _model.uploadedFileUrl1,
                                  ));
                                  _model.outCreateFilesChat =
                                      ChatMessagesRecord.getDocumentFromData(
                                          createChatMessagesRecordData(
                                            chatUser: widget.pChatUser,
                                            user: currentUserReference,
                                            timestamp: getCurrentTimestamp,
                                            arquivo: _model.uploadedFileUrl1,
                                          ),
                                          chatMessagesRecordReference4);
                                  shouldSetState = true;

                                  await _model.outCreateMessage!.chatUser!
                                      .update(createChatsRecordData(
                                    lastMessage: 'Arquivo',
                                    lastMessageTime: getCurrentTimestamp,
                                  ));
                                }

                                setState(() {
                                  _model.isDataUploading1 = false;
                                  _model.uploadedLocalFile1 = FFUploadedFile(
                                      bytes: Uint8List.fromList([]));
                                  _model.uploadedFileUrl1 = '';
                                });
                              } else {
                                if (shouldSetState) setState(() {});
                                return;
                              }

                              if (shouldSetState) setState(() {});
                            },
                            child: Icon(
                              Icons.attach_file_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                          Stack(
                            children: [
                              if (valueOrDefault<bool>(
                                valueOrDefault<bool>(
                                      _model.audio,
                                      false,
                                    ) &&
                                    _model.photoVideo,
                                false,
                              ))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var shouldSetState = false;
                                      final selectedMedia = await selectMedia(
                                        isVideo: true,
                                        multiImage: false,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading2 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          _model.isDataUploading2 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile2 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl2 =
                                                downloadUrls.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      if (_model.uploadedFileUrl2 != '') {
                                        var chatMessagesRecordReference =
                                            ChatMessagesRecord.collection.doc();
                                        await chatMessagesRecordReference
                                            .set(createChatMessagesRecordData(
                                          chatUser: widget.pChatUser,
                                          user: currentUserReference,
                                          timestamp: getCurrentTimestamp,
                                          video: _model.uploadedFileUrl2,
                                        ));
                                        _model.outCreateImageChat =
                                            ChatMessagesRecord
                                                .getDocumentFromData(
                                                    createChatMessagesRecordData(
                                                      chatUser:
                                                          widget.pChatUser,
                                                      user:
                                                          currentUserReference,
                                                      timestamp:
                                                          getCurrentTimestamp,
                                                      video: _model
                                                          .uploadedFileUrl2,
                                                    ),
                                                    chatMessagesRecordReference);
                                        shouldSetState = true;

                                        await _model.outCreateMessage!.chatUser!
                                            .update(createChatsRecordData(
                                          lastMessage: 'Video',
                                          lastMessageTime: getCurrentTimestamp,
                                        ));
                                        setState(() {
                                          _model.txtMensagemTextController
                                              ?.clear();
                                        });
                                      } else {
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }

                                      setState(() {
                                        _model.isDataUploading2 = false;
                                        _model.uploadedLocalFile2 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl2 = '';
                                      });

                                      if (shouldSetState) setState(() {});
                                    },
                                    onDoubleTap: () async {
                                      setState(() {
                                        _model.photoVideo = false;
                                      });
                                    },
                                    child: Icon(
                                      Icons.videocam_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                valueOrDefault<bool>(
                                      _model.audio,
                                      false,
                                    ) &&
                                    !valueOrDefault<bool>(
                                      _model.photoVideo,
                                      false,
                                    ),
                                false,
                              ))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var shouldSetState = false;
                                      final selectedMedia = await selectMedia(
                                        multiImage: false,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading3 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          _model.isDataUploading3 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile3 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl3 =
                                                downloadUrls.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      if (_model.uploadedFileUrl3 != '') {
                                        var chatMessagesRecordReference =
                                            ChatMessagesRecord.collection.doc();
                                        await chatMessagesRecordReference
                                            .set(createChatMessagesRecordData(
                                          chatUser: widget.pChatUser,
                                          user: currentUserReference,
                                          timestamp: getCurrentTimestamp,
                                          image: _model.uploadedFileUrl3,
                                        ));
                                        _model.outCreateVideoRecChat =
                                            ChatMessagesRecord
                                                .getDocumentFromData(
                                                    createChatMessagesRecordData(
                                                      chatUser:
                                                          widget.pChatUser,
                                                      user:
                                                          currentUserReference,
                                                      timestamp:
                                                          getCurrentTimestamp,
                                                      image: _model
                                                          .uploadedFileUrl3,
                                                    ),
                                                    chatMessagesRecordReference);
                                        shouldSetState = true;

                                        await _model.outCreateMessage!.chatUser!
                                            .update(createChatsRecordData(
                                          lastMessage: 'Photo',
                                          lastMessageTime: getCurrentTimestamp,
                                        ));
                                        setState(() {
                                          _model.txtMensagemTextController
                                              ?.clear();
                                        });
                                      } else {
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }

                                      setState(() {
                                        _model.isDataUploading3 = false;
                                        _model.uploadedLocalFile3 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl3 = '';
                                      });

                                      if (shouldSetState) setState(() {});
                                    },
                                    onDoubleTap: () async {
                                      setState(() {
                                        _model.photoVideo = true;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            if (valueOrDefault<bool>(
                              _model.audio,
                              false,
                            ))
                              TextFormField(
                                controller: _model.txtMensagemTextController,
                                focusNode: _model.txtMensagemFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.txtMensagemTextController',
                                  const Duration(milliseconds: 0),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Digite sua mensagem',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: 20,
                                minLines: 1,
                                validator: _model
                                    .txtMensagemTextControllerValidator
                                    .asValidator(context),
                              ),
                            if (!valueOrDefault<bool>(
                              _model.audio,
                              false,
                            ))
                              Lottie.asset(
                                'assets/lottie_animations/Animation_-_1700522827452.json',
                                width: 342.0,
                                height: 50.0,
                                fit: BoxFit.fill,
                                animate: true,
                              ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          if (valueOrDefault<bool>(
                            valueOrDefault<bool>(
                                  _model.audio,
                                  false,
                                ) &&
                                valueOrDefault<bool>(
                                  _model.txtMensagemTextController.text ==
                                          '',
                                  false,
                                ),
                            false,
                          ))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await requestPermission(microphonePermission);
                                if (await getPermissionStatus(
                                    microphonePermission)) {
                                  setState(() {
                                    _model.audio = false;
                                  });
                                  await startAudioRecording(
                                    context,
                                    audioRecorder: _model.audioRecorder ??=
                                        AudioRecorder(),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Sem premissão',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }
                              },
                              child: Icon(
                                Icons.mic,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                          if (valueOrDefault<bool>(
                            !valueOrDefault<bool>(
                                  _model.audio,
                                  false,
                                ) &&
                                valueOrDefault<bool>(
                                  _model.txtMensagemTextController.text ==
                                          '',
                                  false,
                                ),
                            false,
                          ))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.audio = true;
                                });
                                await stopAudioRecording(
                                  audioRecorder: _model.audioRecorder,
                                  audioName: 'recordedFileBytes.mp3',
                                  onRecordingComplete:
                                      (audioFilePath, audioBytes) {
                                    _model.outStopAudio = audioFilePath;
                                    _model.recordedFileBytes = audioBytes;
                                  },
                                );

                                var chatMessagesRecordReference =
                                    ChatMessagesRecord.collection.doc();
                                await chatMessagesRecordReference
                                    .set(createChatMessagesRecordData(
                                  chatUser: widget.pChatUser,
                                  user: currentUserReference,
                                  timestamp: getCurrentTimestamp,
                                  audio: _model.outStopAudio,
                                ));
                                _model.outCreateStopAudio =
                                    ChatMessagesRecord.getDocumentFromData(
                                        createChatMessagesRecordData(
                                          chatUser: widget.pChatUser,
                                          user: currentUserReference,
                                          timestamp: getCurrentTimestamp,
                                          audio: _model.outStopAudio,
                                        ),
                                        chatMessagesRecordReference);

                                await _model.outCreateMessage!.chatUser!
                                    .update(createChatsRecordData(
                                  lastMessage: 'Áudio',
                                  lastMessageTime: getCurrentTimestamp,
                                ));
                                setState(() {
                                  _model.txtMensagemTextController?.clear();
                                });

                                setState(() {});
                              },
                              child: Icon(
                                Icons.stop_circle,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                          if (valueOrDefault<bool>(
                            _model.txtMensagemTextController.text != '',
                            false,
                          ))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                var shouldSetState = false;
                                if (_model.txtMensagemTextController.text !=
                                        '') {
                                  var chatMessagesRecordReference =
                                      ChatMessagesRecord.collection.doc();
                                  await chatMessagesRecordReference
                                      .set(createChatMessagesRecordData(
                                    text: _model.txtMensagemTextController.text,
                                    chatUser: widget.pChatUser,
                                    user: currentUserReference,
                                    timestamp: getCurrentTimestamp,
                                  ));
                                  _model.outCreateMessage =
                                      ChatMessagesRecord.getDocumentFromData(
                                          createChatMessagesRecordData(
                                            text: _model
                                                .txtMensagemTextController.text,
                                            chatUser: widget.pChatUser,
                                            user: currentUserReference,
                                            timestamp: getCurrentTimestamp,
                                          ),
                                          chatMessagesRecordReference);
                                  shouldSetState = true;

                                  await _model.outCreateMessage!.chatUser!
                                      .update(createChatsRecordData(
                                    lastMessage: _model.outCreateMessage?.text,
                                    lastMessageTime: getCurrentTimestamp,
                                    leitura: false,
                                    user: currentUserReference,
                                  ));
                                  setState(() {
                                    _model.txtMensagemTextController?.clear();
                                  });
                                } else {
                                  if (shouldSetState) setState(() {});
                                  return;
                                }

                                if (shouldSetState) setState(() {});
                              },
                              child: Icon(
                                Icons.send_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                        ],
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
