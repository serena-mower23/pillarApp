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

Future<List<BTDeviceStruct>> findDevices() async {
  List<BTDeviceStruct> devices = [];
  FlutterBluePlus.scanResults.listen((results) {
    List<ScanResult> scannedDevices = [];
    for (ScanResult r in results) {
      if (r.device.localName.isNotEmpty) {
        scannedDevices.add(r);
      }
    }
    scannedDevices.sort((a, b) => b.rssi.compareTo(a.rssi));
    devices.clear();
    scannedDevices.forEach((deviceResult) {
      devices.add(BTDeviceStruct(
        name: deviceResult.device.localName,
        id: deviceResult.device.remoteId.toString(),
      ));
    });
  });
  final isScanning = FlutterBluePlus.isScanningNow;
  if (!isScanning) {
    await FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 5),
    );
  }

  return devices;
}
