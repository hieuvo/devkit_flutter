import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class DrawerCustomShapePage extends StatefulWidget {
  const DrawerCustomShapePage({super.key});

  @override
  State<DrawerCustomShapePage> createState() => _DrawerCustomShapePageState();
}

class _DrawerCustomShapePageState extends State<DrawerCustomShapePage> {
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
        drawer: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(150),
              topRight: Radius.circular(150),
            ),
            child: SizedBox(
              width: 200,
              child: Drawer(
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
            ),
          ),
        ),
        body: const Center(
          child: Text('Drawer Custom Shape'),
        ));
  }
}
