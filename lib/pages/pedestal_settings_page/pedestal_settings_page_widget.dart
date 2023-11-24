import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pedestal_settings_page_model.dart';
export 'pedestal_settings_page_model.dart';

class PedestalSettingsPageWidget extends StatefulWidget {
  const PedestalSettingsPageWidget({
    Key? key,
    required this.medName,
  }) : super(key: key);

  final String? medName;

  @override
  _PedestalSettingsPageWidgetState createState() =>
      _PedestalSettingsPageWidgetState();
}

class _PedestalSettingsPageWidgetState
    extends State<PedestalSettingsPageWidget> {
  late PedestalSettingsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PedestalSettingsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.medInfo = await queryMedicationsRecordOnce(
        parent: currentUserReference,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.medInfo?.pedestalInfo != null) {
        _model.connectedPedestal = await actions.connectDevice(
          _model.medInfo!.pedestalInfo,
        );
        await actions.sendData(
          _model.medInfo!.pedestalInfo,
          _model.medInfo!.medicationName,
        );
        await actions.sendData(
          _model.medInfo!.pedestalInfo,
          _model.medInfo!.dosageAmount.toString(),
        );
        _model.pedestalTimer = InstantTimer.periodic(
          duration: Duration(milliseconds: 1000),
          callback: (timer) async {
            _model.randomReceivedData = await actions.receiveData(
              _model.medInfo!.pedestalInfo,
            );
            setState(() {
              _model.receivedValue = _model.randomReceivedData!;
            });
          },
          startImmediately: true,
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF549DA8),
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'MedicationPage',
                queryParameters: {
                  'medicationName': serializeParam(
                    widget.medName,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 24.0,
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0.00, -1.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 48.0, 0.0),
              child: Text(
                'Pedestal Page',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(0.00, -1.00),
                        child: Text(
                          'Pedestal Settings',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
