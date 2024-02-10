// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<MedTimeStruct> getMedTimeStructsWithDaySetToTrue(
    List<MedTimeStruct> medTimes) {
  String dayOfWeek = FFAppConstants.daysOfTheWeek[DateTime.now().weekday - 1];
  List<MedTimeStruct> matchingMedTimes = [];

  for (MedTimeStruct medTime in medTimes) {
    switch (dayOfWeek) {
      case 'Mon':
        if (medTime.monday) matchingMedTimes.add(medTime);
        break;
      case 'Tue':
        if (medTime.tuesday) matchingMedTimes.add(medTime);
        break;
      case 'Wed':
        if (medTime.wednesday) matchingMedTimes.add(medTime);
        break;
      case 'Thu':
        if (medTime.thursday) matchingMedTimes.add(medTime);
        break;
      case 'Fri':
        if (medTime.friday) matchingMedTimes.add(medTime);
        break;
      case 'Sat':
        if (medTime.saturday) matchingMedTimes.add(medTime);
        break;
      case 'Sun':
        if (medTime.sunday) matchingMedTimes.add(medTime);
        break;
    }
  }

  return matchingMedTimes;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
