import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedCrossFade1Page extends StatefulWidget {
  const AnimatedCrossFade1Page({super.key});

  @override
  State<AnimatedCrossFade1Page> createState() => _AnimatedCrossFade1PageState();
}

class _AnimatedCrossFade1PageState extends State<AnimatedCrossFade1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _sold = false;

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
                  title: 'Animated Cross Fade 1',
                  desc: 'This is the example of standart animated cross fade'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Change',
                    onPressed: (){
                      setState(() {
                        _sold = !_sold;
                      });
                    }
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: AnimatedCrossFade(
                  crossFadeState: _sold ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(seconds: 1),
                  firstChild: Container(
                    width: 200,
                    height: 50,
                    color: Colors.pinkAccent,
                    child: const Center(
                      child: Text('Buy', style: TextStyle(
                        color: Colors.white
                      )),
                    ),
                  ),
                  secondChild: Container(
                    width: 200,
                    height: 50,
                    color: Colors.blueAccent,
                    child: const Center(
                      child: Text('Sold', style: TextStyle(
                          color: Colors.white
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
