import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class VerticalDividerPage extends StatefulWidget {
  const VerticalDividerPage({super.key});

  @override
  State<VerticalDividerPage> createState() => _VerticalDividerPageState();
}

class _VerticalDividerPageState extends State<VerticalDividerPage> {
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
                  title: 'Vertical Divider',
                  desc: 'This is the example of vertical divider'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const IntrinsicHeight(
                  child: Row(
                    children: [
                      Text('Menu 1'),
                      VerticalDivider(),
                      Text('Menu 2'),
                      VerticalDivider(
                        thickness: 8,
                      ),
                      Text('Menu 3'),
                      VerticalDivider(
                        width: 40,
                      ),
                      Text('Menu 4'),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const IntrinsicHeight(
                  child: Row(
                    children: [
                      Text('Menu 5'),
                      VerticalDivider(
                        color: Colors.pinkAccent,
                      ),
                      Text('Menu 6'),
                      VerticalDivider(
                        color: Colors.pinkAccent,
                        indent: 8,
                      ),
                      Text('Menu 7'),
                      VerticalDivider(
                        color: Colors.pinkAccent,
                        endIndent: 8,
                      ),
                      Text('Menu 8'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
