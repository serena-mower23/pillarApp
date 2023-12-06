import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'take_med_page_widget.dart' show TakeMedPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TakeMedPageModel extends FlutterFlowModel<TakeMedPageWidget> {
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

  String adherenceStatus = 'Loading...';

  BTDeviceStruct? connectedPedestal;
  void updateConnectedPedestalStruct(Function(BTDeviceStruct) updateFn) =>
      updateFn(connectedPedestal ??= BTDeviceStruct());

  bool updatedStatus = false;

  AdherenceStatusStruct? adherenceStatusItem;
  void updateAdherenceStatusItemStruct(
          Function(AdherenceStatusStruct) updateFn) =>
      updateFn(adherenceStatusItem ??= AdherenceStatusStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getMedicationInfo] action in TakeMedPage widget.
  MedInfoStruct? medInfo;
  InstantTimer? medTakeTimer;
  // Stores action output result for [Custom Action - receiveAdherenceData] action in Button widget.
  AdherenceStatusStruct? receivedAdherence;
  // Stores action output result for [Custom Action - updateMedAdherence] action in Button widget.
  List<MedInfoStruct>? updatedMedications;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    medTakeTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
