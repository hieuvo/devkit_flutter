// Video by Pixabay: https://www.pexels.com/video/bee-on-a-flower-854251/

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer2Page extends StatefulWidget {
  const VideoPlayer2Page({super.key});

  @override
  State<VideoPlayer2Page> createState() => _VideoPlayer2PageState();
}

class _VideoPlayer2PageState extends State<VideoPlayer2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late VideoPlayerController _controller;

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
                  title: 'Video Player 2',
                  desc: 'This is the example of video player from network.\nVideo by Pixabay'),
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
              child: Center(
                child: _globalWidget.createButton(
                    buttonName: _controller.value.isPlaying ? 'Pause' : 'Play',
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
