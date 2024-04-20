import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
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

  MentoriasRecord? mentoria;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, MentoriasRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    listViewPagingController1?.dispose();

    tabBarController?.dispose();
  }

  /// Action blocks.
  Future actionLoadTabAprovadas(BuildContext context) async {
    List<MentoriasRecord>? outReloadMentoriaCopy;

    outReloadMentoriaCopy = await queryMentoriasRecordOnce(
      queryBuilder: (mentoriasRecord) => mentoriasRecord
          .where(
            'uidMentor',
            isEqualTo: currentUserReference,
          )
          .where(
            'aprovar',
            isEqualTo: true,
          )
          .orderBy('data', descending: true),
    );
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, MentoriasRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, MentoriasRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, MentoriasRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryMentoriasRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }
}
