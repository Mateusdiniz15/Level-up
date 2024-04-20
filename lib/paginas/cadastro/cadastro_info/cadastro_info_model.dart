import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_info_widget.dart' show CadastroInfoWidget;
import 'package:flutter/material.dart';

class CadastroInfoModel extends FlutterFlowModel<CadastroInfoWidget> {
  ///  Local state fields for this page.

  bool psConcordar = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  // State field(s) for txtSenha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaTextController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaTextControllerValidator;
  // State field(s) for txtRepetirSenha widget.
  FocusNode? txtRepetirSenhaFocusNode;
  TextEditingController? txtRepetirSenhaTextController;
  late bool txtRepetirSenhaVisibility;
  String? Function(BuildContext, String?)?
      txtRepetirSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtSenhaVisibility = false;
    txtRepetirSenhaVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtSenhaFocusNode?.dispose();
    txtSenhaTextController?.dispose();

    txtRepetirSenhaFocusNode?.dispose();
    txtRepetirSenhaTextController?.dispose();
  }
}
