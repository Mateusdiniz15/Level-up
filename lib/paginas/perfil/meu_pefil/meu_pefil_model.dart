import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'meu_pefil_widget.dart' show MeuPefilWidget;
import 'package:flutter/material.dart';

class MeuPefilModel extends FlutterFlowModel<MeuPefilWidget> {
  ///  Local state fields for this page.

  DocumentReference? campusDocRefLocalState;

  DocumentReference? graduacaoDocRefLocalState;

  DocumentReference? instituicaoDocRefLocalState;

  String phooLocalState = 'false';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  // State field(s) for txtEspecialidade widget.
  FocusNode? txtEspecialidadeFocusNode;
  TextEditingController? txtEspecialidadeTextController;
  String? Function(BuildContext, String?)?
      txtEspecialidadeTextControllerValidator;
  // State field(s) for ddlCmapus widget.
  String? ddlCmapusValue;
  FormFieldController<String>? ddlCmapusValueController;
  // State field(s) for txtLinkedin widget.
  FocusNode? txtLinkedinFocusNode;
  TextEditingController? txtLinkedinTextController;
  String? Function(BuildContext, String?)? txtLinkedinTextControllerValidator;
  // State field(s) for txtSobreMim widget.
  FocusNode? txtSobreMimFocusNode;
  TextEditingController? txtSobreMimTextController;
  String? Function(BuildContext, String?)? txtSobreMimTextControllerValidator;
  // State field(s) for txtInformacoesAdicionais widget.
  FocusNode? txtInformacoesAdicionaisFocusNode;
  TextEditingController? txtInformacoesAdicionaisTextController;
  String? Function(BuildContext, String?)?
      txtInformacoesAdicionaisTextControllerValidator;
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
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtEspecialidadeFocusNode?.dispose();
    txtEspecialidadeTextController?.dispose();

    txtLinkedinFocusNode?.dispose();
    txtLinkedinTextController?.dispose();

    txtSobreMimFocusNode?.dispose();
    txtSobreMimTextController?.dispose();

    txtInformacoesAdicionaisFocusNode?.dispose();
    txtInformacoesAdicionaisTextController?.dispose();
  }
}
