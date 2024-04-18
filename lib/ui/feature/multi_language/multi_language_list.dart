import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/multi_language/custom_language.dart';
import 'package:devkitflutter/ui/feature/multi_language/multi_language.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class MultiLanguageListPage extends StatefulWidget {
  const MultiLanguageListPage({super.key});

  @override
  State<MultiLanguageListPage> createState() => _MultiLanguageListPageState();
}

class _MultiLanguageListPageState extends State<MultiLanguageListPage> {
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
            const Text('Multi Language', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('Multi language is used to define more than 1 language in this application.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.language, size: 50, color: softBlue))
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
            _globalWidget.screenDetailList(context: context, title: 'Multi Language Default', page: const MultiLanguagePage()),
            _globalWidget.screenDetailList(context: context, title: 'Custom Language\n(Used if language is not supported by MaterialLocalizations)', page: const CustomLanguagePage()),
          ],
        )
    );
  }
}
