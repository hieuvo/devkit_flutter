/*
https://pub.dev/packages/url_launcher
Add code on Android Manifest.xml for Android 11 (API 30)

Add code to info.plist for iOS
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>https</string>
  <string>http</string>
</array>
*/
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher4Page extends StatefulWidget {
  const UrlLauncher4Page({super.key});

  @override
  State<UrlLauncher4Page> createState() => _UrlLauncher4PageState();
}

class _UrlLauncher4PageState extends State<UrlLauncher4Page> {
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
                  title: 'URL Launcher 4 - Send SMS',
                  desc: 'This is the example of URL Launcher to send SMS'
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Click to sms',
                    onPressed: (){
                      _sms('+62811888888');
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sms(String phoneNumber) async {
    Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw 'Could not launch $smsUri';
    }
  }
}
