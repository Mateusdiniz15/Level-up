import '/flutter_flow/flutter_flow_util.dart';
import 'passo01_widget.dart' show Passo01Widget;
import 'package:flutter/material.dart';

class Passo01Model extends FlutterFlowModel<Passo01Widget> {
  ///  Local state fields for this page.

  bool psConcordar = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
