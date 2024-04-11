import '/flutter_flow/flutter_flow_util.dart';
import 'home1_widget.dart' show Home1Widget;
import 'package:flutter/material.dart';

class Home1Model extends FlutterFlowModel<Home1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for home1_pv_01 widget.
  PageController? home1Pv01Controller;

  int get home1Pv01CurrentIndex => home1Pv01Controller != null &&
          home1Pv01Controller!.hasClients &&
          home1Pv01Controller!.page != null
      ? home1Pv01Controller!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
