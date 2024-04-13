import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'agenda_widget.dart' show AgendaWidget;
import 'package:flutter/material.dart';

class AgendaModel extends FlutterFlowModel<AgendaWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> psListaHora = [];
  void addToPsListaHora(UsersRecord item) => psListaHora.add(item);
  void removeFromPsListaHora(UsersRecord item) => psListaHora.remove(item);
  void removeAtIndexFromPsListaHora(int index) => psListaHora.removeAt(index);
  void insertAtIndexInPsListaHora(int index, UsersRecord item) =>
      psListaHora.insert(index, item);
  void updatePsListaHoraAtIndex(int index, Function(UsersRecord) updateFn) =>
      psListaHora[index] = updateFn(psListaHora[index]);

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
