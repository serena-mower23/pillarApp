import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'med_item_model.dart';
export 'med_item_model.dart';

class MedItemWidget extends StatefulWidget {
  const MedItemWidget({
    Key? key,
    required this.medInfo,
  }) : super(key: key);

  final MedInfoStruct? medInfo;

  @override
  _MedItemWidgetState createState() => _MedItemWidgetState();
}

class _MedItemWidgetState extends State<MedItemWidget> {
  late MedItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.medInfo = widget.medInfo;
      });
      _model.todaysSchedule = await actions.getMedTimeStructsWithDaySetToTrue(
        _model.medInfo!.whenToTake.toList(),
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: Icon(
                  Icons.medication_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    _model.medInfo?.medicationName,
                    'med_name',
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'MedicationPage',
                      queryParameters: {
                        'medicationName': serializeParam(
                          _model.medInfo?.medicationName,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'View Med',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Today\'s Schedule',
                style: FlutterFlowTheme.of(context).bodyLarge,
              ),
            ],
          ),
        ),
        Builder(
          builder: (context) {
            final medSchedule = _model.todaysSchedule!.toList();
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: medSchedule.length,
              itemBuilder: (context, medScheduleIndex) {
                final medScheduleItem = medSchedule[medScheduleIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              dateTimeFormat('jm', medScheduleItem.time!),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              medScheduleItem.sunday &&
                                      medScheduleItem.monday &&
                                      medScheduleItem.tuesday &&
                                      medScheduleItem.wednesday &&
                                      medScheduleItem.thursday &&
                                      medScheduleItem.friday &&
                                      medScheduleItem.saturday
                                  ? 'Everyday'
                                  : '${medScheduleItem.sunday ? 'Sun ' : ''}${medScheduleItem.monday ? 'Mon ' : ''}${medScheduleItem.tuesday ? 'Tue ' : ''}${medScheduleItem.wednesday ? 'Wed ' : ''}${medScheduleItem.thursday ? 'Thu ' : ''}${medScheduleItem.friday ? 'Fri ' : ''}${medScheduleItem.saturday ? 'Sat' : ''}',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: (_model.medInfo?.pillCount == '0.0')
                                  ? null
                                  : () async {
                                      context.pushNamed(
                                        'TakeMedPage',
                                        queryParameters: {
                                          'medicationName': serializeParam(
                                            medScheduleItem.medName,
                                            ParamType.String,
                                          ),
                                          'medicationTime': serializeParam(
                                            medScheduleItem.time,
                                            ParamType.DateTime,
                                          ),
                                          'pedestalID': serializeParam(
                                            _model.medInfo?.pedestalInfo?.id,
                                            ParamType.String,
                                          ),
                                          'pedestalName': serializeParam(
                                            _model.medInfo?.pedestalInfo?.name,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Take Med',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
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
                );
              },
            );
          },
        ),
      ],
    );
  }
}
