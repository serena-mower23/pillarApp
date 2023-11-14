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
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'connect_page_model.dart';
export 'connect_page_model.dart';

class ConnectPageWidget extends StatefulWidget {
  const ConnectPageWidget({
    Key? key,
    required this.medID,
  }) : super(key: key);

  final DocumentReference? medID;

  @override
  _ConnectPageWidgetState createState() => _ConnectPageWidgetState();
}

class _ConnectPageWidgetState extends State<ConnectPageWidget> {
  late ConnectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectPageModel());
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
              setState(() {
                _model.isBluetoothEnabled = _model.isBluetoothEnabled;
              });
              setState(() {
                _model.isFetchingDevices = true;
                _model.isFetchingConnectedDevices = true;
              });
              _model.fetchedConnectedDevices =
                  await actions.getConnectedDevices();
              setState(() {
                _model.isFetchingConnectedDevices = false;
                _model.connectedDevices = _model.fetchedConnectedDevices!
                    .toList()
                    .cast<BTDeviceStruct>();
              });
              _model.devicesFound = await actions.findDevices();
              setState(() {
                _model.isFetchingDevices = false;
                _model.foundDevices =
                    _model.devicesFound!.toList().cast<BTDeviceStruct>();
              });

              setState(() {});
            },
            child: Icon(
              Icons.refresh,
              color: Color(0xFFF1F4F8),
              size: 24.0,
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.00, -1.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
              child: Text(
                'Connect Pedestal',
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Text(
                      'Available Pedestals',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 28.0,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final displayAvailableDevices =
                                  _model.devicesFound!.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: displayAvailableDevices.length,
                                itemBuilder:
                                    (context, displayAvailableDevicesIndex) {
                                  final displayAvailableDevicesItem =
                                      displayAvailableDevices[
                                          displayAvailableDevicesIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.hasWrite =
                                          await actions.connectDevice(
                                        displayAvailableDevicesItem,
                                      );
                                      setState(() {
                                        _model.addToConnectedDevices(
                                            displayAvailableDevicesItem);
                                      });

                                      await widget.medID!
                                          .update(createMedicationsRecordData(
                                        pedestalID:
                                            displayAvailableDevicesItem.id,
                                      ));

                                      context.pushNamed(
                                        'PedestalPage',
                                        queryParameters: {
                                          'deviceName': serializeParam(
                                            displayAvailableDevicesItem.name,
                                            ParamType.String,
                                          ),
                                          'deviceId': serializeParam(
                                            displayAvailableDevicesItem.id,
                                            ParamType.String,
                                          ),
                                          'deviceRssi': serializeParam(
                                            displayAvailableDevicesItem.rssi,
                                            ParamType.int,
                                          ),
                                          'medID': serializeParam(
                                            widget.medID,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );

                                      setState(() {});
                                    },
                                    child: ListTile(
                                      title: Text(
                                        displayAvailableDevicesItem.name,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      subtitle: Text(
                                        displayAvailableDevicesItem.id,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      tileColor: Color(0xFFF1F4F8),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'HomePage',
                      queryParameters: {
                        'isFetchingDevices': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                        'isBluetoothEnabled': serializeParam(
                          await getPermissionStatus(bluetoothPermission),
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'Connect Pedestal Later',
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
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Text(
                      'Connected Pedestals',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 28.0,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final displayConnectedDevices =
                                  _model.fetchedConnectedDevices!.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: displayConnectedDevices.length,
                                itemBuilder:
                                    (context, displayConnectedDevicesIndex) {
                                  final displayConnectedDevicesItem =
                                      displayConnectedDevices[
                                          displayConnectedDevicesIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await actions.connectDevice(
                                        displayConnectedDevicesItem,
                                      );
                                      setState(() {
                                        _model.addToConnectedDevices(
                                            displayConnectedDevicesItem);
                                      });

                                      context.pushNamed(
                                        'PedestalPage',
                                        queryParameters: {
                                          'deviceName': serializeParam(
                                            displayConnectedDevicesItem.name,
                                            ParamType.String,
                                          ),
                                          'deviceId': serializeParam(
                                            displayConnectedDevicesItem.id,
                                            ParamType.String,
                                          ),
                                          'deviceRssi': serializeParam(
                                            displayConnectedDevicesItem.rssi,
                                            ParamType.int,
                                          ),
                                          'medID': serializeParam(
                                            widget.medID,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ListTile(
                                      title: Text(
                                        displayConnectedDevicesItem.name,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      subtitle: Text(
                                        displayConnectedDevicesItem.id,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      tileColor: Color(0xFFF1F4F8),
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
            ],
          ),
        ),
      ),
    );
  }
}
