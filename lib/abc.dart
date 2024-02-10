// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/*final randomNumberProvider = StreamProvider<int>((ref) {
  final random = Random();
  return Stream.periodic(const Duration(seconds: 30), (index) {
    return random.nextInt(100);
  });
});*/

class NotificationScreen extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationScreen({super.key});

  Future<void> scheduleNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      /*onSelectNotification: (String? payload) async {
        // Manejar la acción al hacer clic en la notificación
      },*/
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

    final DateTime now = DateTime.now();
    final DateTime scheduledDate = DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second + 1);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Tienes una actividad programada para hoy ${scheduledDate.day}/${scheduledDate.month}/${scheduledDate.year}',
      'Cuerpo de la notificación',
      tz.TZDateTime.from(scheduledDate, tz.local),
      androidPlatformChannelSpecifics,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'payload',
      //androidAllowWhileIdle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programación de Notificaciones'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: scheduleNotification,
          child: const Text('Programar Notificación'),
        ),
      ),
    );
  }
}
