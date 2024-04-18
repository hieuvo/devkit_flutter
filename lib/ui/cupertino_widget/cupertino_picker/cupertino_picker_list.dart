import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_picker/cupertino_picker1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_picker/cupertino_picker2.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_picker/cupertino_picker3.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_picker/cupertino_picker4.dart';
import 'package:flutter/material.dart';

class CupertinoPickerListPage extends StatefulWidget {
  const CupertinoPickerListPage({super.key});

  @override
  State<CupertinoPickerListPage> createState() =>
      _CupertinoPickerListPageState();
}

class _CupertinoPickerListPageState extends State<CupertinoPickerListPage> {
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
            const Text('Cupertino Picker',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'An iOS-style picker control. Used to select an item in a short list.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.filter_list_outlined,
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
                title: 'Cupertino Picker 1 - Standart',
                page: const CupertinoPicker1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Picker 2 - Styling Selected Value',
                page: const CupertinoPicker2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Picker 3 - Infinite Loop',
                page: const CupertinoPicker3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Picker 4 - with Dialog',
                page: const CupertinoPicker4Page()),
          ],
        ));
  }
}
