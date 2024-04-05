import '/flutter_flow/flutter_flow_util.dart';
import 'set4_widget.dart' show Set4Widget;
import 'package:flutter/material.dart';

class Set4Model extends FlutterFlowModel<Set4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
