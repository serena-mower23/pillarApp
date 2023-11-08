// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future sendMedicationTimes(
  BTDeviceStruct deviceInfo,
  List<DateTime>? data,
) async {
  String dataString =
      "Monday: ${data?[0]}, Tuesday: ${data?[1]}, Wednesday: ${data?[2]}, Thursday: ${data?[3]}, Friday: ${data?[4]}, Saturday: ${data?[5]}, Sunday: ${data?[6]}";
  final device = BluetoothDevice.fromId(deviceInfo.id);
  final services = await device.discoverServices();
  for (BluetoothService service in services) {
    for (BluetoothCharacteristic characteristic in service.characteristics) {
      final isWrite = characteristic.properties.write;
      if (isWrite) {
        await characteristic.write(dataString.codeUnits);
      }
    }
  }
}
