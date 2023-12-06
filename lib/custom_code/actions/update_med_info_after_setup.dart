// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import '/auth/firebase_auth/auth_util.dart';

List<MedInfoStruct>? updateMedInfoAfterSetup(
  List<MedInfoStruct> medications,
  String medicationName,
  String newPillWeight,
  String newPillBottleWeight,
  BTDeviceStruct newPedestalInfo,
) {
  // Find the medication to update
  MedInfoStruct? medicationToUpdate =
      medications.firstWhere((med) => med.medicationName == medicationName);

  // If the medication was found, update the fields

  medicationToUpdate.pillWeight = newPillWeight;
  medicationToUpdate.pillBottleWeight = newPillBottleWeight;
  medicationToUpdate.pedestalInfo = newPedestalInfo;

  return medications;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
