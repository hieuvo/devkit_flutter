import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/interactive_chip/action_chip.dart';
import 'package:devkitflutter/ui/feature/interactive_chip/choice_chip.dart';
import 'package:devkitflutter/ui/feature/interactive_chip/filter_chip.dart';
import 'package:devkitflutter/ui/feature/interactive_chip/input_chip.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class InteractiveChipListPage extends StatefulWidget {
  const InteractiveChipListPage({super.key});

  @override
  State<InteractiveChipListPage> createState() => _InteractiveChipListPageState();
}

class _InteractiveChipListPageState extends State<InteractiveChipListPage> {
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
            const Text('Interactive Chip List', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('Chip for input, choice, filter and action.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.label, size: 50, color: softBlue))
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
            _globalWidget.screenDetailList(context: context, title: 'Input Chip', page: const InputChipPage()),
            _globalWidget.screenDetailList(context: context, title: 'Choice Chip', page: const ChoiceChipPage()),
            _globalWidget.screenDetailList(context: context, title: 'Filter Chip', page: const FilterChipPage()),
            _globalWidget.screenDetailList(context: context, title: 'Action Chip', page: const ActionChipPage()),
          ],
        )
    );
  }
}
