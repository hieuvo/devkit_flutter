import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_scrollbar/cupertino_scrollbar1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_scrollbar/cupertino_scrollbar2.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_scrollbar/cupertino_scrollbar3.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoScrollbarListPage extends StatefulWidget {
  const CupertinoScrollbarListPage({super.key});

  @override
  State<CupertinoScrollbarListPage> createState() => _CupertinoScrollbarListPageState();
}

class _CupertinoScrollbarListPageState extends State<CupertinoScrollbarListPage> {
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
            const Text('Cupertino Scrollbar', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('An iOS-style scrollbar that indicates which portion of a scrollable widget is currently visible.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.south, size: 50, color: softBlue))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Scrollbar 1 - Standart', page: const CupertinoScrollbar1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Scrollbar 2 - Properties', page: const CupertinoScrollbar2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Scrollbar 3 - Always Shown', page: const CupertinoScrollbar3Page()),
          ],
        )
    );
  }
}
