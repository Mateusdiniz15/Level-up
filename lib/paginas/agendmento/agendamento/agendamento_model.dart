import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'agendamento_widget.dart' show AgendamentoWidget;
import 'package:flutter/material.dart';

class AgendamentoModel extends FlutterFlowModel<AgendamentoWidget> {
  ///  Local state fields for this page.

  bool vConfirmar = false;

  DataHorasStruct? dataHorasListaLocalState;
  void updateDataHorasListaLocalStateStruct(
          Function(DataHorasStruct) updateFn) =>
      updateFn(dataHorasListaLocalState ??= DataHorasStruct());

  int? index;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Agendamento widget.
  List<DisponibilidadeMentoresRecord>? outLoad;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? outCreateChat;

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
