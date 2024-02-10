// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<MedInfoStruct>> editMedications(
  List<MedInfoStruct> meds,
  String oldMedName,
  String newMedName,
  String newDosage,
  String newPillCount,
  String newPillDosageCount,
  bool newWithFood,
  List<MedTimeStruct> newWhenToTake,
) async {
  MedInfoStruct? medicationToUpdate =
      meds.firstWhere((med) => med.medicationName == oldMedName);

  medicationToUpdate.medicationName = newMedName;
  medicationToUpdate.dosageAmount = newDosage;
  medicationToUpdate.pillCount = newPillCount;
  medicationToUpdate.pillCountDosage = newPillDosageCount;
  medicationToUpdate.withFood = newWithFood;
  medicationToUpdate.whenToTake = newWhenToTake;

  return meds;
}
