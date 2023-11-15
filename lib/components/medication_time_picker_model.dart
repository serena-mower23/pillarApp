import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'medication_time_picker_widget.dart' show MedicationTimePickerWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedicationTimePickerModel
    extends FlutterFlowModel<MedicationTimePickerWidget> {
  ///  Local state fields for this component.

  int? hourField;

  int? minuteField;

  bool? isAM = true;

  List<String> daysOfTheWeek = [];
  void addToDaysOfTheWeek(String item) => daysOfTheWeek.add(item);
  void removeFromDaysOfTheWeek(String item) => daysOfTheWeek.remove(item);
  void removeAtIndexFromDaysOfTheWeek(int index) =>
      daysOfTheWeek.removeAt(index);
  void insertAtIndexInDaysOfTheWeek(int index, String item) =>
      daysOfTheWeek.insert(index, item);
  void updateDaysOfTheWeekAtIndex(int index, Function(String) updateFn) =>
      daysOfTheWeek[index] = updateFn(daysOfTheWeek[index]);

  MedTimeStruct? newTime;
  void updateNewTimeStruct(Function(MedTimeStruct) updateFn) =>
      updateFn(newTime ??= MedTimeStruct());

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Switch widget.
  bool? switchValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
