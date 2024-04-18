import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/video_player/video_player1.dart';
import 'package:devkitflutter/ui/feature/video_player/video_player2.dart';
import 'package:devkitflutter/ui/feature/video_player/video_player3.dart';
import 'package:devkitflutter/ui/feature/video_player/video_player4.dart';
import 'package:devkitflutter/ui/feature/video_player/video_player5.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class VideoPlayerListPage extends StatefulWidget {
  const VideoPlayerListPage({super.key});

  @override
  State<VideoPlayerListPage> createState() => _VideoPlayerListPageState();
}

class _VideoPlayerListPageState extends State<VideoPlayerListPage> {
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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            const Text('Video Player',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('Video player used to play a video.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.ondemand_video,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Video Player 1 (Video from local source / assets)',
                page: const VideoPlayer1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Video Player 2 (Video from network)',
                page: const VideoPlayer2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Video Player 3 (Control overlay)',
                page: const VideoPlayer3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Video Player 4 (Player controller)',
                page: const VideoPlayer4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Video Player 5 (Duration text)',
                page: const VideoPlayer5Page()),
          ],
        ));
  }
}
