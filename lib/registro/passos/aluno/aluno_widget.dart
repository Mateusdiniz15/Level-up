import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'aluno_model.dart';
export 'aluno_model.dart';

class AlunoWidget extends StatefulWidget {
  const AlunoWidget({
    super.key,
    required this.pTipoUsuario,
  });

  final String? pTipoUsuario;

  @override
  State<AlunoWidget> createState() => _AlunoWidgetState();
}

class _AlunoWidgetState extends State<AlunoWidget> {
  late AlunoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlunoModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Builder(
              builder: (context) {
                if (valueOrDefault<bool>(
                  _model.psPasso == 1,
                  false,
                )) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
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
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Aluno',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean malesuada cursus libero quis cursus. Curabitur blandit mi leo, a aliquam ex malesuada vitae. Aenean cursus interdum magna sed ullamcorper. Curabitur non sollicitudin purus, vel luctus felis. Aenean porta feugiat dictum. Donec sed massa nec ipsum iaculis euismod vel eget urna. Sed ex mi, placerat mollis suscipit at, fringilla in neque.\n\nNunc ac quam ac mauris eleifend bibendum. Cras placerat quam est, in dignissim nisl fermentum eget. Donec eleifend velit sagittis elit fringilla vulputate. Duis sodales felis et dolor vulputate, et ornare dui aliquet. Vivamus turpis dolor, accumsan sit amet mi nec, molestie finibus odio. Ut ut placerat erat, eu efficitur metus. Quisque ullamcorper dolor a ex pulvinar consequat. Curabitur pretium turpis eget justo efficitur vestibulum. Morbi sagittis at erat quis maximus. Integer volutpat ligula eget nibh tempus, in molestie leo facilisis. Morbi tristique, risus id placerat faucibus, neque purus blandit orci, eu lobortis turpis ipsum et arcu. Duis feugiat, quam eu convallis convallis, quam lacus hendrerit neque, id eleifend ex eros eu neque. Vivamus venenatis libero nec ligula tristique dapibus. Vivamus egestas justo fermentum, lacinia erat quis, congue elit. \n\nDonec feugiat iaculis ipsum, quis vehicula lorem faucibus ac. Nam pulvinar mollis tortor, et pellentesque neque dictum quis.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 12.0,
                          ),
                          Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 12.0,
                          ),
                          Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 12.0,
                          ),
                        ].divide(const SizedBox(width: 3.0)),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            _model.psPasso = 2;
                          });
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Próximo',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 15.0)),
                  );
                } else if (valueOrDefault<bool>(
                  _model.psPasso == 2,
                  false,
                )) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.psPasso = 1;
                              });
                            },
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Aluno',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean malesuada cursus libero quis cursus. Curabitur blandit mi leo, a aliquam ex malesuada vitae. Aenean cursus interdum magna sed ullamcorper. Curabitur non sollicitudin purus, vel luctus felis. Aenean porta feugiat dictum. Donec sed massa nec ipsum iaculis euismod vel eget urna. Sed ex mi, placerat mollis suscipit at, fringilla in neque.\n\nNunc ac quam ac mauris eleifend bibendum. Cras placerat quam est, in dignissim nisl fermentum eget. Donec eleifend velit sagittis elit fringilla vulputate. Duis sodales felis et dolor vulputate, et ornare dui aliquet. Vivamus turpis dolor, accumsan sit amet mi nec, molestie finibus odio. Ut ut placerat erat, eu efficitur metus. Quisque ullamcorper dolor a ex pulvinar consequat. Curabitur pretium turpis eget justo efficitur vestibulum. Morbi sagittis at erat quis maximus. Integer volutpat ligula eget nibh tempus, in molestie leo facilisis. Morbi tristique, risus id placerat faucibus, neque purus blandit orci, eu lobortis turpis ipsum et arcu. Duis feugiat, quam eu convallis convallis, quam lacus hendrerit neque, id eleifend ex eros eu neque. Vivamus venenatis libero nec ligula tristique dapibus. Vivamus egestas justo fermentum, lacinia erat quis, congue elit. \n\nDonec feugiat iaculis ipsum, quis vehicula lorem faucibus ac. Nam pulvinar mollis tortor, et pellentesque neque dictum quis.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 12.0,
                          ),
                          Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 12.0,
                          ),
                          Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 12.0,
                          ),
                        ].divide(const SizedBox(width: 3.0)),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            _model.psPasso = 3;
                          });
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Próximo',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 15.0)),
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.psPasso = 2;
                              });
                            },
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Aluno',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean malesuada cursus libero quis cursus. Curabitur blandit mi leo, a aliquam ex malesuada vitae. Aenean cursus interdum magna sed ullamcorper. Curabitur non sollicitudin purus, vel luctus felis. Aenean porta feugiat dictum. Donec sed massa nec ipsum iaculis euismod vel eget urna. Sed ex mi, placerat mollis suscipit at, fringilla in neque.\n\nNunc ac quam ac mauris eleifend bibendum. Cras placerat quam est, in dignissim nisl fermentum eget. Donec eleifend velit sagittis elit fringilla vulputate. Duis sodales felis et dolor vulputate, et ornare dui aliquet. Vivamus turpis dolor, accumsan sit amet mi nec, molestie finibus odio. Ut ut placerat erat, eu efficitur metus. Quisque ullamcorper dolor a ex pulvinar consequat. Curabitur pretium turpis eget justo efficitur vestibulum. Morbi sagittis at erat quis maximus. Integer volutpat ligula eget nibh tempus, in molestie leo facilisis. Morbi tristique, risus id placerat faucibus, neque purus blandit orci, eu lobortis turpis ipsum et arcu. Duis feugiat, quam eu convallis convallis, quam lacus hendrerit neque, id eleifend ex eros eu neque. Vivamus venenatis libero nec ligula tristique dapibus. Vivamus egestas justo fermentum, lacinia erat quis, congue elit. \n\nDonec feugiat iaculis ipsum, quis vehicula lorem faucibus ac. Nam pulvinar mollis tortor, et pellentesque neque dictum quis.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 12.0,
                          ),
                          Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 12.0,
                          ),
                          Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 12.0,
                          ),
                        ].divide(const SizedBox(width: 3.0)),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'Registro',
                            queryParameters: {
                              'pTipoUsuario': serializeParam(
                                'Aluno',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Próximo',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 15.0)),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
