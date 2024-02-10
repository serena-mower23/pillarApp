import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'add_med_times_page_widget.dart' show AddMedTimesPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMedTimesPageModel extends FlutterFlowModel<AddMedTimesPageWidget> {
  ///  Local state fields for this page.

  bool isFetchingDevices = false;

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

  BTDeviceStruct? selectedDevice;
  void updateSelectedDeviceStruct(Function(BTDeviceStruct) updateFn) =>
      updateFn(selectedDevice ??= BTDeviceStruct());

  List<MedTimeStruct> medTimesList = [];
  void addToMedTimesList(MedTimeStruct item) => medTimesList.add(item);
  void removeFromMedTimesList(MedTimeStruct item) => medTimesList.remove(item);
  void removeAtIndexFromMedTimesList(int index) => medTimesList.removeAt(index);
  void insertAtIndexInMedTimesList(int index, MedTimeStruct item) =>
      medTimesList.insert(index, item);
  void updateMedTimesListAtIndex(int index, Function(MedTimeStruct) updateFn) =>
      medTimesList[index] = updateFn(medTimesList[index]);

  List<String> medDays = [];
  void addToMedDays(String item) => medDays.add(item);
  void removeFromMedDays(String item) => medDays.remove(item);
  void removeAtIndexFromMedDays(int index) => medDays.removeAt(index);
  void insertAtIndexInMedDays(int index, String item) =>
      medDays.insert(index, item);
  void updateMedDaysAtIndex(int index, Function(String) updateFn) =>
      medDays[index] = updateFn(medDays[index]);

  List<DateTime> medTimesInfo = [];
  void addToMedTimesInfo(DateTime item) => medTimesInfo.add(item);
  void removeFromMedTimesInfo(DateTime item) => medTimesInfo.remove(item);
  void removeAtIndexFromMedTimesInfo(int index) => medTimesInfo.removeAt(index);
  void insertAtIndexInMedTimesInfo(int index, DateTime item) =>
      medTimesInfo.insert(index, item);
  void updateMedTimesInfoAtIndex(int index, Function(DateTime) updateFn) =>
      medTimesInfo[index] = updateFn(medTimesInfo[index]);

  MedInfoStruct? medInfo;
  void updateMedInfoStruct(Function(MedInfoStruct) updateFn) =>
      updateFn(medInfo ??= MedInfoStruct());

  bool selectEveryDay = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Custom Action - emptyTakenDateList] action in Button widget.
  List<TakenDateStruct>? emptyList;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
