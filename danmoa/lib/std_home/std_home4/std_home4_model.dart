import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'std_home4_widget.dart' show StdHome4Widget;
import 'package:flutter/material.dart';

class StdHome4Model extends FlutterFlowModel<StdHome4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for stdMake2_cc_01 widget.
  FormFieldController<List<String>>? stdMake2Cc01ValueController;
  String? get stdMake2Cc01Value =>
      stdMake2Cc01ValueController?.value?.firstOrNull;
  set stdMake2Cc01Value(String? val) =>
      stdMake2Cc01ValueController?.value = val != null ? [val] : [];
  // State field(s) for stdList4_cc_03 widget.
  FormFieldController<List<String>>? stdList4Cc03ValueController;
  List<String>? get stdList4Cc03Values => stdList4Cc03ValueController?.value;
  set stdList4Cc03Values(List<String>? val) =>
      stdList4Cc03ValueController?.value = val;
  // State field(s) for stdMake2_cc_03 widget.
  FormFieldController<List<String>>? stdMake2Cc03ValueController;
  String? get stdMake2Cc03Value =>
      stdMake2Cc03ValueController?.value?.firstOrNull;
  set stdMake2Cc03Value(String? val) =>
      stdMake2Cc03ValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
