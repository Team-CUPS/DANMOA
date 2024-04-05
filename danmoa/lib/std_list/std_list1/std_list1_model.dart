import '/flutter_flow/flutter_flow_util.dart';
import 'std_list1_widget.dart' show StdList1Widget;
import 'package:flutter/material.dart';

class StdList1Model extends FlutterFlowModel<StdList1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
