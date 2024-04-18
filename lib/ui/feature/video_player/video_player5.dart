// Video by Pixabay: https://www.pexels.com/video/bee-on-a-flower-854251/

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer5Page extends StatefulWidget {
  const VideoPlayer5Page({super.key});

  @override
  State<VideoPlayer5Page> createState() => _VideoPlayer5PageState();
}

class _VideoPlayer5PageState extends State<VideoPlayer5Page> {
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

  String _videoDuration(Duration duration){
    String twoDigits(int n ) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours, minutes, seconds
    ].join(':');
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
                  title: 'Video Player 5',
                  desc: 'This is the example of video player with duration text.\nVideo by Pixabay'),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ValueListenableBuilder(
                    valueListenable: _controller,
                    builder: (context, VideoPlayerValue value, child){
                      return Text(
                        _videoDuration(value.position),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      );
                    },
                  ),
                  Expanded(
                      child: SizedBox(
                        height: 20,
                        child: VideoProgressIndicator(
                            _controller,
                            allowScrubbing: true,
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 12
                            ),
                        ),
                      )
                  ),
                  Text(_videoDuration(_controller.value.duration),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16
                      )),
                ],
              ),
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
