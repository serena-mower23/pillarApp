import '/backend/schema/structs/index.dart';
import '/components/received_data_display_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PedestalPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String deviceName = '';

  String deviceId = '';

  int? deviceRssi;

  int? currentRssi;

  String receivedValue = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for DisplayReceivedData.
  late ReceivedDataDisplayModel displayReceivedDataModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    displayReceivedDataModel =
        createModel(context, () => ReceivedDataDisplayModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
    displayReceivedDataModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
