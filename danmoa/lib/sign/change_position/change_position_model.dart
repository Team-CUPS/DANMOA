import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'change_position_widget.dart' show ChangePositionWidget;
import 'package:flutter/material.dart';

class ChangePositionModel extends FlutterFlowModel<ChangePositionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for std_cc widget.
  FormFieldController<List<String>>? stdCcValueController;
  String? get stdCcValue => stdCcValueController?.value?.firstOrNull;
  set stdCcValue(String? val) =>
      stdCcValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
