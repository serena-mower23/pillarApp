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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - resetTakenToday] action in HomePage widget.
  List<MedInfoStruct>? meds;
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
