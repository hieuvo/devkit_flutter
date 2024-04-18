import 'dart:io';

import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/config/static.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_widget_tab.dart';
import 'package:devkitflutter/ui/feature/feature_tab.dart';
import 'package:devkitflutter/ui/integration/integration_tab.dart';
import 'package:devkitflutter/ui/integration/local_notification/notification_detail.dart';
import 'package:devkitflutter/ui/screen/screen_tab.dart';
import 'package:devkitflutter/ui/apps/apps_tab.dart';
import 'package:devkitflutter/ui/widget/widget_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabBar _tabBar;
  int _tabIndex = 0;
  late TabController _tabController;

  String _version = '1.0.0';

  Future<void> _getSystemDevice() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  final List<Tab> _tabBarList = [
    const Tab( text: "Screen List"),
    const Tab( text: "Widget List"),
    const Tab( text: "Cupertino Widget"),
    const Tab( text: "Awesome Features"),
    const Tab( text: "Integrations"),
    const Tab( text: "Apps")
  ];

  final List<Widget> _tabContentList = <Widget>[
    const ScreenTabPage(),
    const WidgetTabPage(),
    const CupertinoWidgetTabPage(),
    const FeatureTabPage(),
    const IntegrationTabPage(),
    const AppsTabPage()
  ];

  // this function is used for exit the application, user must click back button two times
  DateTime? _currentBackPressTime;
  void _onWillPop() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null || now.difference(_currentBackPressTime!) > const Duration(seconds: 2)) {
      _currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press BACK again to back', toastLength: Toast.LENGTH_SHORT);
    } else {
      SystemNavigator.pop();
    }
  }

  void _initLocalNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@drawable/icon');
    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
        onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
          //localNotifData.add(LocalNotificationModel(id: id, title: title, body: body, payload: payload));
          // display a dialog with the notification details, tap ok to go to another page
          showDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title!),
              content: Text(body!),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text('Ok'),
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationDetailPage(payload: payload!)));
                  },
                )
              ],
            ),
          );
        }
    );
    const DarwinInitializationSettings initializationSettingsMacOS = DarwinInitializationSettings();
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: initializationSettingsMacOS
    );
    await StaticVarMethod.flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(context, MaterialPageRoute<void>(builder: (context) => NotificationDetailPage(payload: payload!)));
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await StaticVarMethod.flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      await StaticVarMethod.flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      StaticVarMethod.flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      await androidImplementation?.requestNotificationsPermission();
    }
  }

  @override
  void initState() {
    // set navigation bar color to default color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFFF2F2F2),
          systemNavigationBarIconBrightness: Brightness.light
      ),
    );
    _requestPermissions();

    if(!kIsWeb){
      StaticVarMethod.flutterLocalNotificationsPlugin.cancelAll();
      // used for local notification on integration
      if(!StaticVarMethod.isInitLocalNotif){
        StaticVarMethod.isInitLocalNotif = true;
        _initLocalNotification();
      }
    }
    _getSystemDevice();

    _tabController = TabController(vsync: this, length: _tabBarList.length, initialIndex: _tabIndex);

    _tabBar = TabBar(
      controller: _tabController,
      onTap: (position){
        setState(() {
          _tabIndex = position;
        });
        //debugPrint('idx : '+_tabIndex.toString());
      },
      isScrollable: true,
      labelColor: black21,
      labelStyle: const TextStyle(fontSize: 14),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 4,
      indicatorColor: black21,
      unselectedLabelColor: softGrey,
      labelPadding: const EdgeInsets.symmetric(horizontal: 30.0),
      tabs: _tabBarList,
    );

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: true,
          title: Image.asset('assets/images/logo_horizontal.png', height: 24),
          actions: [
            IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.black),
                onPressed: () {
                  _informationDialog(context);
                }),
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(_tabBar.preferredSize.height+1),
              child: Column(
                children: [
                  Theme(
                    data: ThemeData(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                    child: _tabBar,
                  ),
                  Container(
                    color: Colors.grey[200],
                    height: 1.0,
                  )
                ],
              ))
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          _onWillPop();
        },
        child: DefaultTabController(
          length: _tabBarList.length,
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: _tabContentList.map((Widget content) {
              return content;
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _informationDialog(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Icon(
                        Icons.close,
                        color: black21,
                        size: 20,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/logo_light.png', width: MediaQuery.of(context).size.width/4),
                      Container(
                        transform: Matrix4.translationValues(0.0, -MediaQuery.of(context).size.width/26, 0.0),
                        child: Text('v$_version', style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        )),
                      ),
                      const Text(
                        'DevKit developed and designed for Developer using Flutter. It contains many ready to used Screens, Widgets, Features, Functions, Integrations and Animations for iOS and Android devices.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: black77),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      _launchInBrowser('https://1.envato.market/kj4MrM');
                    },
                    child: const Text(
                        'Our Portfolio',
                        style: TextStyle(
                          fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: softBlue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)
                    ),
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      _launchInBrowser('https://1.envato.market/QVNqa');
                    },
                    child: const Text(
                      'Purchase Source Code',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Future<void> _launchInBrowser(String url) async {
    Uri urlUri = Uri.parse(url);
    if (!await launchUrl(
      urlUri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
