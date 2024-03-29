import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'std_make2_widget.dart' show StdMake2Widget;
import 'package:flutter/material.dart';

class StdMake2Model extends FlutterFlowModel<StdMake2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for stdMake2_cc_01 widget.
  FormFieldController<List<String>>? stdMake2Cc01ValueController;
  String? get stdMake2Cc01Value =>
      stdMake2Cc01ValueController?.value?.firstOrNull;
  set stdMake2Cc01Value(String? val) =>
      stdMake2Cc01ValueController?.value = val != null ? [val] : [];
  // State field(s) for stdMake2_cc_02 widget.
  FormFieldController<List<String>>? stdMake2Cc02ValueController;
  String? get stdMake2Cc02Value =>
      stdMake2Cc02ValueController?.value?.firstOrNull;
  set stdMake2Cc02Value(String? val) =>
      stdMake2Cc02ValueController?.value = val != null ? [val] : [];
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
