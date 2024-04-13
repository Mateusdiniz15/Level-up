import '/flutter_flow/flutter_flow_util.dart';
import 'mentor_widget.dart' show MentorWidget;
import 'package:flutter/material.dart';

class MentorModel extends FlutterFlowModel<MentorWidget> {
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
