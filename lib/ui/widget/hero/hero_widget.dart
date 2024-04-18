import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class HeroWidgetPage extends StatefulWidget {
  const HeroWidgetPage({super.key});

  @override
  State<HeroWidgetPage> createState() => _HeroWidgetPageState();
}

class _HeroWidgetPageState extends State<HeroWidgetPage> {
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
                  title: 'Hero Widget',
                  desc:
                      'The icon will be animated from before page to this page'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Hero(
                  tag: 'volley',
                  child: Icon(
                    Icons.sports_volleyball,
                    size: 280,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
