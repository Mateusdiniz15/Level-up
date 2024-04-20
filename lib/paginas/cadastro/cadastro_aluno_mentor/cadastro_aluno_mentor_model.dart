import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_aluno_mentor_widget.dart' show CadastroAlunoMentorWidget;
import 'package:flutter/material.dart';

class CadastroAlunoMentorModel
    extends FlutterFlowModel<CadastroAlunoMentorWidget> {
  ///  Local state fields for this page.

  int statusPageLocalState = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
