// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<MedInfoStruct>?> updateOccurrences(
    List<MedInfoStruct> medications) async {
  DateTime now = DateTime.now();
  for (var medication in medications) {
    for (var medTime in medication.whenToTake) {
      int count = 0;

      // Iterate over each day from creationDate to now
      for (DateTime date = medTime.creationDate!;
          date.isBefore(now);
          date = date.add(Duration(days: 1))) {
        // Check if the day of the week is set to true
        bool daySet = false;
        switch (date.weekday) {
          case 1:
            daySet = medTime.monday == true;
            break;
          case 2:
            daySet = medTime.tuesday == true;
            break;
          case 3:
            daySet = medTime.wednesday == true;
            break;
          case 4:
            daySet = medTime.thursday == true;
            break;
          case 5:
            daySet = medTime.friday == true;
            break;
          case 6:
            daySet = medTime.saturday == true;
            break;
          case 7:
            daySet = medTime.sunday == true;
            break;
        }

        // If the day is set to true and the time has passed, increment the count
        DateTime dateTime = DateTime(date.year, date.month, date.day,
            medTime.time!.hour, medTime.time!.minute);
        if (daySet && dateTime.isBefore(now)) {
          count++;
        }
      }

      medTime.occurrences = count;
    }
  }
  return medications;
}
