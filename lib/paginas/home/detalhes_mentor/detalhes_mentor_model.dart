import '/flutter_flow/flutter_flow_util.dart';
import 'detalhes_mentor_widget.dart' show DetalhesMentorWidget;
import 'package:flutter/material.dart';

class DetalhesMentorModel extends FlutterFlowModel<DetalhesMentorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
