// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pillar_app/backend/schema/structs/taken_date_struct.dart';

import '/auth/firebase_auth/auth_util.dart';

List<MedInfoStruct>? updateMedAdherence(
    List<MedInfoStruct> medications,
    String medicationName,
    DateTime medTime,
    String newBottleWeight,
    String newPillCount,
    bool manualSubmission) {
  // Find the medication to update
  MedInfoStruct? medicationToUpdate =
      medications.firstWhere((med) => med.medicationName == medicationName);

  // Find the medTime to update
  List<MedTimeStruct> medTimes = medicationToUpdate.whenToTake;
  MedTimeStruct? medTimeToUpdate =
      medTimes.firstWhere((med) => med.medName == medicationName);

  // Update the adherence
  int currentAdherence = medTimeToUpdate.adherence;
  currentAdherence += 1;
  medTimeToUpdate.adherence = currentAdherence;

  List<TakenDateStruct> takenDates = medTimeToUpdate.takenDates;
  TakenDateStruct newTakenDate = TakenDateStruct(
      takenDate: DateTime.now(), manualSubmission: manualSubmission);
  takenDates.add(newTakenDate);
  medTimeToUpdate.takenDates = takenDates;

  medTimeToUpdate.takenToday = true;

  // Update the whenToTake list in the medication
  medicationToUpdate.whenToTake = medTimes;
  if (double.parse(newBottleWeight) > 0.0) {
    medicationToUpdate.pillBottleWeight = newBottleWeight;
  } else {
    medicationToUpdate.pillBottleWeight = "0.0";
  }

  if (double.parse(newPillCount) > 0.0) {
    medicationToUpdate.pillCount = newPillCount;
  } else {
    medicationToUpdate.pillCount = "0.0";
  }

  return medications;
}
