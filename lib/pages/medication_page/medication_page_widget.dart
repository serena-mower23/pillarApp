import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medication_page_model.dart';
export 'medication_page_model.dart';

class MedicationPageWidget extends StatefulWidget {
  const MedicationPageWidget({
    Key? key,
    required this.medicationName,
  }) : super(key: key);

  final String? medicationName;

  @override
  _MedicationPageWidgetState createState() => _MedicationPageWidgetState();
}

class _MedicationPageWidgetState extends State<MedicationPageWidget> {
  late MedicationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isFetchingConnectedDevices = true;
      });
      setState(() {
        _model.meds = (currentUserDocument?.medications?.toList() ?? [])
            .toList()
            .cast<MedInfoStruct>();
      });
      _model.occurrencesUpdate = await actions.updateOccurrences(
        _model.meds.toList(),
      );

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'medications': getMedInfoListFirestoreData(
              _model.occurrencesUpdate,
            ),
          },
        ),
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
      });
      setState(() {
        _model.medTimes =
            _model.medInfo!.whenToTake.toList().cast<MedTimeStruct>();
      });
      _model.totalAdherence = await actions.totalAdherence(
        _model.medicationInfo!,
      );
      setState(() {
        _model.adherence = _model.totalAdherence == -1.0
            ? 'No Adherence Available'
            : '${_model.totalAdherence?.toString()} %';
      });
      _model.connectedDevice = await actions.connectDevice(
        _model.medicationInfo!.pedestalInfo,
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
              context.pushNamed('HomePage');
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 24.0,
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0.00, -1.00),
            child: Text(
              'Medication',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'EditMedInfoPage',
                    queryParameters: {
                      'medName': serializeParam(
                        widget.medicationName,
                        ParamType.String,
                      ),
                      'dosageAmount': serializeParam(
                        _model.medicationInfo?.dosageAmount,
                        ParamType.String,
                      ),
                      'pillCount': serializeParam(
                        _model.medicationInfo?.pillCount,
                        ParamType.String,
                      ),
                      'pillCountDosage': serializeParam(
                        _model.medicationInfo?.pillCountDosage,
                        ParamType.String,
                      ),
                      'withFood': serializeParam(
                        _model.medicationInfo?.withFood,
                        ParamType.bool,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
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
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Dosage Amount: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  '${_model.medInfo?.dosageAmount} mg',
                                  'medDosage',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Total Pill Count: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                () {
                                  if (_model.medicationInfo?.pillCount ==
                                      '0.0') {
                                    return 'Please Refill Medication';
                                  } else if ((_model
                                              .medicationInfo?.pillCount ==
                                          '1') ||
                                      (_model.medicationInfo?.pillCount ==
                                          '1.0')) {
                                    return '${_model.medInfo?.pillCount} pill';
                                  } else {
                                    return '${_model.medInfo?.pillCount} pills';
                                  }
                                }(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Pill Dosage:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                (_model.medicationInfo?.pillCountDosage ==
                                            '1') ||
                                        (_model.medicationInfo
                                                ?.pillCountDosage ==
                                            '1.0')
                                    ? '${_model.medicationInfo?.pillCountDosage} pill'
                                    : 'pills',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Pill Weight:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                _model.medInfo!.hasPillWeight()
                                    ? '${_model.medInfo?.pillWeight} mg'
                                    : 'No Pill Weight Recorded',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Pill Bottle Weight:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Text(
                              _model.medInfo!.hasPillBottleWeight()
                                  ? '${_model.medInfo?.pillBottleWeight} mg'
                                  : 'No Pill Bottle Weight Recorded',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          _model.medInfo!.withFood
                              ? 'Need to take with food'
                              : 'Don\'t need to take with food',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 8.0),
                            child: Text(
                              'Medication Schedule',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Builder(
                          builder: (context) {
                            final times =
                                _model.medInfo?.whenToTake?.toList() ?? [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: times.length,
                              itemBuilder: (context, timesIndex) {
                                final timesItem = times[timesIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                    'jm', timesItem.time),
                                                'No Time Recorded',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              timesItem.sunday &&
                                                      timesItem.monday &&
                                                      timesItem.tuesday &&
                                                      timesItem.wednesday &&
                                                      timesItem.thursday &&
                                                      timesItem.friday &&
                                                      timesItem.saturday
                                                  ? 'Everyday'
                                                  : '${timesItem.sunday ? 'Sun ' : ''}${timesItem.monday ? 'Mon ' : ''}${timesItem.tuesday ? 'Tue ' : ''}${timesItem.wednesday ? 'Wed ' : ''}${timesItem.thursday ? 'Thu ' : ''}${timesItem.friday ? 'Fri ' : ''}${timesItem.saturday ? 'Sat' : ''}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (false)
                                        FFButtonWidget(
                                          onPressed: timesItem.takenToday ||
                                                  (_model.medInfo?.pillCount ==
                                                      '0.0') ||
                                                  !_model.medicationInfo!
                                                      .pedestalInfo
                                                      .hasId()
                                              ? null
                                              : () async {
                                                  context.pushNamed(
                                                    'TakeMedPage',
                                                    queryParameters: {
                                                      'medicationName':
                                                          serializeParam(
                                                        widget.medicationName,
                                                        ParamType.String,
                                                      ),
                                                      'medicationTime':
                                                          serializeParam(
                                                        timesItem.time,
                                                        ParamType.DateTime,
                                                      ),
                                                      'pedestalID':
                                                          serializeParam(
                                                        _model.medicationInfo
                                                            ?.pedestalInfo?.id,
                                                        ParamType.String,
                                                      ),
                                                      'pedestalName':
                                                          serializeParam(
                                                        _model
                                                            .medicationInfo
                                                            ?.pedestalInfo
                                                            ?.name,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                          text: 'Take Med',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFF5ABCF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            disabledColor: Color(0xFFB2B2B2),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Adherence',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            _model.adherence,
                            'No Adherence Available',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyMedium,
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
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Text(
                            'Pedestal ',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 20.0,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              _model.medInfo!.hasPedestalInfo()
                                  ? 'Pedestal ID: ${_model.medInfo?.pedestalInfo?.id}'
                                  : 'No Registered Pedestal',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_model.medInfo?.hasPedestalInfo() ?? true)
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'MedicationSettingsPage',
                                queryParameters: {
                                  'medName': serializeParam(
                                    widget.medicationName,
                                    ParamType.String,
                                  ),
                                  'pedestalID': serializeParam(
                                    _model.medicationInfo?.pedestalInfo?.id,
                                    ParamType.String,
                                  ),
                                  'pedestalName': serializeParam(
                                    _model.medicationInfo?.pedestalInfo?.name,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Medication Settings',
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!_model.medInfo!.hasPedestalInfo())
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'ConnectPage',
                                queryParameters: {
                                  'isBluetoothEnabled': serializeParam(
                                    await getPermissionStatus(
                                        bluetoothPermission),
                                    ParamType.bool,
                                  ),
                                  'medName': serializeParam(
                                    widget.medicationName,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Register Pedestal',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
