import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/received_data_display_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'pedestal_page_widget.dart' show PedestalPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PedestalPageModel extends FlutterFlowModel<PedestalPageWidget> {
  ///  Local state fields for this page.

  String deviceName = '';

  String deviceId = '';

  int? deviceRssi;

  int? currentRssi;

  String receivedValue = '';

  bool complete = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in PedestalPage widget.
  MedicationsRecord? medInfo;
  InstantTimer? receiveDataTimer;
  // Stores action output result for [Custom Action - receiveData] action in PedestalPage widget.
  String? receivedData;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for ReceivedDataDisplay component.
  late ReceivedDataDisplayModel receivedDataDisplayModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    receivedDataDisplayModel =
        createModel(context, () => ReceivedDataDisplayModel());
  }

  void dispose() {
    unfocusNode.dispose();
    receiveDataTimer?.cancel();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    receivedDataDisplayModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
