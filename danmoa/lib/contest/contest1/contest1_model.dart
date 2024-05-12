import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'contest1_widget.dart' show Contest1Widget;
import 'package:flutter/material.dart';

class Contest1Model extends FlutterFlowModel<Contest1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for tf_field widget.
  String? tfFieldValue;
  FormFieldController<String>? tfFieldValueController;
  // State field(s) for tf_person widget.
  String? tfPersonValue;
  FormFieldController<String>? tfPersonValueController;
  // State field(s) for tf_state widget.
  String? tfStateValue;
  FormFieldController<String>? tfStateValueController;
  // State field(s) for tf_area widget.
  String? tfAreaValue;
  FormFieldController<String>? tfAreaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
