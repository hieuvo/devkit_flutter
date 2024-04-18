import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_context_menu/cupertino_context_menu1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_context_menu/cupertino_context_menu2.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_context_menu/cupertino_context_menu3.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_context_menu/cupertino_context_menu4.dart';
import 'package:flutter/material.dart';

class CupertinoContextMenuListPage extends StatefulWidget {
  const CupertinoContextMenuListPage({super.key});

  @override
  State<CupertinoContextMenuListPage> createState() => _CupertinoContextMenuListPageState();
}

class _CupertinoContextMenuListPageState extends State<CupertinoContextMenuListPage> {
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
            const Text('Cupertino Context Menu', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('An iOS-style full-screen modal route that opens when the child is long-pressed. Used to display relevant actions for your content.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.menu, size: 50, color: softBlue))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Context Menu 1 - Standart', page: const CupertinoContextMenu1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Context Menu 2 - Image', page: const CupertinoContextMenu2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Context Menu 3 - Change Preview when Long Press', page: const CupertinoContextMenu3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Context Menu 4 - Change Preview Size when Long Press', page: const CupertinoContextMenu4Page()),
          ],
        )
    );
  }
}
