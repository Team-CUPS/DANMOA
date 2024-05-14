import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sign3_widget.dart' show Sign3Widget;
import 'package:flutter/material.dart';

class Sign3Model extends FlutterFlowModel<Sign3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for sign3_tf_01 widget.
  FocusNode? sign3Tf01FocusNode;
  TextEditingController? sign3Tf01TextController;
  String? Function(BuildContext, String?)? sign3Tf01TextControllerValidator;
  // State field(s) for sign3_tf_02 widget.
  FocusNode? sign3Tf02FocusNode;
  TextEditingController? sign3Tf02TextController;
  String? Function(BuildContext, String?)? sign3Tf02TextControllerValidator;
  // State field(s) for sign3_tf_03 widget.
  FocusNode? sign3Tf03FocusNode;
  TextEditingController? sign3Tf03TextController;
  String? Function(BuildContext, String?)? sign3Tf03TextControllerValidator;
  DateTime? datePicked;
  // State field(s) for sign3_rad_01 widget.
  FormFieldController<String>? sign3Rad01ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    sign3Tf01FocusNode?.dispose();
    sign3Tf01TextController?.dispose();

    sign3Tf02FocusNode?.dispose();
    sign3Tf02TextController?.dispose();

    sign3Tf03FocusNode?.dispose();
    sign3Tf03TextController?.dispose();
  }

  /// Additional helper methods.
  String? get sign3Rad01Value => sign3Rad01ValueController?.value;
}
