import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sign4_widget.dart' show Sign4Widget;
import 'package:flutter/material.dart';

class Sign4Model extends FlutterFlowModel<Sign4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for sign4_tf_01 widget.
  FocusNode? sign4Tf01FocusNode;
  TextEditingController? sign4Tf01Controller;
  String? Function(BuildContext, String?)? sign4Tf01ControllerValidator;
  // State field(s) for sign4_cc_01 widget.
  FormFieldController<List<String>>? sign4Cc01ValueController;
  String? get sign4Cc01Value => sign4Cc01ValueController?.value?.firstOrNull;
  set sign4Cc01Value(String? val) =>
      sign4Cc01ValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    sign4Tf01FocusNode?.dispose();
    sign4Tf01Controller?.dispose();
  }
}
