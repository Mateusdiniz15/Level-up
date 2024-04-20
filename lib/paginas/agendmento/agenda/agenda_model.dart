import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'agenda_widget.dart' show AgendaWidget;
import 'package:flutter/material.dart';

class AgendaModel extends FlutterFlowModel<AgendaWidget> {
  ///  Local state fields for this page.

  bool vConfirmar = false;

  DateTime? dateSelectedLocalState;

  List<DateTime> dateTimesLocalState = [];
  void addToDateTimesLocalState(DateTime item) => dateTimesLocalState.add(item);
  void removeFromDateTimesLocalState(DateTime item) =>
      dateTimesLocalState.remove(item);
  void removeAtIndexFromDateTimesLocalState(int index) =>
      dateTimesLocalState.removeAt(index);
  void insertAtIndexInDateTimesLocalState(int index, DateTime item) =>
      dateTimesLocalState.insert(index, item);
  void updateDateTimesLocalStateAtIndex(
          int index, Function(DateTime) updateFn) =>
      dateTimesLocalState[index] = updateFn(dateTimesLocalState[index]);

  List<DisponibilidadeMentoresRecord> datasMentorLocalState = [];
  void addToDatasMentorLocalState(DisponibilidadeMentoresRecord item) =>
      datasMentorLocalState.add(item);
  void removeFromDatasMentorLocalState(DisponibilidadeMentoresRecord item) =>
      datasMentorLocalState.remove(item);
  void removeAtIndexFromDatasMentorLocalState(int index) =>
      datasMentorLocalState.removeAt(index);
  void insertAtIndexInDatasMentorLocalState(
          int index, DisponibilidadeMentoresRecord item) =>
      datasMentorLocalState.insert(index, item);
  void updateDatasMentorLocalStateAtIndex(
          int index, Function(DisponibilidadeMentoresRecord) updateFn) =>
      datasMentorLocalState[index] = updateFn(datasMentorLocalState[index]);

  DisponibilidadeMentoresRecord? dataMentorLocalState;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DisponibilidadeMentoresRecord? outAlinhado;

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
