import '/flutter_flow/flutter_flow_util.dart';
import 'std_list3_widget.dart' show StdList3Widget;
import 'package:flutter/material.dart';

class StdList3Model extends FlutterFlowModel<StdList3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for stdList3_tf_01 widget.
  FocusNode? stdList3Tf01FocusNode;
  TextEditingController? stdList3Tf01Controller;
  String? Function(BuildContext, String?)? stdList3Tf01ControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    stdList3Tf01FocusNode?.dispose();
    stdList3Tf01Controller?.dispose();
  }
}
