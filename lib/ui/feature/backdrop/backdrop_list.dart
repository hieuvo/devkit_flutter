import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/backdrop/backdrop1.dart';
import 'package:devkitflutter/ui/feature/backdrop/backdrop2.dart';
import 'package:devkitflutter/ui/feature/backdrop/backdrop3.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BackdropListPage extends StatefulWidget {
  const BackdropListPage({super.key});

  @override
  State<BackdropListPage> createState() => _BackdropListPageState();
}

class _BackdropListPageState extends State<BackdropListPage> {
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
            const Text('Badges', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('Backdrop.', style: TextStyle(
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
            _globalWidget.screenDetailList(context: context, title: 'Backdrop 1 - Default Backdrop', page: const Backdrop1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Backdrop 2 - Customize Backdrop', page: const Backdrop2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Backdrop 3 - Backdrop With Navigation', page: const Backdrop3Page()),
          ],
        )
    );
  }
}
