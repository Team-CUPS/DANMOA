import '/flutter_flow/flutter_flow_util.dart';
import 'sign1_sht01_widget.dart' show Sign1Sht01Widget;
import 'package:flutter/material.dart';

class Sign1Sht01Model extends FlutterFlowModel<Sign1Sht01Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for sign1_tf_03 widget.
  FocusNode? sign1Tf03FocusNode;
  TextEditingController? sign1Tf03TextController;
  String? Function(BuildContext, String?)? sign1Tf03TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sign1Tf03FocusNode?.dispose();
    sign1Tf03TextController?.dispose();
  }
}
