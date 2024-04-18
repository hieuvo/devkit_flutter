// Video by Pixabay: https://www.pexels.com/video/bee-on-a-flower-854251/

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer4Page extends StatefulWidget {
  const VideoPlayer4Page({super.key});

  @override
  State<VideoPlayer4Page> createState() => _VideoPlayer4PageState();
}

class _VideoPlayer4PageState extends State<VideoPlayer4Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late VideoPlayerController _controller;

  bool _isLoop = false;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse('https://ijtechnology.net/assets/videos/demo.mp4'));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize().then((_) => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play() {
    if (!_controller.value.isPlaying) {
      _controller.play();
    }
  }

  void _pause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
  }

  void _stop() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      _controller.seekTo(Duration.zero);
    }
  }

  void _changeLoop(){
    setState(() {
      if (_isLoop) {
        _controller.setLooping(false);
        _isLoop = false;
      } else {
        _controller.setLooping(true);
        _isLoop = true;
      }
    });
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
                  title: 'Video Player 4',
                  desc: 'This is the example of video player with player controller.\nVideo by Pixabay'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: VideoProgressIndicator(_controller, allowScrubbing: true),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Wrap(
                spacing: 10,
                children: [
                  _globalWidget.createButton(
                      buttonName: 'Play',
                      onPressed: () {
                        _play();
                      }),
                  _globalWidget.createButton(
                      buttonName: 'Pause',
                      onPressed: () {
                        _pause();
                      }),
                  _globalWidget.createButton(
                      buttonName: 'Stop',
                      onPressed: () {
                        _stop();
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
