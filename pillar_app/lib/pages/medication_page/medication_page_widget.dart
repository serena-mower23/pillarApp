import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medication_page_model.dart';
export 'medication_page_model.dart';

class MedicationPageWidget extends StatefulWidget {
  const MedicationPageWidget({
    Key? key,
    required this.medicationName,
    required this.isBTEnabled,
    required this.docID,
  }) : super(key: key);

  final String? medicationName;
  final bool? isBTEnabled;
  final String? docID;

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
      await requestPermission(bluetoothPermission);
      _model.medicationInfo = await actions.getMedicationInfo(
        widget.medicationName!,
        widget.docID!,
      );
      _model.bluetoothEnabled = await actions.isBluetoothEnabled();
      setState(() {
        _model.isBluetoothEnabled = widget.isBTEnabled!;
      });
      if (widget.isBTEnabled == true) {
        setState(() {
          _model.isFetchingDevices = true;
          _model.isFetchingConnectedDevices = true;
        });
        await actions.getConnectedDevices();
        setState(() {
          _model.isFetchingConnectedDevices = false;
          _model.connectedDevices =
              _model.fetchedConnectedDevices!.toList().cast<BTDeviceStruct>();
        });
        await actions.findDevices();
        setState(() {
          _model.isFetchingDevices = false;
          _model.foundDevices = _model.devices!.toList().cast<BTDeviceStruct>();
        });
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
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) =>
            usersRecord.where('email', isEqualTo: currentUserEmail),
        singleRecord: true,
      ),
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
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> medicationPageUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final medicationPageUsersRecord =
            medicationPageUsersRecordList.isNotEmpty
                ? medicationPageUsersRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xFF549DA8),
              automaticallyImplyLeading: false,
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
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.medicationName,
                                'medicationName',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                            Text(
                              valueOrDefault<String>(
                                _model.medicationInfo?.dosageAmount,
                                'dosageAmount',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                            Text(
                              valueOrDefault<String>(
                                _model.medicationInfo?.pillCount,
                                'pillCount',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                            Text(
                              valueOrDefault<String>(
                                _model.medicationInfo?.pillDosageCount,
                                'pillDosage',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                            Text(
                              valueOrDefault<String>(
                                _model.medicationInfo?.withFood?.toString(),
                                'withFood',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.isFetchingDevices = true;
                                  _model.isFetchingConnectedDevices = true;
                                });
                                _model.fetchedConnectedDevices =
                                    await actions.getConnectedDevices();
                                setState(() {
                                  _model.isFetchingConnectedDevices = false;
                                  _model.connectedDevices = _model
                                      .fetchedConnectedDevices!
                                      .toList()
                                      .cast<BTDeviceStruct>();
                                });
                                _model.devices = await actions.findDevices();
                                setState(() {
                                  _model.isFetchingDevices = false;
                                  _model.foundDevices = _model.devices!
                                      .toList()
                                      .cast<BTDeviceStruct>();
                                });

                                setState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(0.00, -1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.devicesFound =
                                              await actions.findDevices();

                                          setState(() {});
                                        },
                                        text: 'Find Available Pedestal',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Available Pedestals:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 391.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final displayAvailableDevices =
                                                  _model.devicesFound!.toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    displayAvailableDevices
                                                        .length,
                                                itemBuilder: (context,
                                                    displayAvailableDevicesIndex) {
                                                  final displayAvailableDevicesItem =
                                                      displayAvailableDevices[
                                                          displayAvailableDevicesIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.hasWrite =
                                                          await actions
                                                              .connectDevice(
                                                        displayAvailableDevicesItem,
                                                      );
                                                      setState(() {
                                                        _model.addToConnectedDevices(
                                                            displayAvailableDevicesItem);
                                                      });

                                                      context.pushNamed(
                                                        'PedestalPage',
                                                        queryParameters: {
                                                          'deviceName':
                                                              serializeParam(
                                                            displayAvailableDevicesItem
                                                                .name,
                                                            ParamType.String,
                                                          ),
                                                          'deviceId':
                                                              serializeParam(
                                                            displayAvailableDevicesItem
                                                                .id,
                                                            ParamType.String,
                                                          ),
                                                          'deviceRssi':
                                                              serializeParam(
                                                            displayAvailableDevicesItem
                                                                .rssi,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: ListTile(
                                                      title: Text(
                                                        displayAvailableDevicesItem
                                                            .name,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge,
                                                      ),
                                                      subtitle: Text(
                                                        displayAvailableDevicesItem
                                                            .id,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                      trailing: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                      tileColor:
                                                          Color(0xFFF1F4F8),
                                                      dense: false,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
