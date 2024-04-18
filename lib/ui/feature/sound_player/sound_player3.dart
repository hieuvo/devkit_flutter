// https://freesound.org/people/HojnyTomasz/sounds/176342/

import 'package:audioplayers/audioplayers.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SoundPlayer3Page extends StatefulWidget {
  const SoundPlayer3Page({super.key});

  @override
  State<SoundPlayer3Page> createState() => _SoundPlayer3PageState();
}

class _SoundPlayer3PageState extends State<SoundPlayer3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  Future _startSound() async {
    _stopSound();
    await _audioPlayer.play(UrlSource('https://ijtechnology.net/assets/sounds/demo2.wav')).then((val) {
      setState(() {
        _isPlaying = true;
      });
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      _stopSound();
    });
  }

  Future _stopSound() async {
    await _audioPlayer.stop().then((val) {
      setState(() {
        _isPlaying = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _stopSound();
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
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Sound Player 3',
                  desc: 'This is the example of sound player using wav format.\nMusic : https://freesound.org/people/HojnyTomasz/sounds/176342/'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: _isPlaying ? 'Stop' : 'Play',
                  onPressed: () {
                    setState(() {
                      _isPlaying
                          ? _stopSound()
                          : _startSound();
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
