import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'add_med_page_widget.dart' show AddMedPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMedPageModel extends FlutterFlowModel<AddMedPageWidget> {
  ///  Local state fields for this page.

  List<DateTime> medicationTimes = [];
  void addToMedicationTimes(DateTime item) => medicationTimes.add(item);
  void removeFromMedicationTimes(DateTime item) => medicationTimes.remove(item);
  void removeAtIndexFromMedicationTimes(int index) =>
      medicationTimes.removeAt(index);
  void insertAtIndexInMedicationTimes(int index, DateTime item) =>
      medicationTimes.insert(index, item);
  void updateMedicationTimesAtIndex(int index, Function(DateTime) updateFn) =>
      medicationTimes[index] = updateFn(medicationTimes[index]);

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

  int numberOfTimes = 1;

  DateTime? medicationTime;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for MedNameField widget.
  FocusNode? medNameFieldFocusNode;
  TextEditingController? medNameFieldController;
  String? Function(BuildContext, String?)? medNameFieldControllerValidator;
  // State field(s) for DosageAmountField widget.
  FocusNode? dosageAmountFieldFocusNode;
  TextEditingController? dosageAmountFieldController;
  String? Function(BuildContext, String?)? dosageAmountFieldControllerValidator;
  // State field(s) for PillCountField widget.
  FocusNode? pillCountFieldFocusNode;
  TextEditingController? pillCountFieldController;
  String? Function(BuildContext, String?)? pillCountFieldControllerValidator;
  // State field(s) for PillDosageField widget.
  FocusNode? pillDosageFieldFocusNode;
  TextEditingController? pillDosageFieldController;
  String? Function(BuildContext, String?)? pillDosageFieldControllerValidator;
  // State field(s) for WithFoodTile widget.
  bool? withFoodTileValue;
  DateTime? datePicked;
  // Stores action output result for [Custom Action - getConnectedDevices] action in Icon widget.
  List<BTDeviceStruct>? fetchedConnectedDevices;
  // Stores action output result for [Custom Action - findDevices] action in Icon widget.
  List<BTDeviceStruct>? devicesFound;
  // Stores action output result for [Custom Action - connectDevice] action in ListTile widget.
  bool? hasWrite;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    medNameFieldFocusNode?.dispose();
    medNameFieldController?.dispose();

    dosageAmountFieldFocusNode?.dispose();
    dosageAmountFieldController?.dispose();

    pillCountFieldFocusNode?.dispose();
    pillCountFieldController?.dispose();

    pillDosageFieldFocusNode?.dispose();
    pillDosageFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
