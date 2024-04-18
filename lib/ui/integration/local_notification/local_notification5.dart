import 'package:devkitflutter/config/static.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class LocalNotification5Page extends StatefulWidget {
  const LocalNotification5Page({super.key});

  @override
  State<LocalNotification5Page> createState() => _LocalNotification5PageState();
}

const MethodChannel platform = MethodChannel('dexterx.dev/flutter_local_notifications_example');

class _LocalNotification5PageState extends State<LocalNotification5Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  String _timezone = 'Unknown';

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void init() async{
    await _configureLocalTimeZone();
  }

  Future showNotification() async{
    String channel = 'default_channel';
    String channelName = 'Default';
    String channeldesc = 'This is default channel';
    String notifTitle = 'notification title';
    String notifMessage = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales.';
    String channelIcon = 'icon';

    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channel, channelName, channelDescription: channeldesc,
        largeIcon: DrawableResourceAndroidBitmap(channelIcon),
        styleInformation: BigTextStyleInformation(notifMessage),
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await StaticVarMethod.flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        notifTitle,
        notifMessage,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'json payload'
    );
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    try {
      _timezone = await FlutterTimezone.getLocalTimezone();
    } catch (e) {
      //debugPrint('Could not get the local timezone');
    }
    if (mounted) {
      tz.setLocalLocation(tz.getLocation(_timezone));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Local Notification 5 (Schedule Notification)',
                  desc: 'Notification will shown 10 second later after pressing the button'
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Show Notification',
                    onPressed: (){
                      showNotification();
                    }
                )
            ),
          ],
        ),
      ),
    );
  }
}
