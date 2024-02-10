import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'edit_med_info_page_widget.dart' show EditMedInfoPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditMedInfoPageModel extends FlutterFlowModel<EditMedInfoPageWidget> {
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

  List<MedInfoStruct> meds = [];
  void addToMeds(MedInfoStruct item) => meds.add(item);
  void removeFromMeds(MedInfoStruct item) => meds.remove(item);
  void removeAtIndexFromMeds(int index) => meds.removeAt(index);
  void insertAtIndexInMeds(int index, MedInfoStruct item) =>
      meds.insert(index, item);
  void updateMedsAtIndex(int index, Function(MedInfoStruct) updateFn) =>
      meds[index] = updateFn(meds[index]);

  MedInfoStruct? medicationInfo;
  void updateMedicationInfoStruct(Function(MedInfoStruct) updateFn) =>
      updateFn(medicationInfo ??= MedInfoStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getMedicationInfo] action in EditMedInfoPage widget.
  MedInfoStruct? medInfo;
  // State field(s) for MedNameField widget.
  FocusNode? medNameFieldFocusNode;
  TextEditingController? medNameFieldController;
  String? Function(BuildContext, String?)? medNameFieldControllerValidator;
  String? _medNameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DosageAmountField widget.
  FocusNode? dosageAmountFieldFocusNode;
  TextEditingController? dosageAmountFieldController;
  String? Function(BuildContext, String?)? dosageAmountFieldControllerValidator;
  String? _dosageAmountFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for PillCountField widget.
  FocusNode? pillCountFieldFocusNode;
  TextEditingController? pillCountFieldController;
  String? Function(BuildContext, String?)? pillCountFieldControllerValidator;
  String? _pillCountFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for PillDosageField widget.
  FocusNode? pillDosageFieldFocusNode;
  TextEditingController? pillDosageFieldController;
  String? Function(BuildContext, String?)? pillDosageFieldControllerValidator;
  String? _pillDosageFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    medNameFieldControllerValidator = _medNameFieldControllerValidator;
    dosageAmountFieldControllerValidator =
        _dosageAmountFieldControllerValidator;
    pillCountFieldControllerValidator = _pillCountFieldControllerValidator;
    pillDosageFieldControllerValidator = _pillDosageFieldControllerValidator;
  }

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
