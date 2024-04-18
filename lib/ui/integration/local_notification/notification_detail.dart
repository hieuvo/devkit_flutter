import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class NotificationDetailPage extends StatefulWidget {
  final String payload;

  const NotificationDetailPage({super.key, this.payload=''});

  @override
  State<NotificationDetailPage> createState() => _NotificationDetailPageState();
}

class _NotificationDetailPageState extends State<NotificationDetailPage> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Notification Detail Page',
                  desc: 'This is notification detail page'
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Payload : ${widget.payload}')
            ),
          ],
        ),
      ),
    );
  }
}
