import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_widget.dart' show ChooseWidget;
import 'package:flutter/material.dart';

class ChooseModel extends FlutterFlowModel<ChooseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Choose widget.
  List<UsersRecord>? outLoadAluno;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
