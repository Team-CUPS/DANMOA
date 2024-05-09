import '/flutter_flow/flutter_flow_util.dart';
import 'std_make1_widget.dart' show StdMake1Widget;
import 'package:flutter/material.dart';

class StdMake1Model extends FlutterFlowModel<StdMake1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for stdMake1_tf_01 widget.
  FocusNode? stdMake1Tf01FocusNode;
  TextEditingController? stdMake1Tf01TextController;
  String? Function(BuildContext, String?)? stdMake1Tf01TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    stdMake1Tf01FocusNode?.dispose();
    stdMake1Tf01TextController?.dispose();
  }
}
