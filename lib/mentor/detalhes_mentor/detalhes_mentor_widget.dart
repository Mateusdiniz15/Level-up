import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'detalhes_mentor_model.dart';
export 'detalhes_mentor_model.dart';

class DetalhesMentorWidget extends StatefulWidget {
  const DetalhesMentorWidget({
    super.key,
    required this.pDoc,
  });

  final UsersRecord? pDoc;

  @override
  State<DetalhesMentorWidget> createState() => _DetalhesMentorWidgetState();
}

class _DetalhesMentorWidgetState extends State<DetalhesMentorWidget> {
  late DetalhesMentorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesMentorModel());

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
                      child: Icon(
                        Icons.chat_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 30.0,
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
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 65.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                width: 120.0,
                                height: 120.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    widget.pDoc?.photoUrl,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/level-u-p-3dyrgo/assets/uhmddgcf2y5t/Mentor.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.pDoc!.displayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.pDoc!.especialidade,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.pDoc!.campus.nome,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(24.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: RatingBar.builder(
                                      onRatingUpdate: (newValue) => setState(
                                          () =>
                                              _model.ratingBarValue = newValue),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      direction: Axis.horizontal,
                                      initialRating: _model.ratingBarValue ??=
                                          valueOrDefault<double>(
                                        widget.pDoc?.rating,
                                        0.0,
                                      ),
                                      unratedColor: const Color(0x3F6596F5),
                                      itemCount: 5,
                                      itemSize: 18.0,
                                      glowColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(24.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: AutoSizeText(
                                          '${valueOrDefault<String>(
                                            widget.pDoc?.quantidadeMentorias
                                                .toString(),
                                            '0',
                                          )} mentorias realizadas',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                              ),
                                          minFontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 15.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FaIcon(
                                  FontAwesomeIcons.linkedinIn,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 16.0,
                                ),
                              ),
                            ),
                            Text(
                              'Meu LinkedIn',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ].divide(const SizedBox(width: 10.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          'Sobre mim',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                widget.pDoc!.sobreMim,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          'Formação acadêmica',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final listaFormacao = widget.pDoc?.formacoesAcademica
                                  .map((e) => e)
                                  .toList()
                                  .toList() ??
                              [];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(listaFormacao.length,
                                (listaFormacaoIndex) {
                              final listaFormacaoItem =
                                  listaFormacao[listaFormacaoIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.circle_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 8.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Graduação em ${listaFormacaoItem.graduacao}, ${listaFormacaoItem.instituicao}, ${dateTimeFormat('yyyy', listaFormacaoItem.mesAnoInicio)} - ${dateTimeFormat('yyyy', listaFormacaoItem.mesAnoConclusao)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              );
                            }).divide(const SizedBox(height: 8.0)),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
                        child: Text(
                          'Informações adicionais',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final listaFormacao = widget.pDoc?.formacoesAcademica
                                  .map((e) => e)
                                  .toList()
                                  .toList() ??
                              [];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(listaFormacao.length,
                                (listaFormacaoIndex) {
                              final listaFormacaoItem =
                                  listaFormacao[listaFormacaoIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.circle_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 8.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Graduação em ${listaFormacaoItem.graduacao}, ${listaFormacaoItem.instituicao}, ${dateTimeFormat('yyyy', listaFormacaoItem.mesAnoInicio)} - ${dateTimeFormat('yyyy', listaFormacaoItem.mesAnoConclusao)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              );
                            }).divide(const SizedBox(height: 8.0)),
                          );
                        },
                      ),
                    ].divide(const SizedBox(height: 5.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'AgendarMentoria',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
