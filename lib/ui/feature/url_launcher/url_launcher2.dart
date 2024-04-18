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

class UrlLauncher2Page extends StatefulWidget {
  const UrlLauncher2Page({super.key});

  @override
  State<UrlLauncher2Page> createState() => _UrlLauncher2PageState();
}

class _UrlLauncher2PageState extends State<UrlLauncher2Page> {
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
                  title: 'URL Launcher 2 - Send Email',
                  desc: 'This is the example of URL Launcher to send email'
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Click to send email',
                    onPressed: (){
                      _sendEmail('cs@email.com');
                    }
                ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Click to send email with subject and body',
                    onPressed: (){
                      _sendEmailWithSubject('cs@email.com', 'Example Subject & Symbols are allowed!', 'This is the example of body');
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendEmail(String email) async {
    Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> _sendEmailWithSubject(String url, String subject, String body) async {
    Uri emailUri = Uri(
        scheme: 'mailto',
        path: url,
        query: encodeQueryParameters(<String, String>{
          'subject': subject,
          'body': body
        }),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}
