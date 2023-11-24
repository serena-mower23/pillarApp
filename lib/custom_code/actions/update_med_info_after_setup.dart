// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<MedInfoStruct?> updateMedInfoAfterSetup(
    String userID,
    String medName,
    BTDeviceStruct pedestalInfo,
    String pillWeight,
    String pillBottleWeight) async {
  final db = FirebaseFirestore.instance;

  final collection = db.collection('users');
  final document = collection.doc(userID);

  MedInfoStruct? medInfo = null;
  List<MedInfoStruct>? medList = null;

  document.get().then((docSnapshot) {
    if (docSnapshot.exists) {
      final listData = docSnapshot.data()?['medications'];
      for (int i = 0; i < listData.length; i++) {
        if (listData[i].contains(medName)) {
          medInfo = listData[i];
          document.update({
            "medications": FieldValue.arrayRemove([i])
          });
        } else {
          medList?.add(listData[i]);
        }
      }
    }
  });

  medInfo?.pedestalInfo = pedestalInfo;
  medInfo?.pillWeight = pillWeight;
  medInfo?.pillBottleWeight = pillBottleWeight;

  medList?.add(medInfo!);

  document.update({"medications": medList});

  return medInfo;
}
