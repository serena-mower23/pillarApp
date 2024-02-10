import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_pedestal_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'connect_page_model.dart';
export 'connect_page_model.dart';

class ConnectPageWidget extends StatefulWidget {
  const ConnectPageWidget({
    Key? key,
    required this.isBluetoothEnabled,
    required this.medName,
  }) : super(key: key);

  final bool? isBluetoothEnabled;
  final String? medName;

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
              color: Colors.white,
              size: 24.0,
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
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
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: InkWell(
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
                  _model.fetchedConnecetedDevices =
                      await actions.getConnectedDevices();
                  setState(() {
                    _model.isFetchingConnectedDevices = false;
                    _model.connectedDevices = _model.fetchedConnecetedDevices!
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
                  Icons.refresh_sharp,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Connect to Pedestal',
                              style: FlutterFlowTheme.of(context).titleLarge,
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
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final availablePedestals =
                                          _model.foundDevices.toList();
                                      if (availablePedestals.isEmpty) {
                                        return Center(
                                          child: EmptyPedestalListWidget(),
                                        );
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: availablePedestals.length,
                                        itemBuilder:
                                            (context, availablePedestalsIndex) {
                                          final availablePedestalsItem =
                                              availablePedestals[
                                                  availablePedestalsIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Device Name:  ${availablePedestalsItem.name}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge,
                                                ),
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.hasWrite =
                                                            await actions
                                                                .connectDevice(
                                                          availablePedestalsItem,
                                                        );

                                                        context.pushNamed(
                                                          'TarePage',
                                                          queryParameters: {
                                                            'medName':
                                                                serializeParam(
                                                              widget.medName,
                                                              ParamType.String,
                                                            ),
                                                            'pedestalName':
                                                                serializeParam(
                                                              availablePedestalsItem
                                                                  .name,
                                                              ParamType.String,
                                                            ),
                                                            'pedestalID':
                                                                serializeParam(
                                                              availablePedestalsItem
                                                                  .id,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        setState(() {});
                                                      },
                                                      text: 'Connect',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFF5ABCF),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
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
                          ),
                        ],
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
