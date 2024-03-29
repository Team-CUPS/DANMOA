import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'std_list4_widget.dart' show StdList4Widget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StdList4Model extends FlutterFlowModel<StdList4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for stdList4_cc_02 widget.
  FormFieldController<List<String>>? stdList4Cc02ValueController;
  String? get stdList4Cc02Value =>
      stdList4Cc02ValueController?.value?.firstOrNull;
  set stdList4Cc02Value(String? val) =>
      stdList4Cc02ValueController?.value = val != null ? [val] : [];
  // State field(s) for stdList_cc widget.
  FormFieldController<List<String>>? stdListCcValueController1;
  String? get stdListCcValue1 => stdListCcValueController1?.value?.firstOrNull;
  set stdListCcValue1(String? val) =>
      stdListCcValueController1?.value = val != null ? [val] : [];
  // State field(s) for sign3_tf_03 widget.
  FocusNode? sign3Tf03FocusNode1;
  TextEditingController? sign3Tf03Controller1;
  String? Function(BuildContext, String?)? sign3Tf03Controller1Validator;
  DateTime? datePicked1;
  // State field(s) for stdList_cc widget.
  FormFieldController<List<String>>? stdListCcValueController2;
  String? get stdListCcValue2 => stdListCcValueController2?.value?.firstOrNull;
  set stdListCcValue2(String? val) =>
      stdListCcValueController2?.value = val != null ? [val] : [];
  // State field(s) for sign3_tf_03 widget.
  FocusNode? sign3Tf03FocusNode2;
  TextEditingController? sign3Tf03Controller2;
  String? Function(BuildContext, String?)? sign3Tf03Controller2Validator;
  DateTime? datePicked2;
  // State field(s) for stdList_cc widget.
  FormFieldController<List<String>>? stdListCcValueController3;
  String? get stdListCcValue3 => stdListCcValueController3?.value?.firstOrNull;
  set stdListCcValue3(String? val) =>
      stdListCcValueController3?.value = val != null ? [val] : [];
  // State field(s) for sign3_tf_03 widget.
  FocusNode? sign3Tf03FocusNode3;
  TextEditingController? sign3Tf03Controller3;
  String? Function(BuildContext, String?)? sign3Tf03Controller3Validator;
  DateTime? datePicked3;
  // State field(s) for stdList_cc widget.
  FormFieldController<List<String>>? stdListCcValueController4;
  String? get stdListCcValue4 => stdListCcValueController4?.value?.firstOrNull;
  set stdListCcValue4(String? val) =>
      stdListCcValueController4?.value = val != null ? [val] : [];
  // State field(s) for sign3_tf_03 widget.
  FocusNode? sign3Tf03FocusNode4;
  TextEditingController? sign3Tf03Controller4;
  String? Function(BuildContext, String?)? sign3Tf03Controller4Validator;
  DateTime? datePicked4;
  // State field(s) for stdList4_cc_03 widget.
  FormFieldController<List<String>>? stdList4Cc03ValueController;
  String? get stdList4Cc03Value =>
      stdList4Cc03ValueController?.value?.firstOrNull;
  set stdList4Cc03Value(String? val) =>
      stdList4Cc03ValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    sign3Tf03FocusNode1?.dispose();
    sign3Tf03Controller1?.dispose();

    sign3Tf03FocusNode2?.dispose();
    sign3Tf03Controller2?.dispose();

    sign3Tf03FocusNode3?.dispose();
    sign3Tf03Controller3?.dispose();

    sign3Tf03FocusNode4?.dispose();
    sign3Tf03Controller4?.dispose();
  }
}
