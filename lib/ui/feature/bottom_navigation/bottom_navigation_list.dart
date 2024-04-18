import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation1.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation10.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation11.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation12.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation2.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation3.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation4.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation5.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation6.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation7.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation8.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation9.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BottomNavigationListPage extends StatefulWidget {
  const BottomNavigationListPage({super.key});

  @override
  State<BottomNavigationListPage> createState() => _BottomNavigationListPageState();
}

class _BottomNavigationListPageState extends State<BottomNavigationListPage> {
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
            const Text('Bottom Navigation', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('Bottom navigation used to navigate between page using bottom navigation.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.call_to_action, size: 50, color: softBlue))
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List', style: TextStyle(
                  fontSize: 18, color: black21, fontWeight: FontWeight.w500
              )),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 1 - Standart', page: const BottomNavigation1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 2 - Standart with Fab', page: const BottomNavigation2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 3 - React Style', page: const BottomNavigation3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 4 - React Circle Style', page: const BottomNavigation4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 5 - Flip Style', page: const BottomNavigation5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 6 - TextIn Style', page: const BottomNavigation6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 7 - Titled Style', page: const BottomNavigation7Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 8 - Fixed Style', page: const BottomNavigation8Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 9 - Fixed Circle Style', page: const BottomNavigation9Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 10 - Gradient Color', page: const BottomNavigation10Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 11 - Using Images', page: const BottomNavigation11Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Navigation 12 - Using Badges', page: const BottomNavigation12Page()),
          ],
        )
    );
  }
}
