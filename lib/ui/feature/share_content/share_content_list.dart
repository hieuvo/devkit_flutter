import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/share_content/share_content1.dart';
import 'package:devkitflutter/ui/feature/share_content/share_content2.dart';
import 'package:devkitflutter/ui/feature/share_content/share_content3.dart';
import 'package:devkitflutter/ui/feature/share_content/share_content4.dart';
import 'package:devkitflutter/ui/feature/share_content/share_content5.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ShareContentListPage extends StatefulWidget {
  const ShareContentListPage({super.key});

  @override
  State<ShareContentListPage> createState() => _ShareContentListPageState();
}

class _ShareContentListPageState extends State<ShareContentListPage> {
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
            const Text('Share Content',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Share Content used to share your content.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.share,
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
                title: 'Share Content 1 (Text)',
                page: const ShareContent1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Share Content 2 (Text with Subject)',
                page: const ShareContent2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Share Content 3 (Image Only)',
                page: const ShareContent3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Share Content 4 (Image with Text)',
                page: const ShareContent4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Share Content 5 (Image with Text & Subject)',
                page: const ShareContent5Page()),
          ],
        ));
  }
}
