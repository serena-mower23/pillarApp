// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> doesMedicationExist(String userID, String medName) async {
  final db = FirebaseFirestore.instance;

  final collection = db.collection('users');
  final document = collection.doc(userID);

  final docSnapshot = await document.get();
  if (docSnapshot.exists) {
    final List<dynamic> listData = docSnapshot.data()?['medications'];
    for (var item in listData) {
      if (item['name'] == medName) {
        // Assuming each item is a Map and has a 'name' key
        return true;
      }
    }
  }

  return false;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
