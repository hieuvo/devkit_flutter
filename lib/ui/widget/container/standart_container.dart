import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartContainerPage extends StatefulWidget {
  const StandartContainerPage({super.key});

  @override
  State<StandartContainerPage> createState() => _StandartContainerPageState();
}

class _StandartContainerPageState extends State<StandartContainerPage> {
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Standart Container',
                  desc: 'This is the example of container without any style'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Text('this text is inside container'),
              ),
            ],
          ),
        ));
  }
}
