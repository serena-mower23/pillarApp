import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'set_up_bottle_page_widget.dart' show SetUpBottlePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetUpBottlePageModel extends FlutterFlowModel<SetUpBottlePageWidget> {
  ///  Local state fields for this page.

  String receivedValue = '';

  String bottleWeight = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - connectDevice] action in SetUpBottlePage widget.
  bool? connectedDevice;
  InstantTimer? bottleTimer;
  // Stores action output result for [Custom Action - receiveData] action in Button widget.
  String? bottleValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    bottleTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
