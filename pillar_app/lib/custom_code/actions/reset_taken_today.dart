// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<MedInfoStruct>> resetTakenToday(
    List<MedInfoStruct> meds, DateTime currentTime) async {
  // Add your function code here!

  for (MedInfoStruct med in meds) {
    for (MedTimeStruct timeStruct in med.whenToTake) {
      if (timeStruct.takenDates.isNotEmpty) {
        for (TakenDateStruct takenDate in timeStruct.takenDates) {
          if (takenDate.takenDate?.year != currentTime.year &&
              takenDate.takenDate?.month != currentTime.month &&
              takenDate.takenDate?.day != currentTime.day) {
            timeStruct.takenToday = false;
          }
        }
      }
    }
  }
  return meds;
}
