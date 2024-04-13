import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'agenda_model.dart';
export 'agenda_model.dart';

class AgendaWidget extends StatefulWidget {
  const AgendaWidget({super.key});

  @override
  State<AgendaWidget> createState() => _AgendaWidgetState();
}

class _AgendaWidgetState extends State<AgendaWidget> {
  late AgendaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendaModel());

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
            final datePickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(
                  (_model.calendarSelectedDay?.start ?? DateTime.now())),
              builder: (context, child) {
                return wrapInMaterialTimePickerTheme(
                  context,
                  child!,
                  headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                  headerForegroundColor: FlutterFlowTheme.of(context).info,
                  headerTextStyle:
                      FlutterFlowTheme.of(context).headlineLarge.override(
                            fontFamily: 'Outfit',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                  pickerBackgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  pickerForegroundColor:
                      FlutterFlowTheme.of(context).primaryText,
                  selectedDateTimeBackgroundColor:
                      FlutterFlowTheme.of(context).primary,
                  selectedDateTimeForegroundColor:
                      FlutterFlowTheme.of(context).info,
                  actionButtonForegroundColor:
                      FlutterFlowTheme.of(context).primaryText,
                  iconSize: 24.0,
                );
              },
            );
            if (datePickedTime != null) {
              safeSetState(() {
                _model.datePicked = DateTime(
                  (_model.calendarSelectedDay?.start ?? DateTime.now()).year,
                  (_model.calendarSelectedDay?.start ?? DateTime.now()).month,
                  (_model.calendarSelectedDay?.start ?? DateTime.now()).day,
                  datePickedTime.hour,
                  datePickedTime.minute,
                );
              });
            }

            await currentUserReference!.update({
              ...mapToFirestore(
                {
                  'disponibilidade': FieldValue.arrayUnion([
                    getHorasDisponiveisFirestoreData(
                      updateHorasDisponiveisStruct(
                        HorasDisponiveisStruct(
                          dataHora: _model.datePicked,
                          disponibilidade: true,
                        ),
                        clearUnsetFields: false,
                      ),
                      true,
                    )
                  ]),
                },
              ),
            });
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.more_time_sharp,
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
                      child: Text(
                        'Selecione uma data',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
                FlutterFlowCalendar(
                  color: FlutterFlowTheme.of(context).primary,
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  weekFormat: true,
                  weekStartsMonday: false,
                  initialDate: getCurrentTimestamp,
                  rowHeight: 64.0,
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
                AuthUserStreamWidget(
                  builder: (context) => Builder(
                    builder: (context) {
                      final listHoras =
                          (currentUserDocument?.disponibilidade.toList() ?? [])
                              .map((e) => e)
                              .toList()
                              .where((e) => valueOrDefault<bool>(
                                    dateTimeFormat('dd/MM/yyyy', e.dataHora) ==
                                        dateTimeFormat('dd/MM/yyyy',
                                            _model.calendarSelectedDay?.start),
                                    false,
                                  ))
                              .toList()
                              .sortedList(
                                  (e) => dateTimeFormat('HH:mm', e.dataHora!))
                              .toList();
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listHoras.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                        itemBuilder: (context, listHorasIndex) {
                          final listHorasItem = listHoras[listHorasIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onLongPress: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Excluir'),
                                            content: const Text(
                                                'Deseja realmente excluir o horário?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('Não'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: const Text('Sim'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'disponibilidade':
                                          FieldValue.arrayRemove([
                                        getHorasDisponiveisFirestoreData(
                                          updateHorasDisponiveisStruct(
                                            listHorasItem,
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                              } else {
                                return;
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                            'HH:mm', listHorasItem.dataHora),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
