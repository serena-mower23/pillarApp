import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'pedestal_settings_page_widget.dart' show PedestalSettingsPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PedestalSettingsPageModel
    extends FlutterFlowModel<PedestalSettingsPageWidget> {
  ///  Local state fields for this page.

  String receivedValue = '';

  String pillWeight = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in PedestalSettingsPage widget.
  MedicationsRecord? medInfo;
  // Stores action output result for [Custom Action - connectDevice] action in PedestalSettingsPage widget.
  bool? connectedPedestal;
  // Stores action output result for [Custom Action - receiveData] action in Button widget.
  String? pillValue;
  // Stores action output result for [Custom Action - receiveData] action in Button widget.
  String? bottleValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
