import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtSenha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaControllerValidator;

  @override
  void initState(BuildContext context) {
    txtSenhaVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtEmailFocusNode?.dispose();
    txtEmailController?.dispose();

    txtSenhaFocusNode?.dispose();
    txtSenhaController?.dispose();
  }
}
