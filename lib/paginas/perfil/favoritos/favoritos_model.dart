import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favoritos_widget.dart' show FavoritosWidget;
import 'package:flutter/material.dart';

class FavoritosModel extends FlutterFlowModel<FavoritosWidget> {
  ///  Local state fields for this page.

  List<FavoritosRecord> favoritosLocalState = [];
  void addToFavoritosLocalState(FavoritosRecord item) =>
      favoritosLocalState.add(item);
  void removeFromFavoritosLocalState(FavoritosRecord item) =>
      favoritosLocalState.remove(item);
  void removeAtIndexFromFavoritosLocalState(int index) =>
      favoritosLocalState.removeAt(index);
  void insertAtIndexInFavoritosLocalState(int index, FavoritosRecord item) =>
      favoritosLocalState.insert(index, item);
  void updateFavoritosLocalStateAtIndex(
          int index, Function(FavoritosRecord) updateFn) =>
      favoritosLocalState[index] = updateFn(favoritosLocalState[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Favoritos widget.
  List<FavoritosRecord>? outFavoritosLoad;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
