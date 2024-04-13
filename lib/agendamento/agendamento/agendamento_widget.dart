import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'agendamento_model.dart';
export 'agendamento_model.dart';

class AgendamentoWidget extends StatefulWidget {
  const AgendamentoWidget({
    super.key,
    required this.pDocMentor,
  });

  final UsersRecord? pDocMentor;

  @override
  State<AgendamentoWidget> createState() => _AgendamentoWidgetState();
}

class _AgendamentoWidgetState extends State<AgendamentoWidget> {
  late AgendamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendamentoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.psListaHoras = widget.pDocMentor!.disponibilidade
            .toList()
            .cast<HorasDisponiveisStruct>();
      });
    });

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
          onPressed: () async {
            _model.outRefreshBuscarMentor = await queryUsersRecordOnce(
              queryBuilder: (usersRecord) => usersRecord.where(
                'uid',
                isEqualTo: widget.pDocMentor?.reference.id,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            setState(() {
              _model.psListaHoras = _model
                  .outRefreshBuscarMentor!.disponibilidade
                  .toList()
                  .cast<HorasDisponiveisStruct>();
            });

            setState(() {});
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.refresh_rounded,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      child: InkWell(
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
                          size: 25.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            getCurrentTimestamp.toString(),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            _model.calendarSelectedDay!.start.toString(),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                FlutterFlowCalendar(
                  color: FlutterFlowTheme.of(context).primary,
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  weekFormat: false,
                  weekStartsMonday: false,
                  initialDate: getCurrentTimestamp,
                  rowHeight: 40.0,
                  onChange: (DateTimeRange? newSelectedDate) {
                    setState(
                        () => _model.calendarSelectedDay = newSelectedDate);
                  },
                  titleStyle:
                      FlutterFlowTheme.of(context).headlineSmall.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0.0,
                          ),
                  dayOfWeekStyle:
                      FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                  dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  selectedDateStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                  inactiveDateStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                ),
                if (valueOrDefault<bool>(
                  _model.psListaHoras.isNotEmpty,
                  false,
                ))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 10.0),
                    child: Text(
                      'Selecione um horário',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                Builder(
                  builder: (context) {
                    final listaHora = _model.psListaHoras
                        .map((e) => e)
                        .toList()
                        .where((e) => valueOrDefault<bool>(
                              (dateTimeFormat('dd/MM/yyyy', e.dataHora) ==
                                      dateTimeFormat('dd/MM/yyyy',
                                          _model.calendarSelectedDay?.start)) &&
                                  valueOrDefault<bool>(
                                    e.disponibilidade,
                                    false,
                                  ),
                              false,
                            ))
                        .toList();
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listaHora.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                      itemBuilder: (context, listaHoraIndex) {
                        final listaHoraItem = listaHora[listaHoraIndex];
                        return Visibility(
                          visible: valueOrDefault<bool>(
                            _model.psListaHoras[listaHoraIndex].disponibilidade,
                            false,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 7,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.psIndex = listaHoraIndex;
                                      _model.dataSelecionavel =
                                          listaHoraItem.dataHora;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat('HH:mm',
                                                  listaHoraItem.dataHora),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                listaHoraIndex == _model.psIndex,
                                false,
                              ))
                                Expanded(
                                  flex: 5,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        _model.updatePsListaHorasAtIndex(
                                          listaHoraIndex,
                                          (e) => e..disponibilidade = false,
                                        );
                                      });

                                      await widget.pDocMentor!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'disponibilidade':
                                                FieldValue.arrayRemove([
                                              getHorasDisponiveisFirestoreData(
                                                updateHorasDisponiveisStruct(
                                                  listaHoraItem,
                                                  clearUnsetFields: false,
                                                ),
                                                true,
                                              )
                                            ]),
                                          },
                                        ),
                                      });

                                      await MentoriasRecord.collection
                                          .doc()
                                          .set(createMentoriasRecordData(
                                            data: _model.dataSelecionavel,
                                            mentor: createUsuarioStruct(
                                              email: widget.pDocMentor?.email,
                                              displayName: widget
                                                  .pDocMentor?.displayName,
                                              photoUrl:
                                                  widget.pDocMentor?.photoUrl,
                                              createdTime: getCurrentTimestamp,
                                              phoneNumber: widget
                                                  .pDocMentor?.phoneNumber,
                                              tipoUsuario: widget
                                                  .pDocMentor?.tipoUsuario,
                                              especialidade: widget
                                                  .pDocMentor?.especialidade,
                                              linkedIn:
                                                  widget.pDocMentor?.linkedIn,
                                              sobreMim:
                                                  widget.pDocMentor?.sobreMim,
                                              rating: valueOrDefault<double>(
                                                widget.pDocMentor?.rating,
                                                0.0,
                                              ),
                                              id: widget.pDocMentor?.reference,
                                              instituicao:
                                                  updateInstituicaoStruct(
                                                widget.pDocMentor?.instituicao,
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              uid: widget
                                                  .pDocMentor?.reference.id,
                                              quantidadeMentorias: widget
                                                  .pDocMentor
                                                  ?.quantidadeMentorias,
                                              campus: createCampusStruct(
                                                id: widget
                                                    .pDocMentor?.campus.id,
                                                nome: widget
                                                    .pDocMentor?.campus.nome,
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              objetivos:
                                                  widget.pDocMentor?.objetivos,
                                              fieldValues: {
                                                'formacoesAcademicas':
                                                    getFormacaoListFirestoreData(
                                                  widget.pDocMentor
                                                      ?.formacoesAcademica,
                                                ),
                                                'disponibilidade':
                                                    getHorasDisponiveisListFirestoreData(
                                                  widget.pDocMentor
                                                      ?.disponibilidade,
                                                ),
                                              },
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                          ));
                                    },
                                    text: 'Confirmar',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
