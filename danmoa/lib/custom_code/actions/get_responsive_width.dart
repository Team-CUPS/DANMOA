// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future getResponsiveWidth(BuildContext context) async {
  if (MediaQuery.sizeOf(context).width < 390.0) {
    return 350.0;
  } else if (MediaQuery.sizeOf(context).width < 450.0) {
    return 380.0;
  } else if (MediaQuery.sizeOf(context).width < 1000.0) {
    return 700.0;
  } else {
    return 900.0;
  }
}
