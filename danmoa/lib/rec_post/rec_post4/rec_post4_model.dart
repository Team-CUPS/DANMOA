import '/flutter_flow/flutter_flow_util.dart';
import 'rec_post4_widget.dart' show RecPost4Widget;
import 'package:flutter/material.dart';

class RecPost4Model extends FlutterFlowModel<RecPost4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
