import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'agendamento_widget.dart' show AgendamentoWidget;
import 'package:flutter/material.dart';

class AgendamentoModel extends FlutterFlowModel<AgendamentoWidget> {
  ///  Local state fields for this page.

  DateTime? dataSelecionavel;

  int? psIndex;

  List<HorasDisponiveisStruct> psListaHoras = [];
  void addToPsListaHoras(HorasDisponiveisStruct item) => psListaHoras.add(item);
  void removeFromPsListaHoras(HorasDisponiveisStruct item) =>
      psListaHoras.remove(item);
  void removeAtIndexFromPsListaHoras(int index) => psListaHoras.removeAt(index);
  void insertAtIndexInPsListaHoras(int index, HorasDisponiveisStruct item) =>
      psListaHoras.insert(index, item);
  void updatePsListaHorasAtIndex(
          int index, Function(HorasDisponiveisStruct) updateFn) =>
      psListaHoras[index] = updateFn(psListaHoras[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  UsersRecord? outRefreshBuscarMentor;

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
