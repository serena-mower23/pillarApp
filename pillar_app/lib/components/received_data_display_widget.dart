import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'received_data_display_model.dart';
export 'received_data_display_model.dart';

class ReceivedDataDisplayWidget extends StatefulWidget {
  const ReceivedDataDisplayWidget({
    Key? key,
    required this.device,
  }) : super(key: key);

  final BTDeviceStruct? device;

  @override
  _ReceivedDataDisplayWidgetState createState() =>
      _ReceivedDataDisplayWidgetState();
}

class _ReceivedDataDisplayWidgetState extends State<ReceivedDataDisplayWidget> {
  late ReceivedDataDisplayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceivedDataDisplayModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.receiveDataTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.receivedData = await actions.receiveData(
            widget.device!,
          );
          setState(() {
            _model.dataString = _model.receivedData;
          });
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Received Data',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
        Text(
          valueOrDefault<String>(
            _model.receivedData,
            'data',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
      ],
    );
  }
}
