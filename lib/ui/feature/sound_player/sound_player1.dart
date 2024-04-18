// https://www.bensound.com/royalty-free-music/track/jazzy-frenchy-upbeat-funny

import 'package:audioplayers/audioplayers.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SoundPlayer1Page extends StatefulWidget {
  const SoundPlayer1Page({super.key});

  @override
  State<SoundPlayer1Page> createState() => _SoundPlayer1PageState();
}

class _SoundPlayer1PageState extends State<SoundPlayer1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  Future _startSound() async {
    _stopSound();
    await _audioPlayer.play(AssetSource('sounds/demo1.mp3')).then((val) {
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
                  title: 'Sound Player 1',
                  desc: 'This is the example of sound player from local source / assets with mp3 format.\nMusic by Bensound.com'),
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
