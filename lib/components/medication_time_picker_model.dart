import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'medication_time_picker_widget.dart' show MedicationTimePickerWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedicationTimePickerModel
    extends FlutterFlowModel<MedicationTimePickerWidget> {
  ///  Local state fields for this component.

  List<DateTime> medicationTimes = [];
  void addToMedicationTimes(DateTime item) => medicationTimes.add(item);
  void removeFromMedicationTimes(DateTime item) => medicationTimes.remove(item);
  void removeAtIndexFromMedicationTimes(int index) =>
      medicationTimes.removeAt(index);
  void insertAtIndexInMedicationTimes(int index, DateTime item) =>
      medicationTimes.insert(index, item);
  void updateMedicationTimesAtIndex(int index, Function(DateTime) updateFn) =>
      medicationTimes[index] = updateFn(medicationTimes[index]);

  DateTime? mondayTime;

  DateTime? tuesdayTime;

  DateTime? wednesdayTime;

  DateTime? thursdayTime;

  DateTime? fridayTime;

  DateTime? saturdayTime;

  DateTime? sundayTime;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  FormFieldController<List<String>>? checkboxGroupValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
