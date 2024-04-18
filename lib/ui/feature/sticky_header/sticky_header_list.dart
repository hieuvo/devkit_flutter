import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/sticky_header/sticky_header1.dart';
import 'package:devkitflutter/ui/feature/sticky_header/sticky_header2.dart';
import 'package:devkitflutter/ui/feature/sticky_header/sticky_header3.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StickyHeaderListPage extends StatefulWidget {
  const StickyHeaderListPage({super.key});

  @override
  State<StickyHeaderListPage> createState() => _StickyHeaderListPageState();
}

class _StickyHeaderListPageState extends State<StickyHeaderListPage> {
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
            const Text('Sticky Header',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Sticky header used to stick the header on the top.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.sticky_note_2,
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
                title: 'Sticky Header 1 - Headers and Content',
                page: const StickyHeader1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sticky Header 2 - Animated Headers with Content',
                page: const StickyHeader2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sticky Header 3 - Headers overlapping the Content',
                page: const StickyHeader3Page()),
          ],
        ));
  }
}
