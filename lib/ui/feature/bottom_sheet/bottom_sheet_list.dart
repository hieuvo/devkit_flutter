import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/bottom_sheet/bottom_sheet1.dart';
import 'package:devkitflutter/ui/feature/bottom_sheet/bottom_sheet2.dart';
import 'package:devkitflutter/ui/feature/bottom_sheet/bottom_sheet3.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BottomSheetListPage extends StatefulWidget {
  const BottomSheetListPage({super.key});

  @override
  State<BottomSheetListPage> createState() => _BottomSheetListPageState();
}

class _BottomSheetListPageState extends State<BottomSheetListPage> {
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
            const Text('Bottom Sheet Featured', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('Bottom sheet for filtering, menu, choose, etc in application.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.open_in_browser, size: 50, color: softBlue))
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
            _globalWidget.screenDetailList(context: context, title: 'Bottom Sheet for Category', page: const BottomSheet1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Sheet for Filter', page: const BottomSheet2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Sheet for Choose', page: const BottomSheet3Page()),
          ],
        )
    );
  }
}
