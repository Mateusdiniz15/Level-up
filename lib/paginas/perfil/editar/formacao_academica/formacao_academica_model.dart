import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'formacao_academica_widget.dart' show FormacaoAcademicaWidget;
import 'package:flutter/material.dart';

class FormacaoAcademicaModel extends FlutterFlowModel<FormacaoAcademicaWidget> {
  ///  Local state fields for this page.

  DocumentReference? graduacaoDocRefLocalState;

  DocumentReference? instituicaoDocRefLocalState;

  DateTime? dtInicioLocalState;

  DateTime? dtConclusaoLocalState;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ddlGraduacao widget.
  String? ddlGraduacaoValue;
  FormFieldController<String>? ddlGraduacaoValueController;
  // State field(s) for ddlInstituicao widget.
  String? ddlInstituicaoValue;
  FormFieldController<String>? ddlInstituicaoValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
