// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

int notificationID = 0;

void selectNotification(NotificationResponse response) {
  // Handle notification tap
  if (response.payload != null) {
    final payload = response.payload;
    debugPrint('notification payload: $payload');
  }
  // Navigate to the desired screen
}

Future<void> scheduleNotification(String medName, DateTime time) async {
  tzdata.initializeTimeZones();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('pillar_app');
  var initializationSettingsIOS = DarwinInitializationSettings();
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: selectNotification);

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'weekly_notification',
    'Weekly Notification',
    channelDescription: 'Description of the weekly notification',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  var iOSPlatformChannelSpecifics = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );

  var scheduledTime = tz.TZDateTime.from(time, tz.local);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    notificationID++,
    'Pillar Medication Reminder',
    "It's time to take your $medName medication.",
    scheduledTime,
    platformChannelSpecifics,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    payload: medName,
  );

  await flutterLocalNotificationsPlugin.periodicallyShow(
    notificationID++,
    'Pillar Medication Reminder',
    "It's time to take your $medName medication.",
    RepeatInterval.weekly, // Change this to your desired interval
    platformChannelSpecifics,
  );
}

Future<DateTime> getDayOfWeek(int dayOfWeek, TimeOfDay time) async {
  final today = DateTime.now();
  int offset;
  if (today.weekday == dayOfWeek) {
    offset = 0;
  } else {
    offset = (dayOfWeek - today.weekday + 6) % 7 + 1;
  }
  final neededDay = today.add(Duration(days: offset));
  return DateTime(
      neededDay.year, neededDay.month, neededDay.day, time.hour, time.minute);
}

Future<void> setMedReminders(
    String medName, List<MedTimeStruct> medTimes) async {
  for (int i = 0; i < medTimes.length; i++) {
    if (medTimes[i].sunday) {
      await scheduleForDay(medName, medTimes[i], 7);
    }
    if (medTimes[i].monday) {
      await scheduleForDay(medName, medTimes[i], 1);
    }
    if (medTimes[i].tuesday) {
      await scheduleForDay(medName, medTimes[i], 2);
    }
    if (medTimes[i].wednesday) {
      await scheduleForDay(medName, medTimes[i], 3);
    }
    if (medTimes[i].thursday) {
      await scheduleForDay(medName, medTimes[i], 4);
    }
    if (medTimes[i].friday) {
      await scheduleForDay(medName, medTimes[i], 5);
    }
    if (medTimes[i].saturday) {
      await scheduleForDay(medName, medTimes[i], 6);
    }
  }
}

Future<void> scheduleForDay(
    String medName, MedTimeStruct medTime, int dayOfWeek) async {
  final hour = medTime.time!.hour;
  final min = medTime.time!.minute;
  final TimeOfDay scheduledTime = TimeOfDay(hour: hour, minute: min);

  final dayTime = await getDayOfWeek(dayOfWeek, scheduledTime);
  await scheduleNotification(medName, dayTime);
}
