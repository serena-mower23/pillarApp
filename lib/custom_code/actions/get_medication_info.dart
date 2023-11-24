// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<MedInfoStruct?> getMedicationInfo(
  List<MedInfoStruct> medList,
  String medName,
) async {
  // Add your function code here!

  MedInfoStruct? medInfo = null;

  for (MedInfoStruct listItem in medList) {
    if (listItem.medicationName == medName) {
      medInfo = listItem;
      break;
    }
  }

  return medInfo;
}
