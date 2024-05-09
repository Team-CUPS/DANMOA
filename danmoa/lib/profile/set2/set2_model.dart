import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'set2_widget.dart' show Set2Widget;
import 'package:flutter/material.dart';

class Set2Model extends FlutterFlowModel<Set2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for sign3_tf_02 widget.
  FocusNode? sign3Tf02FocusNode;
  TextEditingController? sign3Tf02TextController;
  String? Function(BuildContext, String?)? sign3Tf02TextControllerValidator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;
  // Stores action output result for [Bottom Sheet - sign4_sht_01] action in Button widget.
  String? dept;
  // State field(s) for sign4_cc_01 widget.
  FormFieldController<List<String>>? sign4Cc01ValueController;
  String? get sign4Cc01Value => sign4Cc01ValueController?.value?.firstOrNull;
  set sign4Cc01Value(String? val) =>
      sign4Cc01ValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    sign3Tf02FocusNode?.dispose();
    sign3Tf02TextController?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();
  }
}
