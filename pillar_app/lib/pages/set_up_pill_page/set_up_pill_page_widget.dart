import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_up_pill_page_model.dart';
export 'set_up_pill_page_model.dart';

class SetUpPillPageWidget extends StatefulWidget {
  const SetUpPillPageWidget({
    Key? key,
    required this.pedestalName,
    required this.pedestalID,
    required this.medName,
  }) : super(key: key);

  final String? pedestalName;
  final String? pedestalID;
  final String? medName;

  @override
  _SetUpPillPageWidgetState createState() => _SetUpPillPageWidgetState();
}

class _SetUpPillPageWidgetState extends State<SetUpPillPageWidget> {
  late SetUpPillPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetUpPillPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.connectedDevice = await actions.connectDevice(
        BTDeviceStruct(
          name: widget.pedestalName,
          id: widget.pedestalID,
        ),
      );
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
                'TarePage',
                queryParameters: {
                  'medName': serializeParam(
                    widget.medName,
                    ParamType.String,
                  ),
                  'pedestalName': serializeParam(
                    widget.pedestalName,
                    ParamType.String,
                  ),
                  'pedestalID': serializeParam(
                    widget.pedestalID,
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
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 48.0, 0.0),
              child: Text(
                'Pillar',
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
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Text(
                          'Weigh One Pill',
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: AutoSizeText(
                        'To finish setting up your medication, click the button below:',
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
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
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }(),
                          );
                          await actions.sendData(
                            BTDeviceStruct(
                              name: widget.pedestalName,
                              id: widget.pedestalID,
                            ),
                            'singlePill',
                          );
                          _model.onePillTimer = InstantTimer.periodic(
                            duration: Duration(milliseconds: 1000),
                            callback: (timer) async {
                              _model.pillValue = await actions.receiveData(
                                BTDeviceStruct(
                                  name: widget.pedestalName,
                                  id: widget.pedestalID,
                                ),
                              );
                              setState(() {
                                _model.pillWeight = _model.pillValue!;
                              });
                              _model.onePillTimer?.cancel();
                            },
                            startImmediately: true,
                          );

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
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Pill Weight: ${_model.pillWeight != null && _model.pillWeight != '' ? _model.pillWeight : 'Weight Not Recorded Yet'}',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: FFButtonWidget(
                        onPressed: (_model.pillWeight == null ||
                                _model.pillWeight == '')
                            ? null
                            : () async {
                                context.pushNamed(
                                  'SetUpBottlePage',
                                  queryParameters: {
                                    'pedestalName': serializeParam(
                                      widget.pedestalName,
                                      ParamType.String,
                                    ),
                                    'pedestalID': serializeParam(
                                      widget.pedestalID,
                                      ParamType.String,
                                    ),
                                    'pillWeight': serializeParam(
                                      _model.pillWeight,
                                      ParamType.String,
                                    ),
                                    'medName': serializeParam(
                                      widget.medName,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                        text: 'Next Step',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFF5ABCF),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
