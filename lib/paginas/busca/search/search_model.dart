import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> usersLocalStates = [];
  void addToUsersLocalStates(UsersRecord item) => usersLocalStates.add(item);
  void removeFromUsersLocalStates(UsersRecord item) =>
      usersLocalStates.remove(item);
  void removeAtIndexFromUsersLocalStates(int index) =>
      usersLocalStates.removeAt(index);
  void insertAtIndexInUsersLocalStates(int index, UsersRecord item) =>
      usersLocalStates.insert(index, item);
  void updateUsersLocalStatesAtIndex(
          int index, Function(UsersRecord) updateFn) =>
      usersLocalStates[index] = updateFn(usersLocalStates[index]);

  UsersRecord? userLocalState;

  bool favoritoLocalState = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Search widget.
  List<UsersRecord>? outLoad;
  // Stores action output result for [Firestore Query - Query a collection] action in Search widget.
  List<FavoritosRecord>? outFavoritosLoad;
  // State field(s) for txtBusca widget.
  FocusNode? txtBuscaFocusNode;
  TextEditingController? txtBuscaTextController;
  String? Function(BuildContext, String?)? txtBuscaTextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtBuscaFocusNode?.dispose();
    txtBuscaTextController?.dispose();
  }
}
