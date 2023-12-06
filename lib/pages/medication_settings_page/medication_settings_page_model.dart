import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'medication_settings_page_widget.dart' show MedicationSettingsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedicationSettingsPageModel
    extends FlutterFlowModel<MedicationSettingsPageWidget> {
  ///  Local state fields for this page.

  String receivedValue = '';

  String pillWeight = '';

  String bottleWeight = '';

  MedInfoStruct? medInfo;
  void updateMedInfoStruct(Function(MedInfoStruct) updateFn) =>
      updateFn(medInfo ??= MedInfoStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getMedicationInfo] action in MedicationSettingsPage widget.
  MedInfoStruct? medicationInfo;
  // Stores action output result for [Custom Action - connectDevice] action in MedicationSettingsPage widget.
  BTDeviceStruct? connectedPedestal;
  // Stores action output result for [Custom Action - deleteMedication] action in Button widget.
  List<MedInfoStruct>? updatedMeds;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
