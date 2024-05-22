import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/sign/sign4_sht_01/sign4_sht01_widget.dart';
import 'set2_widget.dart' show Set2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Set2Model extends FlutterFlowModel<Set2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for intro widget.
  FocusNode? introFocusNode;
  TextEditingController? introTextController;
  String? Function(BuildContext, String?)? introTextControllerValidator;
  // Stores action output result for [Bottom Sheet - sign4_sht_01] action in Button widget.
  String? dept;
  // State field(s) for position widget.
  FormFieldController<List<String>>? positionValueController;
  String? get positionValue => positionValueController?.value?.firstOrNull;
  set positionValue(String? val) =>
      positionValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    introFocusNode?.dispose();
    introTextController?.dispose();
  }
}
