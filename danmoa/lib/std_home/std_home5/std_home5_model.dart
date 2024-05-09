import '/flutter_flow/flutter_flow_util.dart';
import 'std_home5_widget.dart' show StdHome5Widget;
import 'package:flutter/material.dart';

class StdHome5Model extends FlutterFlowModel<StdHome5Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for stdMake3_tf_02 widget.
  FocusNode? stdMake3Tf02FocusNode;
  TextEditingController? stdMake3Tf02TextController;
  String? Function(BuildContext, String?)? stdMake3Tf02TextControllerValidator;
  // State field(s) for stdMake3_tf_03 widget.
  FocusNode? stdMake3Tf03FocusNode;
  TextEditingController? stdMake3Tf03TextController;
  late bool stdMake3Tf03Visibility;
  String? Function(BuildContext, String?)? stdMake3Tf03TextControllerValidator;

  @override
  void initState(BuildContext context) {
    stdMake3Tf03Visibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    stdMake3Tf02FocusNode?.dispose();
    stdMake3Tf02TextController?.dispose();

    stdMake3Tf03FocusNode?.dispose();
    stdMake3Tf03TextController?.dispose();
  }
}
