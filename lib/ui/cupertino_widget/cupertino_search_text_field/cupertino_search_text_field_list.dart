import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_search_text_field/cupertino_search_text_field1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_search_text_field/cupertino_search_text_field2.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoSearchTextFieldListPage extends StatefulWidget {
  const CupertinoSearchTextFieldListPage({super.key});

  @override
  State<CupertinoSearchTextFieldListPage> createState() =>
      _CupertinoSearchTextFieldListPageState();
}

class _CupertinoSearchTextFieldListPageState
    extends State<CupertinoSearchTextFieldListPage> {
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
            const Text('Cupertino Search Text Field',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('An iOS-style search field.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.search,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Search Text Field 1 - Standart',
                page: const CupertinoSearchTextField1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Search Text Field 2 - Properties',
                page: const CupertinoSearchTextField2Page()),
          ],
        ));
  }
}
