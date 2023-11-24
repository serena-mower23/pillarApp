import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_med_info_page_widget.dart' show AddMedInfoPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMedInfoPageModel extends FlutterFlowModel<AddMedInfoPageWidget> {
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

  List<MedTimeStruct> medTimes = [];
  void addToMedTimes(MedTimeStruct item) => medTimes.add(item);
  void removeFromMedTimes(MedTimeStruct item) => medTimes.remove(item);
  void removeAtIndexFromMedTimes(int index) => medTimes.removeAt(index);
  void insertAtIndexInMedTimes(int index, MedTimeStruct item) =>
      medTimes.insert(index, item);
  void updateMedTimesAtIndex(int index, Function(MedTimeStruct) updateFn) =>
      medTimes[index] = updateFn(medTimes[index]);

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
  // State field(s) for Switch widget.
  bool? switchValue;

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
