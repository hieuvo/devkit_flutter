import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_switch/cupertino_switch1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_switch/cupertino_switch2.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_switch/cupertino_switch3.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoSwitchListPage extends StatefulWidget {
  const CupertinoSwitchListPage({super.key});

  @override
  State<CupertinoSwitchListPage> createState() => _CupertinoSwitchListPageState();
}

class _CupertinoSwitchListPageState extends State<CupertinoSwitchListPage> {
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
            const Text('Cupertino Switch', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('An iOS-style switch. Used to toggle the on/off state of a single setting.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.toggle_off, size: 50, color: softBlue))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Switch 1 - Standart', page: const CupertinoSwitch1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Switch 2 - with ListTile', page: const CupertinoSwitch2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Switch 3 - Properties', page: const CupertinoSwitch3Page()),
          ],
        )
    );
  }
}
