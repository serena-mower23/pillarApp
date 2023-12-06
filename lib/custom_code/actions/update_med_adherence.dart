// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/auth/firebase_auth/auth_util.dart';

List<MedInfoStruct>? updateMedAdherence(
    List<MedInfoStruct> medications,
    String medicationName,
    DateTime medTime,
    String newBottleWeight,
    String newPillCount) {
  // Find the medication to update
  MedInfoStruct? medicationToUpdate =
      medications.firstWhere((med) => med.medicationName == medicationName);

  // Find the medTime to update
  List<MedTimeStruct> medTimes = medicationToUpdate.whenToTake;
  MedTimeStruct? medTimeToUpdate =
      medTimes.firstWhere((time) => time.time == medTime);

  // Update the adherence
  int currentAdherence = medTimeToUpdate.adherence;
  currentAdherence += 1;
  medTimeToUpdate.adherence = currentAdherence;
  medTimeToUpdate.takenToday = true;

  // Update the whenToTake list in the medication
  medicationToUpdate.whenToTake = medTimes;
  medicationToUpdate.pillBottleWeight = newBottleWeight;
  medicationToUpdate.pillCount = newPillCount;

  return medications;
}
