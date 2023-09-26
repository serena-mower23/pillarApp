import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_devices_model.dart';
export 'empty_devices_model.dart';

class EmptyDevicesWidget extends StatefulWidget {
  const EmptyDevicesWidget({Key? key}) : super(key: key);

  @override
  _EmptyDevicesWidgetState createState() => _EmptyDevicesWidgetState();
}

class _EmptyDevicesWidgetState extends State<EmptyDevicesWidget> {
  late EmptyDevicesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyDevicesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173.0,
      height: 171.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.00, 0.00),
        child: Text(
          'text',
          style: FlutterFlowTheme.of(context).labelMedium,
        ),
      ),
    );
  }
}
