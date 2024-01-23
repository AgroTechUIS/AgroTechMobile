// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

// coverage:ignore-start
Future<void> scheduleNotification({required DateTime date, required int id, required String name}) async {
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  const NotificationDetails androidPlatformChannelSpecifics = NotificationDetails(
    android: AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
    ),
  );

  tz.initializeTimeZones();
  final String timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    'Tienes una $name programada para hoy ${date.day}/${date.month}/${date.year}',
    'Actualiza el estado a penas termines',
    tz.TZDateTime.from(date, tz.local),
    androidPlatformChannelSpecifics,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    payload: 'payload',
  );
}
// coverage:ignore-end

DateTime lastDayMonth() {
  DateTime fechaActual = DateTime.now();

  DateTime primerDiaDelSiguienteMes = DateTime(fechaActual.year, fechaActual.month + 1, 1);

  DateTime ultimoDiaDelMesActual = primerDiaDelSiguienteMes
      .subtract(const Duration(days: 1))
      .add(const Duration(hours: 23, minutes: 59, seconds: 59));

  return ultimoDiaDelMesActual;
}

DateTime firstDayMonth() {
  DateTime fechaActual = DateTime.now();
  return DateTime(fechaActual.year, fechaActual.month, 1, 0, 0, 0, 0, 0);
}

bool sameDateWithOutHour(DateTime d1, DateTime d2) {
  return d1.day == d2.day && d1.month == d2.month && d1.year == d2.year;
}

String formatNumber(double number) {
  final formatter = NumberFormat("#,###");
  return formatter.format(number).replaceAll(',', '.');
}
