import '/flutter_flow/flutter_flow_util.dart';
import 'std_list2_widget.dart' show StdList2Widget;
import 'package:flutter/material.dart';

class StdList2Model extends FlutterFlowModel<StdList2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
