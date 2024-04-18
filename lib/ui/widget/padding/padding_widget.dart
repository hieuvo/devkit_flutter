import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PaddingWidgetPage extends StatefulWidget {
  const PaddingWidgetPage({super.key});

  @override
  State<PaddingWidgetPage> createState() => _PaddingWidgetPageState();
}

class _PaddingWidgetPageState extends State<PaddingWidgetPage> {
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
              _globalWidget.createDetailWidget2(
                  title: 'Padding Widget',
                  desc: 'Padding Widget used to give padding to widget that doesn\'t have padding.',
                  icon: Icons.padding
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Without padding')
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: const Card(
                    child: Text('This card is without padding widget'),
                  )
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('With padding')
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('This card is wrapped by padding widget')
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}
