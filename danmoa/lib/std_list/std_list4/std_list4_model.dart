import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'std_list4_widget.dart' show StdList4Widget;
import 'package:flutter/material.dart';

class StdList4Model extends FlutterFlowModel<StdList4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for stdList4_cc_02 widget.
  FormFieldController<List<String>>? stdList4Cc02ValueController;
  String? get stdList4Cc02Value =>
      stdList4Cc02ValueController?.value?.firstOrNull;
  set stdList4Cc02Value(String? val) =>
      stdList4Cc02ValueController?.value = val != null ? [val] : [];
  // State field(s) for stdList4_cc_03 widget.
  FormFieldController<List<String>>? stdList4Cc03ValueController;
  List<String>? get stdList4Cc03Values => stdList4Cc03ValueController?.value;
  set stdList4Cc03Values(List<String>? val) =>
      stdList4Cc03ValueController?.value = val;
  // State field(s) for stdList4_cc_06 widget.
  FormFieldController<List<String>>? stdList4Cc06ValueController;
  String? get stdList4Cc06Value =>
      stdList4Cc06ValueController?.value?.firstOrNull;
  set stdList4Cc06Value(String? val) =>
      stdList4Cc06ValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
