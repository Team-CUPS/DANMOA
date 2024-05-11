import '/flutter_flow/flutter_flow_util.dart';
import 'sign1_widget.dart' show Sign1Widget;
import 'package:flutter/material.dart';

class Sign1Model extends FlutterFlowModel<Sign1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for sign1_tf_01 widget.
  FocusNode? sign1Tf01FocusNode;
  TextEditingController? sign1Tf01TextController;
  String? Function(BuildContext, String?)? sign1Tf01TextControllerValidator;
  // State field(s) for sign1_tf_02 widget.
  FocusNode? sign1Tf02FocusNode;
  TextEditingController? sign1Tf02TextController;
  late bool sign1Tf02Visibility;
  String? Function(BuildContext, String?)? sign1Tf02TextControllerValidator;

  @override
  void initState(BuildContext context) {
    sign1Tf02Visibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sign1Tf01FocusNode?.dispose();
    sign1Tf01TextController?.dispose();

    sign1Tf02FocusNode?.dispose();
    sign1Tf02TextController?.dispose();
  }
}
