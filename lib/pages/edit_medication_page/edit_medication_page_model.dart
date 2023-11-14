import '/backend/backend.dart';
import '/components/medication_time_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_medication_page_widget.dart' show EditMedicationPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditMedicationPageModel
    extends FlutterFlowModel<EditMedicationPageWidget> {
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
  // Model for MedicationTimePicker component.
  late MedicationTimePickerModel medicationTimePickerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    medicationTimePickerModel =
        createModel(context, () => MedicationTimePickerModel());
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

    medicationTimePickerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
