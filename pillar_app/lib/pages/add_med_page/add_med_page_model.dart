import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMedPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for MedNameField widget.
  TextEditingController? medNameFieldController;
  String? Function(BuildContext, String?)? medNameFieldControllerValidator;
  // State field(s) for DosageAmountField widget.
  TextEditingController? dosageAmountFieldController;
  String? Function(BuildContext, String?)? dosageAmountFieldControllerValidator;
  // State field(s) for PillCountField widget.
  TextEditingController? pillCountFieldController;
  String? Function(BuildContext, String?)? pillCountFieldControllerValidator;
  // State field(s) for PillDosageField widget.
  TextEditingController? pillDosageFieldController;
  String? Function(BuildContext, String?)? pillDosageFieldControllerValidator;
  // State field(s) for WithFoodTile widget.
  bool? withFoodTileValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    medNameFieldController?.dispose();
    dosageAmountFieldController?.dispose();
    pillCountFieldController?.dispose();
    pillDosageFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
