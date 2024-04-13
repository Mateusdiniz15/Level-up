import '/flutter_flow/flutter_flow_util.dart';
import 'aluno_widget.dart' show AlunoWidget;
import 'package:flutter/material.dart';

class AlunoModel extends FlutterFlowModel<AlunoWidget> {
  ///  Local state fields for this page.

  int psPasso = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
