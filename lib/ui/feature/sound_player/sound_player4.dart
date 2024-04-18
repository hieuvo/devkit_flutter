// https://freesound.org/people/HojnyTomasz/sounds/176342/

import 'package:audioplayers/audioplayers.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SoundPlayer4Page extends StatefulWidget {
  const SoundPlayer4Page({super.key});

  @override
  State<SoundPlayer4Page> createState() => _SoundPlayer4PageState();
}

class _SoundPlayer4PageState extends State<SoundPlayer4Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _isLoop = false;

  Future _startSound() async {
    await _audioPlayer.play(UrlSource('https://ijtechnology.net/assets/sounds/demo2.wav'));
    _audioPlayer.onPlayerComplete.listen((event) {
      _stopSound();
    });
  }

  Future _pauseSound() async {
    await _audioPlayer.pause();
  }

  Future _stopSound() async {
    await _audioPlayer.stop();
  }

  void _changeLoop() async{
    if (_isLoop) {
      await _audioPlayer.setReleaseMode(ReleaseMode.stop).then((val) {
        setState(() {
          _isLoop = false;
        });
      });
    } else {
      await _audioPlayer.setReleaseMode(ReleaseMode.loop).then((val) {
        setState(() {
          _isLoop = true;
        });
      });
    }
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
                  title: 'Sound Player 4',
                  desc: 'This is the example of sound player with player control.\nMusic : https://freesound.org/people/HojnyTomasz/sounds/176342/'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Wrap(
                spacing: 10,
                children: [
                  _globalWidget.createButton(
                      buttonName: 'Play',
                      onPressed: () {
                        _startSound();
                      }),
                  _globalWidget.createButton(
                      buttonName: 'Pause',
                      onPressed: () {
                        _pauseSound();
                      }),
                  _globalWidget.createButton(
                      buttonName: 'Stop',
                      onPressed: () {
                        _stopSound();
                      }),
                  _globalWidget.createButton(
                      buttonName: _isLoop ? 'Looping Status : On' : 'Looping Status : Off',
                      onPressed: () {
                        _changeLoop();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
