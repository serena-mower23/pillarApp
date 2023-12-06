// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<MedTimeStruct> findMedsForToday(List<MedInfoStruct> meds) {
  var now = DateTime.now();
  var currentDay = now.weekday;

  List<MedTimeStruct> medTimesForToday = <MedTimeStruct>[];

  for (MedInfoStruct med in meds) {
    for (MedTimeStruct medTime in med.whenToTake) {
      var shouldTakeToday = false;

      switch (currentDay) {
        case DateTime.monday:
          shouldTakeToday = medTime.monday;
          break;
        case DateTime.tuesday:
          shouldTakeToday = medTime.tuesday;
          break;
        case DateTime.wednesday:
          shouldTakeToday = medTime.wednesday;
          break;
        case DateTime.thursday:
          shouldTakeToday = medTime.thursday;
          break;
        case DateTime.friday:
          shouldTakeToday = medTime.friday;
          break;
        case DateTime.saturday:
          shouldTakeToday = medTime.saturday;
          break;
        case DateTime.sunday:
          shouldTakeToday = medTime.sunday;
          break;
      }

      if (shouldTakeToday) {
        medTimesForToday.add(medTime);
      }
    }
  }

  return medTimesForToday;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
