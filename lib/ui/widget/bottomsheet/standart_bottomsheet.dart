import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartBottomsheetPage extends StatefulWidget {
  const StandartBottomsheetPage({super.key});

  @override
  State<StandartBottomsheetPage> createState() => _StandartBottomsheetPageState();
}

class _StandartBottomsheetPageState extends State<StandartBottomsheetPage> {
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
                  title: 'Standart BottomSheet',
                  desc: 'This is the example of BottomSheet without any style'
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: _globalWidget.createButton(
                      buttonName: 'Open BottomSheet',
                      onPressed: (){
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 32),
                              child: const Text('BottomSheet', textAlign: TextAlign.center),
                            );
                          },
                        );
                      }
                  ),
              ),
            ],
          ),
        )
    );
  }
}
