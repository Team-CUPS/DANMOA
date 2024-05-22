import '/flutter_flow/flutter_flow_util.dart';
import 'std_make1_widget.dart' show StdMake1Widget;
import 'package:flutter/material.dart';

class StdMake1Model extends FlutterFlowModel<StdMake1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for stdName widget.
  FocusNode? stdNameFocusNode;
  TextEditingController? stdNameTextController;
  String? Function(BuildContext, String?)? stdNameTextControllerValidator;
  // State field(s) for stdIntro widget.
  FocusNode? stdIntroFocusNode;
  TextEditingController? stdIntroTextController;
  String? Function(BuildContext, String?)? stdIntroTextControllerValidator;
  // State field(s) for stdUrl widget.
  FocusNode? stdUrlFocusNode;
  TextEditingController? stdUrlTextController;
  String? Function(BuildContext, String?)? stdUrlTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    stdNameFocusNode?.dispose();
    stdNameTextController?.dispose();

    stdIntroFocusNode?.dispose();
    stdIntroTextController?.dispose();

    stdUrlFocusNode?.dispose();
    stdUrlTextController?.dispose();
  }
}
