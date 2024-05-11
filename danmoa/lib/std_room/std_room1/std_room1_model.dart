import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'std_room1_widget.dart' show StdRoom1Widget;
import 'package:flutter/material.dart';

class StdRoom1Model extends FlutterFlowModel<StdRoom1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for std_cc widget.
  FormFieldController<List<String>>? stdCcValueController;
  String? get stdCcValue => stdCcValueController?.value?.firstOrNull;
  set stdCcValue(String? val) =>
      stdCcValueController?.value = val != null ? [val] : [];

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
