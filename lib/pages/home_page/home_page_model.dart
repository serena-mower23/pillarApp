import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_medication_list_widget.dart';
import '/components/med_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool? isFetchingDevices;

  bool isBluetoothEnabled = false;

  List<BTDeviceStruct> foundDevices = [];
  void addToFoundDevices(BTDeviceStruct item) => foundDevices.add(item);
  void removeFromFoundDevices(BTDeviceStruct item) => foundDevices.remove(item);
  void removeAtIndexFromFoundDevices(int index) => foundDevices.removeAt(index);
  void insertAtIndexInFoundDevices(int index, BTDeviceStruct item) =>
      foundDevices.insert(index, item);
  void updateFoundDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      foundDevices[index] = updateFn(foundDevices[index]);

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

  bool isFetchingConnectedDevices = false;

  bool deviceSelected = false;

  List<MedInfoStruct> meds = [];
  void addToMeds(MedInfoStruct item) => meds.add(item);
  void removeFromMeds(MedInfoStruct item) => meds.remove(item);
  void removeAtIndexFromMeds(int index) => meds.removeAt(index);
  void insertAtIndexInMeds(int index, MedInfoStruct item) =>
      meds.insert(index, item);
  void updateMedsAtIndex(int index, Function(MedInfoStruct) updateFn) =>
      meds[index] = updateFn(meds[index]);

  List<MedTimeStruct> todayMedsSchedule = [];
  void addToTodayMedsSchedule(MedTimeStruct item) =>
      todayMedsSchedule.add(item);
  void removeFromTodayMedsSchedule(MedTimeStruct item) =>
      todayMedsSchedule.remove(item);
  void removeAtIndexFromTodayMedsSchedule(int index) =>
      todayMedsSchedule.removeAt(index);
  void insertAtIndexInTodayMedsSchedule(int index, MedTimeStruct item) =>
      todayMedsSchedule.insert(index, item);
  void updateTodayMedsScheduleAtIndex(
          int index, Function(MedTimeStruct) updateFn) =>
      todayMedsSchedule[index] = updateFn(todayMedsSchedule[index]);

  BTDeviceStruct? connectedPedestal;
  void updateConnectedPedestalStruct(Function(BTDeviceStruct) updateFn) =>
      updateFn(connectedPedestal ??= BTDeviceStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for MedItem dynamic component.
  late FlutterFlowDynamicModels<MedItemModel> medItemModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    medItemModels = FlutterFlowDynamicModels(() => MedItemModel());
  }

  void dispose() {
    unfocusNode.dispose();
    medItemModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
