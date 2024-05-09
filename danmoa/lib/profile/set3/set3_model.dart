import '/flutter_flow/flutter_flow_util.dart';
import 'set3_widget.dart' show Set3Widget;
import 'package:flutter/material.dart';

class Set3Model extends FlutterFlowModel<Set3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for sign1_tf_03 widget.
  FocusNode? sign1Tf03FocusNode;
  TextEditingController? sign1Tf03TextController;
  String? Function(BuildContext, String?)? sign1Tf03TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    sign1Tf03FocusNode?.dispose();
    sign1Tf03TextController?.dispose();
  }
}
