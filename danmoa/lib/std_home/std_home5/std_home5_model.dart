import '/flutter_flow/flutter_flow_util.dart';
import 'std_home5_widget.dart' show StdHome5Widget;
import 'package:flutter/material.dart';

class StdHome5Model extends FlutterFlowModel<StdHome5Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    myBioFocusNode?.dispose();
    myBioTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();
  }
}
