import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/auto_complete/auto_complete_form.dart';
import 'package:devkitflutter/ui/feature/auto_complete/auto_complete_navigation.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AutoCompleteListPage extends StatefulWidget {
  const AutoCompleteListPage({super.key});

  @override
  State<AutoCompleteListPage> createState() => _AutoCompleteListPageState();
}

class _AutoCompleteListPageState extends State<AutoCompleteListPage> {
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
            const Text('Auto Complete List', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('Auto complete used to search data.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.search_outlined, size: 50, color: softBlue))
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
            _globalWidget.screenDetailList(context: context, title: 'Auto Complete with Navigation', page: const AutoCompleteNavigationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Auto Complete Form', page: const AutoCompleteFormPage())
          ],
        )
    );
  }
}
