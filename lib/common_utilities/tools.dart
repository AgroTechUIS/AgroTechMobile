import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/*String imagesByTable(String table) {
  switch (table) {
    // Rol Super Administrador
    case "usuarios":
      return 'https://i.ibb.co/hZw8WFg/usuarios.jpg';
    case "empresa":
      return 'https://i.ibb.co/m8zGjSL/empresa.jpg';
    // Rol Administrador
    case "clientes":
    default:
      return 'https://i.ibb.co/zRRZCgD/clientes.jpg';
  }
}*/

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
