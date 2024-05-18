import '/flutter_flow/flutter_flow_util.dart';
import 'dup_sht_prf_widget.dart' show DupShtPrfWidget;
import 'package:flutter/material.dart';

class DupShtPrfModel extends FlutterFlowModel<DupShtPrfWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for display_name widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();
  }
}
