import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  const AnimatedPositionedPage({super.key});

  @override
  State<AnimatedPositionedPage> createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _first = true;

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
                title: 'Animated Positioned',
                desc: 'Animated version of Positioned which automatically transitions the child\'s position over a given duration whenever the given position changes.',
                icon: Icons.animation
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Change',
                  onPressed: (){
                    setState(() {
                      _first = !_first;
                    });
                  }
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.grey[400],
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      width: _first ? 200.0 : 50.0,
                      height: _first ? 50.0 : 200.0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: Container(
                        color: Colors.pinkAccent,
                        child: const Center(
                          child: Text('Hello', style: TextStyle(
                            color: Colors.white
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
