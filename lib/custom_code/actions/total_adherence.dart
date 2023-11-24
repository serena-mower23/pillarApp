// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> totalAdherence(MedInfoStruct medInfo) async {
  // Add your function code here!

  List<MedTimeStruct> medTimes = medInfo.whenToTake;
  int adherence = 0;
  int occurrences = 0;

  for (MedTimeStruct medTime in medTimes) {
    adherence += medTime.adherence;
    occurrences += medTime.occurrences;
  }

  double percentageAdherence = (adherence / occurrences) * 100;

  return percentageAdherence;
}
