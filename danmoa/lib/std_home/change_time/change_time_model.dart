import '/flutter_flow/flutter_flow_util.dart';
import 'change_time_widget.dart' show ChangeTimeWidget;
import 'package:flutter/material.dart';

class ChangeTimeModel extends FlutterFlowModel<ChangeTimeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
