import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartColumnPage extends StatefulWidget {
  const StandartColumnPage({super.key});

  @override
  State<StandartColumnPage> createState() => _StandartColumnPageState();
}

class _StandartColumnPageState extends State<StandartColumnPage> {
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
            _globalWidget.createDetailWidget(
                title: 'Standart Column',
                desc: 'This is the example of column without any style'
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Column(
                children: [
                  Text('Top Side'),
                  Text('Middle Side'),
                  Text('Bottom Side'),
                ],
              ),
            ),
          ],
        )
    );
  }
}
