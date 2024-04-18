import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/sound_player/sound_player1.dart';
import 'package:devkitflutter/ui/feature/sound_player/sound_player2.dart';
import 'package:devkitflutter/ui/feature/sound_player/sound_player3.dart';
import 'package:devkitflutter/ui/feature/sound_player/sound_player4.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SoundPlayerListPage extends StatefulWidget {
  const SoundPlayerListPage({super.key});

  @override
  State<SoundPlayerListPage> createState() => _SoundPlayerListPageState();
}

class _SoundPlayerListPageState extends State<SoundPlayerListPage> {
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
            const Text('Sound Player',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('Sound player used to play a audio.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.music_note,
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
                title: 'Sound Player 1 (Audio mp3 from local source / assets)',
                page: const SoundPlayer1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sound Player 2 (Audio mp3 from network)',
                page: const SoundPlayer2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sound Player 3 (Audio using wav format)',
                page: const SoundPlayer3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sound Player 4 (With player control)',
                page: const SoundPlayer4Page()),
          ],
        ));
  }
}
