import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartRowPage extends StatefulWidget {
  const StandartRowPage({super.key});

  @override
  State<StandartRowPage> createState() => _StandartRowPageState();
}

class _StandartRowPageState extends State<StandartRowPage> {
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
                title: 'Standart Row',
                desc: 'This is the example of row without any style'
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Text('Left Side'),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Text('Middle Side'),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Text('Right Side'),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
