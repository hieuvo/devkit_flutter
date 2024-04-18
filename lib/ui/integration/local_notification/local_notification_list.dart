import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/integration/local_notification/local_notification1.dart';
import 'package:devkitflutter/ui/integration/local_notification/local_notification2.dart';
import 'package:devkitflutter/ui/integration/local_notification/local_notification3.dart';
import 'package:devkitflutter/ui/integration/local_notification/local_notification4.dart';
import 'package:devkitflutter/ui/integration/local_notification/local_notification5.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class LocalNotificationListPage extends StatefulWidget {
  const LocalNotificationListPage({super.key});

  @override
  State<LocalNotificationListPage> createState() =>
      _LocalNotificationListPageState();
}

class _LocalNotificationListPageState extends State<LocalNotificationListPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            const Text('Local Notification List',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Local Notification is used to display a notification.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.notifications_active,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Local Notification 1 (Default)',
                page: const LocalNotification1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Local Notification 2 (Large Icon)',
                page: const LocalNotification2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Local Notification 3 (Big Picture)',
                page: const LocalNotification3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Local Notification 4 (Media Notifications)',
                page: const LocalNotification4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Local Notification 5 (Schedule Notification)',
                page: const LocalNotification5Page()),
          ],
        ));
  }
}
