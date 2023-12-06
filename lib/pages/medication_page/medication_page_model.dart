import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'medication_page_widget.dart' show MedicationPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedicationPageModel extends FlutterFlowModel<MedicationPageWidget> {
  ///  Local state fields for this page.

  bool isFetchingConnectedDevices = false;

  bool isBluetoothEnabled = false;

  List<BTDeviceStruct> connectedDevices = [];
  void addToConnectedDevices(BTDeviceStruct item) => connectedDevices.add(item);
  void removeFromConnectedDevices(BTDeviceStruct item) =>
      connectedDevices.remove(item);
  void removeAtIndexFromConnectedDevices(int index) =>
      connectedDevices.removeAt(index);
  void insertAtIndexInConnectedDevices(int index, BTDeviceStruct item) =>
      connectedDevices.insert(index, item);
  void updateConnectedDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      connectedDevices[index] = updateFn(connectedDevices[index]);

  MedInfoStruct? medicationInfo;
  void updateMedicationInfoStruct(Function(MedInfoStruct) updateFn) =>
      updateFn(medicationInfo ??= MedInfoStruct());

  List<MedInfoStruct> meds = [];
  void addToMeds(MedInfoStruct item) => meds.add(item);
  void removeFromMeds(MedInfoStruct item) => meds.remove(item);
  void removeAtIndexFromMeds(int index) => meds.removeAt(index);
  void insertAtIndexInMeds(int index, MedInfoStruct item) =>
      meds.insert(index, item);
  void updateMedsAtIndex(int index, Function(MedInfoStruct) updateFn) =>
      meds[index] = updateFn(meds[index]);

  List<MedTimeStruct> medTimes = [];
  void addToMedTimes(MedTimeStruct item) => medTimes.add(item);
  void removeFromMedTimes(MedTimeStruct item) => medTimes.remove(item);
  void removeAtIndexFromMedTimes(int index) => medTimes.removeAt(index);
  void insertAtIndexInMedTimes(int index, MedTimeStruct item) =>
      medTimes.insert(index, item);
  void updateMedTimesAtIndex(int index, Function(MedTimeStruct) updateFn) =>
      medTimes[index] = updateFn(medTimes[index]);

  String? adherence;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - updateOccurrences] action in MedicationPage widget.
  List<MedInfoStruct>? occurrencesUpdate;
  // Stores action output result for [Custom Action - getMedicationInfo] action in MedicationPage widget.
  MedInfoStruct? medInfo;
  // Stores action output result for [Custom Action - totalAdherence] action in MedicationPage widget.
  double? totalAdherence;
  // Stores action output result for [Custom Action - connectDevice] action in MedicationPage widget.
  BTDeviceStruct? connectedDevice;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
