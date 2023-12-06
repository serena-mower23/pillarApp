import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'tare_page_widget.dart' show TarePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TarePageModel extends FlutterFlowModel<TarePageWidget> {
  ///  Local state fields for this page.

  bool zeroedOut = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? tareTimer;
  // Stores action output result for [Custom Action - receiveData] action in Button widget.
  String? tareStatus;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tareTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
