import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_pedestal_list_model.dart';
export 'empty_pedestal_list_model.dart';

class EmptyPedestalListWidget extends StatefulWidget {
  const EmptyPedestalListWidget({Key? key}) : super(key: key);

  @override
  _EmptyPedestalListWidgetState createState() =>
      _EmptyPedestalListWidgetState();
}

class _EmptyPedestalListWidgetState extends State<EmptyPedestalListWidget> {
  late EmptyPedestalListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPedestalListModel());
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'Couldn\'t find any available pedestals...',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Text(
                  'Hit the refresh button in the top right corner to refresh the search.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
