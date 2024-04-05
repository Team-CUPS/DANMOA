import '/flutter_flow/flutter_flow_util.dart';
import 'std_make3_widget.dart' show StdMake3Widget;
import 'package:flutter/material.dart';

class StdMake3Model extends FlutterFlowModel<StdMake3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for stdMake3_tf_01 widget.
  FocusNode? stdMake3Tf01FocusNode;
  TextEditingController? stdMake3Tf01Controller;
  String? Function(BuildContext, String?)? stdMake3Tf01ControllerValidator;
  // State field(s) for stdMake3_tf_02 widget.
  FocusNode? stdMake3Tf02FocusNode;
  TextEditingController? stdMake3Tf02Controller;
  String? Function(BuildContext, String?)? stdMake3Tf02ControllerValidator;
  // State field(s) for stdMake3_tf_03 widget.
  FocusNode? stdMake3Tf03FocusNode;
  TextEditingController? stdMake3Tf03Controller;
  late bool stdMake3Tf03Visibility;
  String? Function(BuildContext, String?)? stdMake3Tf03ControllerValidator;

  @override
  void initState(BuildContext context) {
    stdMake3Tf03Visibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    stdMake3Tf01FocusNode?.dispose();
    stdMake3Tf01Controller?.dispose();

    stdMake3Tf02FocusNode?.dispose();
    stdMake3Tf02Controller?.dispose();

    stdMake3Tf03FocusNode?.dispose();
    stdMake3Tf03Controller?.dispose();
  }
}
