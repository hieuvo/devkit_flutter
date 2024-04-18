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

class UrlLauncher3Page extends StatefulWidget {
  const UrlLauncher3Page({super.key});

  @override
  State<UrlLauncher3Page> createState() => _UrlLauncher3PageState();
}

class _UrlLauncher3PageState extends State<UrlLauncher3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  bool _hasCallSupport = false;

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '+62811888888')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
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
                  title: 'URL Launcher 3 - Call Phone Number',
                  desc: 'This is the example of URL Launcher to call phone number'
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: _hasCallSupport ? 'Click to call phone number' : 'Calling not supported',
                    onPressed: (){
                      if(_hasCallSupport){
                        _makePhoneCall('+62811888888');
                      }
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }
}
