// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<MedicationStruct?> getMedicationInfo(String medID) async {
  final db = FirebaseFirestore.instance;

  final collection = db.collection('medications');
  final document = collection.doc(medID);

  MedicationStruct? medInfo = null;

  document.get().then((docSnapshot) {
    if (docSnapshot.exists) {
      final listData = docSnapshot.data()?['medications'];
      for (String listItem in listData) {
        if (listItem.contains(medID)) {
          medInfo = listItem as MedicationStruct;
          break;
        }
      }
    }
  });
  return medInfo;
}
