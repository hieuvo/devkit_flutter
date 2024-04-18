import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartCardPage extends StatefulWidget {
  const StandartCardPage({super.key});

  @override
  State<StandartCardPage> createState() => _StandartCardPageState();
}

class _StandartCardPageState extends State<StandartCardPage> {
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
                  title: 'Standart Card',
                  desc: 'This is the example of card without any style'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  child: Container(
                      padding:const EdgeInsets.all(15),
                      child: const Text('This text is inside card')),
                ),
              ),
            ],
          ),
        )
    );
  }
}
