import '/backend/backend.dart';
import '/components/c_rating_user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:text_search/text_search.dart';
import 'buscar_mentores_model.dart';
export 'buscar_mentores_model.dart';

class BuscarMentoresWidget extends StatefulWidget {
  const BuscarMentoresWidget({super.key});

  @override
  State<BuscarMentoresWidget> createState() => _BuscarMentoresWidgetState();
}

class _BuscarMentoresWidgetState extends State<BuscarMentoresWidget> {
  late BuscarMentoresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscarMentoresModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.outAllLoadMentor = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'tipoUsuario',
          isEqualTo: 'Mentor',
        ),
      );
      setState(() {
        _model.psLista = _model.outAllLoadMentor!.toList().cast<UsersRecord>();
      });
    });

    _model.txtBuscaController ??= TextEditingController();
    _model.txtBuscaFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.chat_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Icon(
                        Icons.person_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Level Up',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pop();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ].divide(const SizedBox(width: 8.0)),
                  ),
                ),
                TextFormField(
                  controller: _model.txtBuscaController,
                  focusNode: _model.txtBuscaFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.txtBuscaController',
                    const Duration(milliseconds: 0),
                    () async {
                      safeSetState(() {
                        _model.simpleSearchResults = TextSearch(
                          _model.psLista
                              .map(
                                (record) => TextSearchItem.fromTerms(record, [
                                  record.email,
                                  record.displayName,
                                  record.phoneNumber,
                                  record.especialidade
                                ]),
                              )
                              .toList(),
                        )
                            .search(_model.txtBuscaController.text)
                            .map((r) => r.object)
                            .toList();
                      });
                      setState(() {
                        _model.psLista =
                            _model.txtBuscaController.text != ''
                                ? _model.simpleSearchResults
                                : _model.outAllLoadMentor!
                                    .toList()
                                    .cast<UsersRecord>();
                      });
                    },
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    hintText: 'Pesquisar',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                    ),
                    suffixIcon: _model.txtBuscaController!.text.isNotEmpty
                        ? InkWell(
                            onTap: () async {
                              _model.txtBuscaController?.clear();
                              safeSetState(() {
                                _model.simpleSearchResults = TextSearch(
                                  _model.psLista
                                      .map(
                                        (record) => TextSearchItem.fromTerms(
                                            record, [
                                          record.email,
                                          record.displayName,
                                          record.phoneNumber,
                                          record.especialidade
                                        ]),
                                      )
                                      .toList(),
                                )
                                    .search(_model.txtBuscaController.text)
                                    .map((r) => r.object)
                                    .toList();
                              });
                              setState(() {
                                _model.psLista =
                                    _model.txtBuscaController.text != ''
                                        ? _model.simpleSearchResults
                                        : _model.outAllLoadMentor!
                                            .toList()
                                            .cast<UsersRecord>();
                              });
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.clear,
                              size: 18.0,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  validator:
                      _model.txtBuscaControllerValidator.asValidator(context),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final listaBuscaMentor =
                          _model.psLista.map((e) => e).toList();
                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          10.0,
                          0,
                          0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listaBuscaMentor.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                        itemBuilder: (context, listaBuscaMentorIndex) {
                          final listaBuscaMentorItem =
                              listaBuscaMentor[listaBuscaMentorIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'Agendamento',
                                queryParameters: {
                                  'pDocMentor': serializeParam(
                                    listaBuscaMentorItem,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'pDocMentor': listaBuscaMentorItem,
                                },
                              );
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        listaBuscaMentorItem
                                                            .photoUrl,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-u-p-3dyrgo/assets/uhmddgcf2y5t/Mentor.png',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 10,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        listaBuscaMentorItem
                                                            .displayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        listaBuscaMentorItem
                                                            .especialidade,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        listaBuscaMentorItem
                                                            .campus.nome,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          '${valueOrDefault<String>(
                                                            listaBuscaMentorItem
                                                                .quantidadeMentorias
                                                                .toString(),
                                                            '0',
                                                          )}${valueOrDefault<String>(
                                                            listaBuscaMentorItem
                                                                        .quantidadeMentorias >
                                                                    1
                                                                ? ' mentorias realizadas'
                                                                : ' mentoria realizada',
                                                            ' mentoria realizada',
                                                          )}',
                                                          '0 mentoria realizada',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(const SizedBox(height: 3.0)),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              listaBuscaMentorItem.sobreMim
                                                  .maybeHandleOverflow(
                                                maxChars: 200,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      CRatingUserWidget(
                                        key: Key(
                                            'Keyhe5_${listaBuscaMentorIndex}_of_${listaBuscaMentor.length}'),
                                        nota: listaBuscaMentorItem.rating,
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ].divide(const SizedBox(height: 5.0)),
            ),
          ),
        ),
      ),
    );
  }
}
