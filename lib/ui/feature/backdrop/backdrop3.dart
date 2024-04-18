/*
https://pub.dev/packages/badges
*/
import 'package:backdrop/backdrop.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Backdrop3Page extends StatefulWidget {
  const Backdrop3Page({super.key});

  @override
  State<Backdrop3Page> createState() => _Backdrop3PageState();
}

// initialize global widget
final _globalWidget = GlobalWidget();

class _Backdrop3PageState extends State<Backdrop3Page> {
  int _currentIndex = 0;
  final List<Widget> _pages = [const _Widget1(), const _Widget2(), const _Widget3()];

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
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: const Text("Backdrop With Navigation"),
        actions: const <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      stickyFrontLayer: true,
      frontLayer: _pages[_currentIndex],
      backLayer: BackdropNavigationBackLayer(
        items: const [
          ListTile(title: Text("Widget 1", style: TextStyle(
            color: Colors.white
          ))),
          ListTile(title: Text("Widget 2", style: TextStyle(
              color: Colors.white
          ))),
          ListTile(title: Text("Widget 3", style: TextStyle(
              color: Colors.white
          ))),
        ],
        onTap: (int position) => {setState(() => _currentIndex = position)},
      ),
    );
  }
}

class _Widget1 extends StatelessWidget {
  const _Widget1();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(child: Text("Widget 1")),
        const SizedBox(height: 12),
        Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              buttonName: 'Back',
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        )
      ],
    );
  }
}

class _Widget2 extends StatelessWidget {
  const _Widget2();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(child: Text("Widget 2")),
        const SizedBox(height: 12),
        Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              buttonName: 'Back',
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        )
      ],
    );
  }
}

class _Widget3 extends StatelessWidget {
  const _Widget3();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(child: Text("Widget 3")),
        const SizedBox(height: 12),
        Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              buttonName: 'Back',
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        )
      ],
    );
  }
}