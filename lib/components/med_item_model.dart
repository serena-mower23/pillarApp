import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'med_item_widget.dart' show MedItemWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedItemModel extends FlutterFlowModel<MedItemWidget> {
  ///  Local state fields for this component.

  MedInfoStruct? medInfo;
  void updateMedInfoStruct(Function(MedInfoStruct) updateFn) =>
      updateFn(medInfo ??= MedInfoStruct());

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getMedTimeStructsWithDaySetToTrue] action in MedItem widget.
  List<MedTimeStruct>? todaysSchedule;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
