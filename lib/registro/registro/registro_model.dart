import '/flutter_flow/flutter_flow_util.dart';
import 'registro_widget.dart' show RegistroWidget;
import 'package:flutter/material.dart';

class RegistroModel extends FlutterFlowModel<RegistroWidget> {
  ///  Local state fields for this page.

  bool psConcordar = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeController;
  String? Function(BuildContext, String?)? txtNomeControllerValidator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtSenha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaControllerValidator;
  // State field(s) for txtConfirmaSenha widget.
  FocusNode? txtConfirmaSenhaFocusNode;
  TextEditingController? txtConfirmaSenhaController;
  late bool txtConfirmaSenhaVisibility;
  String? Function(BuildContext, String?)? txtConfirmaSenhaControllerValidator;
  // State field(s) for chkConduta widget.
  bool? chkCondutaValue;

  @override
  void initState(BuildContext context) {
    txtSenhaVisibility = false;
    txtConfirmaSenhaVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtNomeFocusNode?.dispose();
    txtNomeController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailController?.dispose();

    txtSenhaFocusNode?.dispose();
    txtSenhaController?.dispose();

    txtConfirmaSenhaFocusNode?.dispose();
    txtConfirmaSenhaController?.dispose();
  }
}
