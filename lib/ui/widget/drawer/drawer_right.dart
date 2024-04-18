import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class DrawerRightPage extends StatefulWidget {
  const DrawerRightPage({super.key});

  @override
  State<DrawerRightPage> createState() => _DrawerRightPageState();
}

class _DrawerRightPageState extends State<DrawerRightPage> {
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
        endDrawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Close this drawer'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )),
        body: const Center(
          child: Text('Drawer at the right'),
        ));
  }
}
