import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/text/alignment_text.dart';
import 'package:devkitflutter/ui/widget/text/bold_text.dart';
import 'package:devkitflutter/ui/widget/text/coloring_text.dart';
import 'package:devkitflutter/ui/widget/text/decoration_text.dart';
import 'package:devkitflutter/ui/widget/text/font_family_text.dart';
import 'package:devkitflutter/ui/widget/text/italic_text.dart';
import 'package:devkitflutter/ui/widget/text/letter_spacing_text.dart';
import 'package:devkitflutter/ui/widget/text/maxlines_overflow_text.dart';
import 'package:devkitflutter/ui/widget/text/rich_text.dart';
import 'package:devkitflutter/ui/widget/text/selectable_text.dart';
import 'package:devkitflutter/ui/widget/text/shadow_text.dart';
import 'package:devkitflutter/ui/widget/text/size_text.dart';
import 'package:devkitflutter/ui/widget/text/word_spacing_text.dart';
import 'package:devkitflutter/ui/widget/text/standart_text.dart';
import 'package:flutter/material.dart';

class TextWidgetListPage extends StatefulWidget {
  const TextWidgetListPage({super.key});

  @override
  State<TextWidgetListPage> createState() => _TextWidgetListPageState();
}

class _TextWidgetListPageState extends State<TextWidgetListPage> {
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
            const Text('Text Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Text Widget is one of the main widget in Flutter.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.text_format,
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
                title: 'Standart Text',
                page: const StandartTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Size Text',
                page: const SizeTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Bold Text',
                page: const BoldTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Italic Text',
                page: const ItalicTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Decoration Text',
                page: const DecorationTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Alignment Text',
                page: const AlignmentTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Font Family Text',
                page: const FontFamilyTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Maxlines & Overflow Text',
                page: const MaxlinesOverflowTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Letter Spacing Text',
                page: const LetterSpacingTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Word Spacing Text',
                page: const WordSpacingTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Coloring Text',
                page: const ColoringTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shadow Text',
                page: const ShadowTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Rich Text',
                page: const RichTextPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Selectable Text and Selectable Rich Text',
                page: const SelectableTextPage()),
          ],
        ));
  }
}
