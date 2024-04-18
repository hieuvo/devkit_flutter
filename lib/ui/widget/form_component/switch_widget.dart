import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SwitchWidgetPage extends StatefulWidget {
  const SwitchWidgetPage({super.key});

  @override
  State<SwitchWidgetPage> createState() => _SwitchWidgetPageState();
}

class _SwitchWidgetPageState extends State<SwitchWidgetPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _val = true;

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Switch Widget',
                  desc: 'This is the example of Switch'
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Switch'),
              ),
              Column(
                children: [
                  Switch(
                    value: _val,
                    onChanged: (value) {
                      setState(() {
                        _val = value;
                      });
                    },
                  ),
                  Switch(
                    value: _val,
                    onChanged: (value) {
                      setState(() {
                        _val = value;
                      });
                    },
                    activeTrackColor: Colors.orangeAccent,
                    activeColor: Colors.green,
                  ),
                  Switch(
                    value: _val,
                    onChanged: (value) {
                      setState(() {
                        _val = value;
                      });
                    },
                    activeTrackColor: Colors.orangeAccent,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.purple,
                    inactiveThumbColor: Colors.cyan,
                  ),
                  Transform.scale(
                    scale: 2,
                    child: Switch(
                      value: _val,
                      onChanged: (value) {
                        setState(() {
                          _val = value;
                        });
                      },
                    ),
                  ),
                  Transform.scale(
                    scale: 2,
                    child: Switch(
                      value: _val,
                      onChanged: (value) {
                        setState(() {
                          _val = value;
                        });
                      },
                      activeThumbImage: const NetworkImage('$globalUrl/product/1.jpg'),
                      inactiveThumbImage: const NetworkImage('$globalUrl/product/2.jpg'),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Text('SwitchTile'),
              ),
              SwitchListTile(
                contentPadding: const EdgeInsets.only(left: 16, right: 4),
                title: const Text('Title switch'),
                value: _val,
                activeColor: primaryColor,
                onChanged: (bool value) {
                  setState(() {
                    _val = value;
                  });
                },
              ),
              SwitchListTile(
                contentPadding: const EdgeInsets.only(left: 16, right: 4),
                title: const Text('Title switch'),
                subtitle: const Text('Subtitle switch'),
                value: _val,
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.pinkAccent,
                onChanged: (bool value) {
                  setState(() {
                    _val = value;
                  });
                },
              ),
              SwitchListTile(
                contentPadding: const EdgeInsets.only(left: 16, right: 4),
                title: const Text('Title switch'),
                subtitle: const Text('Subtitle switch'),
                secondary: const Icon(Icons.home),
                value: _val,
                activeTrackColor: Colors.yellow,
                activeColor: Colors.purple,
                onChanged: (bool value) {
                  setState(() {
                    _val = value;
                  });
                },
              )
            ],
          ),
        )
    );
  }
}
