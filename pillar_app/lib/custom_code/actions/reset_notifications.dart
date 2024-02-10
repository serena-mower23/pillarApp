// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future resetNotifications(List<MedInfoStruct> meds, String? medName) async {
  if (medName != null) {
    for (MedInfoStruct med in meds) {
      if (med.medicationName != medName) {
        List<MedTimeStruct> medTimes = med.whenToTake;
        setMedReminders(med.medicationName, medTimes);
      }
    }
  } else {
    for (MedInfoStruct med in meds) {
      List<MedTimeStruct> medTimes = med.whenToTake;
      setMedReminders(med.medicationName, medTimes);
    }
  }
}
