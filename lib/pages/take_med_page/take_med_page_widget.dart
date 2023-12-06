import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'take_med_page_model.dart';
export 'take_med_page_model.dart';

class TakeMedPageWidget extends StatefulWidget {
  const TakeMedPageWidget({
    Key? key,
    required this.medicationName,
    required this.medicationTime,
    required this.pedestalID,
    required this.pedestalName,
  }) : super(key: key);

  final String? medicationName;
  final DateTime? medicationTime;
  final String? pedestalID;
  final String? pedestalName;

  @override
  _TakeMedPageWidgetState createState() => _TakeMedPageWidgetState();
}

class _TakeMedPageWidgetState extends State<TakeMedPageWidget> {
  late TakeMedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TakeMedPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.adherenceStatus = 'Loading...';
      });
      setState(() {
        _model.meds = (currentUserDocument?.medications?.toList() ?? [])
            .toList()
            .cast<MedInfoStruct>();
      });
      _model.medInfo = await actions.getMedicationInfo(
        _model.meds.toList(),
        widget.medicationName!,
      );
      setState(() {
        _model.medicationInfo = _model.medInfo;
        _model.connectedPedestal = _model.medicationInfo?.pedestalInfo;
      });
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
              context.pushNamed('HomePageCopy');
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
                'Medication',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.medicationName,
                                  'medName',
                                ),
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                            ],
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
                        Text(
                          'Medication Adherence Status: ${valueOrDefault<String>(
                            _model.adherenceStatus,
                            'Loading...',
                          )}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: _model.updatedStatus
                              ? null
                              : () async {
                                  await actions.sendData(
                                    _model.connectedPedestal!,
                                    'takingPill, ${_model.medInfo?.pillWeight}, ${_model.medInfo?.pillBottleWeight}, ${_model.medInfo?.pillCountDosage}, ${_model.medInfo?.pillCount}',
                                  );
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Reminder'),
                                        content: Text(
                                            'Please take your pill bottle off of the pedestal as you take your medication.'),
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
                                  _model.medTakeTimer = InstantTimer.periodic(
                                    duration: Duration(milliseconds: 1000),
                                    callback: (timer) async {
                                      _model.receivedAdherence =
                                          await actions.receiveAdherenceData(
                                        _model.connectedPedestal!,
                                      );
                                      setState(() {
                                        _model.adherenceStatusItem =
                                            _model.receivedAdherence;
                                      });
                                      if (_model.adherenceStatusItem?.status ==
                                          'failed') {
                                        _model.medTakeTimer?.cancel();
                                        setState(() {
                                          _model.adherenceStatus = 'Failed';
                                        });
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Medication Adherence Failed'),
                                                      content: Text(
                                                          'It looks like you didn\'t take your medication! If you believe this to be an issue, please press confirm.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              Text('Confirm'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          setState(() {
                                            _model.updatedStatus = true;
                                          });
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Error Processing Adherence'),
                                                content: Text(
                                                    'There was an issue processing your adherence. Please return to the medication page and try again.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      } else if (_model
                                              .adherenceStatusItem?.status ==
                                          'success') {
                                        _model.medTakeTimer?.cancel();
                                        setState(() {
                                          _model.adherenceStatus = 'Success';
                                        });
                                        setState(() {
                                          _model.updatedStatus = true;
                                        });
                                      }
                                    },
                                    startImmediately: true,
                                  );

                                  setState(() {});
                                },
                          text: 'Take Medication',
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
                            disabledColor: Color(0xFFB2B2B2),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: !_model.updatedStatus
                              ? null
                              : () async {
                                  _model.updatedMedications =
                                      await actions.updateMedAdherence(
                                    (currentUserDocument?.medications
                                                ?.toList() ??
                                            [])
                                        .toList(),
                                    widget.medicationName!,
                                    widget.medicationTime!,
                                    _model.adherenceStatusItem!.newWeight,
                                    _model.adherenceStatusItem!.newPillCount,
                                  );

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'medications':
                                            getMedInfoListFirestoreData(
                                          _model.updatedMedications,
                                        ),
                                      },
                                    ),
                                  });

                                  context.pushNamed(
                                    'MedicationPage',
                                    queryParameters: {
                                      'medicationName': serializeParam(
                                        widget.medicationName,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  setState(() {
                                    _model.updatedStatus = false;
                                  });
                                  setState(() {
                                    _model.adherenceStatusItem = null;
                                    _model.adherenceStatus = 'Loading...';
                                  });

                                  setState(() {});
                                },
                          text: 'Finish ',
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
                            disabledColor: Color(0xFFB2B2B2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
