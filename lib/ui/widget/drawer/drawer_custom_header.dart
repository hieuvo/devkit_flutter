import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class DrawerCustomHeaderPage extends StatefulWidget {
  const DrawerCustomHeaderPage({super.key});

  @override
  State<DrawerCustomHeaderPage> createState() => _DrawerCustomHeaderPageState();
}

class _DrawerCustomHeaderPageState extends State<DrawerCustomHeaderPage> {
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
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Ashish Rawat"),
              accountEmail: Text("ashishrawat2911@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("A", style: TextStyle(fontSize: 40.0)),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              leading: const Icon(Icons.arrow_forward),
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
          child: Text('Drawer Custom Header'),
        ));
  }
}
