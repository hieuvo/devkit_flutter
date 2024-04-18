import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({super.key});

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _opacity = false;
  double _opacityLevel = 1.0;

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
                title: 'Animated Opacity',
                desc: 'Animated version of Opacity which automatically transitions the child\'s opacity over a given duration whenever the given opacity changes.',
                icon: Icons.animation
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Change',
                  onPressed: (){
                    setState(() {
                      _opacity = !_opacity;
                      _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0;
                    });
                  }
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: AnimatedOpacity(
                opacity: _opacityLevel,
                duration: const Duration(seconds: 2),
                child: Image.asset('assets/images/lamp.jpg', height: 200),
              ),
            )
          ],
        ),
      ),
    );
  }
}
