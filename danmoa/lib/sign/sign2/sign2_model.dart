import '/flutter_flow/flutter_flow_util.dart';
import 'sign2_widget.dart' show Sign2Widget;
import 'package:flutter/material.dart';

class Sign2Model extends FlutterFlowModel<Sign2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for sign2_tf_01 widget.
  FocusNode? sign2Tf01FocusNode;
  TextEditingController? sign2Tf01TextController;
  String? Function(BuildContext, String?)? sign2Tf01TextControllerValidator;
  // State field(s) for sign2_tf_02 widget.
  FocusNode? sign2Tf02FocusNode;
  TextEditingController? sign2Tf02TextController;
  late bool sign2Tf02Visibility;
  String? Function(BuildContext, String?)? sign2Tf02TextControllerValidator;
  // State field(s) for sign2_tf_03 widget.
  FocusNode? sign2Tf03FocusNode;
  TextEditingController? sign2Tf03TextController;
  late bool sign2Tf03Visibility;
  String? Function(BuildContext, String?)? sign2Tf03TextControllerValidator;

  @override
  void initState(BuildContext context) {
    sign2Tf02Visibility = false;
    sign2Tf03Visibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sign2Tf01FocusNode?.dispose();
    sign2Tf01TextController?.dispose();

    sign2Tf02FocusNode?.dispose();
    sign2Tf02TextController?.dispose();

    sign2Tf03FocusNode?.dispose();
    sign2Tf03TextController?.dispose();
  }
}
