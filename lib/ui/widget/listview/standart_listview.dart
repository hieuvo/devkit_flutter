import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartListviewPage extends StatefulWidget {
  const StandartListviewPage({super.key});

  @override
  State<StandartListviewPage> createState() => _StandartListviewPageState();
}

class _StandartListviewPageState extends State<StandartListviewPage> {
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
        body: ListView( // this is start of example
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            _globalWidget.createDetailWidget(
                title: 'Standart ListView',
                desc: 'This is the example of listview without any style'
            ),
            const Text('data 1'),
            const Text('data 2'),
            const Text('data 3'),
            const Text('data 4'),
            const Text('data 5'),
          ],
        )
    );
  }
}
