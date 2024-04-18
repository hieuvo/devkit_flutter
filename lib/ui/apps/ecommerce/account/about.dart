import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  String _version = '1.0.0';

  Future<void> _getSystemDevice() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  @override
  void initState() {
    _getSystemDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: const Text(
            'About',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Image.asset('assets/images/apps/ecommerce/logo.png', height: 32)),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'App Version',
              style: TextStyle(
                  fontSize: 14,
                  color: charcoal
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              _version,
              style: const TextStyle(
                  fontSize: 14,
                  color: charcoal
              ),
            ),
          ],
        )
    );
  }
}
