import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'historico_widget.dart' show HistoricoWidget;
import 'package:flutter/material.dart';

class HistoricoModel extends FlutterFlowModel<HistoricoWidget> {
  ///  Local state fields for this page.

  List<MentoriasRecord> listaLocalState = [];
  void addToListaLocalState(MentoriasRecord item) => listaLocalState.add(item);
  void removeFromListaLocalState(MentoriasRecord item) =>
      listaLocalState.remove(item);
  void removeAtIndexFromListaLocalState(int index) =>
      listaLocalState.removeAt(index);
  void insertAtIndexInListaLocalState(int index, MentoriasRecord item) =>
      listaLocalState.insert(index, item);
  void updateListaLocalStateAtIndex(
          int index, Function(MentoriasRecord) updateFn) =>
      listaLocalState[index] = updateFn(listaLocalState[index]);

  UsersRecord? userLocalState;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Historico widget.
  List<MentoriasRecord>? outLoad;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
