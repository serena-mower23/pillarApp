import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'set_up_pill_page_widget.dart' show SetUpPillPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetUpPillPageModel extends FlutterFlowModel<SetUpPillPageWidget> {
  ///  Local state fields for this page.

  String receivedValue = '';

  String pillWeight = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - connectDevice] action in SetUpPillPage widget.
  BTDeviceStruct? connectedDevice;
  InstantTimer? onePillTimer;
  // Stores action output result for [Custom Action - receiveData] action in Button widget.
  String? pillValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    onePillTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
