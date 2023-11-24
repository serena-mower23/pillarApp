import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFF549DA8),
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': (data) async => ParameterData(
        allParams: {
          'isFetchingDevices': getParameter<bool>(data, 'isFetchingDevices'),
          'isBluetoothEnabled': getParameter<bool>(data, 'isBluetoothEnabled'),
        },
      ),
  'LoginPage': ParameterData.none(),
  'NewAccountPage': ParameterData.none(),
  'MedicationPage': (data) async => ParameterData(
        allParams: {
          'medicationName': getParameter<String>(data, 'medicationName'),
        },
      ),
  'AddMedInfoPage': ParameterData.none(),
  'SettingsPage': ParameterData.none(),
  'PedestalSettingsPage': (data) async => ParameterData(
        allParams: {
          'medName': getParameter<String>(data, 'medName'),
        },
      ),
  'AddMedTimesPage': (data) async => ParameterData(
        allParams: {
          'medName': getParameter<String>(data, 'medName'),
          'medDosage': getParameter<int>(data, 'medDosage'),
          'pillCount': getParameter<int>(data, 'pillCount'),
          'withFood': getParameter<bool>(data, 'withFood'),
          'pillDosage': getParameter<int>(data, 'pillDosage'),
        },
      ),
  'ConnectPage': (data) async => ParameterData(
        allParams: {
          'isBluetoothEnabled': getParameter<bool>(data, 'isBluetoothEnabled'),
          'medName': getParameter<String>(data, 'medName'),
        },
      ),
  'SetUpPillPage': (data) async => ParameterData(
        allParams: {
          'pedestalName': getParameter<String>(data, 'pedestalName'),
          'pedestalID': getParameter<String>(data, 'pedestalID'),
          'medName': getParameter<String>(data, 'medName'),
        },
      ),
  'SetUpBottlePage': (data) async => ParameterData(
        allParams: {
          'pedestalName': getParameter<String>(data, 'pedestalName'),
          'pedestalID': getParameter<String>(data, 'pedestalID'),
          'pillWeight': getParameter<String>(data, 'pillWeight'),
          'medName': getParameter<String>(data, 'medName'),
        },
      ),
  'EditMedInfoPage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
