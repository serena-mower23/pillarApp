import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
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
    required this.medID,
  }) : super(key: key);

  final DocumentReference? medID;

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

    return StreamBuilder<MedicationsRecord>(
      stream: MedicationsRecord.getDocument(widget.medID!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF549DA8),
                  ),
                ),
              ),
            ),
          );
        }
        final pedestalSettingsPageMedicationsRecord = snapshot.data!;
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
                        pedestalSettingsPageMedicationsRecord.medicationName,
                        ParamType.String,
                      ),
                      'medID': serializeParam(
                        widget.medID,
                        ParamType.DocumentReference,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, -1.00),
                            child: Text(
                              'Pedestal Set Up',
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: AutoSizeText(
                            'To finish setting up your medication, click one of the buttons below:',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            minFontSize: 11.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'ConnectPage',
                                  queryParameters: {
                                    'medID': serializeParam(
                                      widget.medID,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Connect Pedestal',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFF5ABCF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              unawaited(
                                () async {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Weighing...'),
                                        content: Text(
                                            'Look at your pedestal for instructions!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }(),
                              );
                              await actions.sendData(
                                pedestalSettingsPageMedicationsRecord
                                    .pedestalInfo,
                                'singlePill',
                              );
                              _model.pillValue = await actions.receiveData(
                                pedestalSettingsPageMedicationsRecord
                                    .pedestalInfo,
                              );
                              setState(() {
                                _model.receivedValue = _model.pillValue!;
                              });

                              await widget.medID!
                                  .update(createMedicationsRecordData(
                                pillWeight: _model.pillValue,
                              ));

                              setState(() {});
                            },
                            text: 'Weigh One Pill',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFF5ABCF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, -1.00),
                            child: FFButtonWidget(
                              onPressed: () async {
                                unawaited(
                                  () async {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Weighing...'),
                                          content: Text(
                                              'Look at your pedestal for instructions!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }(),
                                );
                                await actions.sendData(
                                  pedestalSettingsPageMedicationsRecord
                                      .pedestalInfo,
                                  'fullBottle',
                                );
                                _model.bottleValue = await actions.receiveData(
                                  pedestalSettingsPageMedicationsRecord
                                      .pedestalInfo,
                                );
                                setState(() {
                                  _model.receivedValue = _model.bottleValue!;
                                });

                                await widget.medID!
                                    .update(createMedicationsRecordData(
                                  pillBottleWeight: _model.bottleValue,
                                ));

                                setState(() {});
                              },
                              text: 'Weigh Entire Bottle',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFF5ABCF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
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
      },
    );
  }
}
