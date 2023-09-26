import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReceivedDataDisplayModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? data;

  ///  State fields for stateful widgets in this component.

  InstantTimer? receiveDataTimer;
  // Stores action output result for [Custom Action - receiveData] action in ReceivedDataDisplay widget.
  String? receivedData;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    receiveDataTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
