import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_med_times_page_model.dart';
export 'edit_med_times_page_model.dart';

class EditMedTimesPageWidget extends StatefulWidget {
  const EditMedTimesPageWidget({
    Key? key,
    required this.medName,
    required this.medDosage,
    required this.pillCount,
    required this.withFood,
    required this.pillDosage,
    required this.oldMedName,
  }) : super(key: key);

  final String? medName;
  final int? medDosage;
  final int? pillCount;
  final bool? withFood;
  final int? pillDosage;
  final String? oldMedName;

  @override
  _EditMedTimesPageWidgetState createState() => _EditMedTimesPageWidgetState();
}

class _EditMedTimesPageWidgetState extends State<EditMedTimesPageWidget> {
  late EditMedTimesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditMedTimesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.meds = (currentUserDocument?.medications?.toList() ?? [])
            .toList()
            .cast<MedInfoStruct>();
      });
      _model.medInfo = await actions.getMedicationInfo(
        _model.meds.toList(),
        widget.medName!,
      );
      setState(() {
        _model.medicationInfo = _model.medInfo;
      });
      setState(() {
        _model.medTimesList =
            _model.medicationInfo!.whenToTake.toList().cast<MedTimeStruct>();
      });
      setState(() {
        _model.medDays = FFAppConstants.daysOfTheWeek.toList().cast<String>();
      });
      await actions.cancelAllNotifications();
      await actions.resetNotifications(
        (currentUserDocument?.medications?.toList() ?? []).toList(),
        widget.medName,
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
              context.pushNamed('AddMedInfoPage');
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24.0,
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0.00, -1.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
              child: Text(
                'Edit Medication',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Edit Medication Times',
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final _datePickedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          getCurrentTimestamp),
                                      builder: (context, child) {
                                        return wrapInMaterialTimePickerTheme(
                                          context,
                                          child!,
                                          headerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          headerForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          headerTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 32.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                          pickerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          pickerForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          selectedDateTimeBackgroundColor:
                                              Color(0xFF549DA8),
                                          selectedDateTimeForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          actionButtonForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 24.0,
                                        );
                                      },
                                    );
                                    if (_datePickedTime != null) {
                                      safeSetState(() {
                                        _model.datePicked = DateTime(
                                          getCurrentTimestamp.year,
                                          getCurrentTimestamp.month,
                                          getCurrentTimestamp.day,
                                          _datePickedTime.hour,
                                          _datePickedTime.minute,
                                        );
                                      });
                                    }
                                  },
                                  text: 'Choose Time',
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Chosen Time: ${valueOrDefault<String>(
                                    dateTimeFormat('jm', _model.datePicked),
                                    'No Time Chosen',
                                  )}',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Day(s) of the Week:',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(null),
                                    options: [
                                      'Monday',
                                      'Tuesday',
                                      'Wednesday',
                                      'Thursday',
                                      'Friday',
                                      'Saturday',
                                      'Sunday'
                                    ],
                                    onChanged: null,
                                    width: 300.0,
                                    height: 50.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText: 'Please select...',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: true,
                                    onChangedForMultiSelect: (val) async {
                                      setState(
                                          () => _model.dropDownValue = val);
                                      setState(() {
                                        _model.medDays = _model.dropDownValue!
                                            .toList()
                                            .cast<String>();
                                      });
                                      setState(() {
                                        _model.selectEveryday = false;
                                      });
                                      setState(() {
                                        _model.switchValue = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                  'Select Every Day:',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Switch.adaptive(
                                  value: _model.switchValue ??= true,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue = newValue!);
                                    if (newValue!) {
                                      setState(() {
                                        _model.medDays = FFAppConstants
                                            .daysOfTheWeek
                                            .toList()
                                            .cast<String>();
                                      });
                                    } else {
                                      setState(() {
                                        _model.medDays = _model.dropDownValue!
                                            .toList()
                                            .cast<String>();
                                      });
                                    }
                                  },
                                  activeColor: Color(0xFFF5ABCF),
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: _model.datePicked == null
                      ? null
                      : () async {
                          setState(() {
                            _model.addToMedTimesList(MedTimeStruct(
                              monday: _model.medDays
                                  .contains(FFAppConstants.monday),
                              tuesday: _model.medDays
                                  .contains(FFAppConstants.tuesday),
                              wednesday: _model.medDays
                                  .contains(FFAppConstants.wednesday),
                              thursday: _model.medDays
                                  .contains(FFAppConstants.thursday),
                              friday: _model.medDays
                                  .contains(FFAppConstants.friday),
                              saturday: _model.medDays
                                  .contains(FFAppConstants.saturday),
                              sunday: _model.medDays
                                  .contains(FFAppConstants.sunday),
                              time: _model.datePicked,
                              medName: widget.medName,
                              adherence: 0,
                              occurrences: 0,
                              creationDate: getCurrentTimestamp,
                            ));
                          });
                          setState(() {
                            _model.addToMedTimesInfo(_model.datePicked!);
                          });
                        },
                  text: 'Add Time',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFF5ABCF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    disabledColor: Color(0xFFC7C7C7),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Current Med Schedule',
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Builder(
                        builder: (context) {
                          final times = _model.medTimesList.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: times.length,
                            itemBuilder: (context, timesIndex) {
                              final timesItem = times[timesIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          dateTimeFormat('jm', timesItem.time!),
                                          style: FlutterFlowTheme.of(context)
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
                                          timesItem.monday &&
                                                  timesItem.tuesday &&
                                                  timesItem.wednesday &&
                                                  timesItem.thursday &&
                                                  timesItem.friday &&
                                                  timesItem.saturday &&
                                                  timesItem.sunday
                                              ? 'Everyday'
                                              : '${timesItem.sunday ? 'Sun ' : ''}${timesItem.monday ? 'Mon ' : ''}${timesItem.tuesday ? 'Tue ' : ''}${timesItem.wednesday ? 'Wed ' : ''}${timesItem.thursday ? 'Thu ' : ''}${timesItem.friday ? 'Fri ' : ''}${timesItem.saturday ? 'Sat' : ''}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            setState(() {
                                              _model.removeFromMedTimesList(
                                                  timesItem);
                                            });
                                          },
                                          text: 'Delete',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
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
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: _model.medTimesList.length == 0
                          ? null
                          : () async {
                              await actions.setMedReminders(
                                widget.medName!,
                                _model.medTimesList.toList(),
                              );
                              _model.editedMeds = await actions.editMedications(
                                (currentUserDocument?.medications?.toList() ??
                                        [])
                                    .toList(),
                                widget.oldMedName!,
                                widget.medName!,
                                widget.medDosage!.toString(),
                                widget.pillCount!.toString(),
                                widget.pillDosage!.toString(),
                                widget.withFood!,
                                _model.medTimesList.toList(),
                              );

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'medications': getMedInfoListFirestoreData(
                                      _model.editedMeds,
                                    ),
                                  },
                                ),
                              });

                              context.pushNamed(
                                'MedicationPage',
                                queryParameters: {
                                  'medicationName': serializeParam(
                                    widget.medName,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                      text: 'Update Medication',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Make sure there is at least one time before continuing.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).labelMedium,
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
    );
  }
}
