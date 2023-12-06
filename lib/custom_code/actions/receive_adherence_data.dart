// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<AdherenceStatusStruct?> receiveAdherenceData(
    BTDeviceStruct deviceInfo) async {
  final device = BluetoothDevice.fromId(deviceInfo.id);
  final services = await device.discoverServices();
  for (BluetoothService service in services) {
    for (BluetoothCharacteristic characteristic in service.characteristics) {
      final isRead = characteristic.properties.read;
      final isNotify = characteristic.properties.notify;
      if (isRead && isNotify) {
        final value = await characteristic.read();
        String stringValue = String.fromCharCodes(value);

        if (stringValue.contains("success")) {
          // Parse the string to get the values after the commas
          List<String> parts = stringValue.split(",");
          if (parts.length > 2) {
            String weightString = parts[1].trim();
            double weight = double.tryParse(weightString) ?? 0.0;

            String pillCountString = parts[2].trim();
            double pillCount = double.tryParse(pillCountString) ?? 0;

            // Create a new AdherenceStatusStruct with the parsed weight and pill count
            AdherenceStatusStruct adherenceStatus = AdherenceStatusStruct(
                status: "success",
                newWeight: weight.toString(),
                newPillCount: pillCount.toString());
            return adherenceStatus;
          }
        } else if (stringValue.contains("failed")) {
          List<String> parts = stringValue.split(",");
          if (parts.length > 2) {
            String weightString = parts[1].trim();
            double weight = double.tryParse(weightString) ?? 0.0;

            String pillCountString = parts[2].trim();
            double pillCount = double.tryParse(pillCountString) ?? 0;

            AdherenceStatusStruct adherenceStatus = AdherenceStatusStruct(
                status: "failed",
                newWeight: weight.toString(),
                newPillCount: pillCount.toString());
            return adherenceStatus;
          }
        } else {
          AdherenceStatusStruct adherenceStatus =
              AdherenceStatusStruct(status: "error", newWeight: "error");
          return adherenceStatus;
        }
      }
    }
  }
}
