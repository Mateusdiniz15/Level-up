import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'buscar_mentores_widget.dart' show BuscarMentoresWidget;
import 'package:flutter/material.dart';

class BuscarMentoresModel extends FlutterFlowModel<BuscarMentoresWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> psLista = [];
  void addToPsLista(UsersRecord item) => psLista.add(item);
  void removeFromPsLista(UsersRecord item) => psLista.remove(item);
  void removeAtIndexFromPsLista(int index) => psLista.removeAt(index);
  void insertAtIndexInPsLista(int index, UsersRecord item) =>
      psLista.insert(index, item);
  void updatePsListaAtIndex(int index, Function(UsersRecord) updateFn) =>
      psLista[index] = updateFn(psLista[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in BuscarMentores widget.
  List<UsersRecord>? outAllLoadMentor;
  // State field(s) for txtBusca widget.
  FocusNode? txtBuscaFocusNode;
  TextEditingController? txtBuscaController;
  String? Function(BuildContext, String?)? txtBuscaControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtBuscaFocusNode?.dispose();
    txtBuscaController?.dispose();
  }
}
