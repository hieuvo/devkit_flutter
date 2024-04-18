import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AppTheme1Page extends StatefulWidget {
  const AppTheme1Page({super.key});

  @override
  State<AppTheme1Page> createState() => _AppTheme1PageState();
}

class _AppTheme1PageState extends State<AppTheme1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  String _theme = 'light';

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
        appBar: _globalWidget.globalAppBar(),
        // App Theme is start from Material App
        body: MaterialApp(
          title: 'App Theme',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: (_theme=='light')?ThemeMode.light:ThemeMode.dark,
          home: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('App Theme (Light Theme / Dark Theme)', style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500
                  )),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text('This is the example of default light theme and dark theme', style: TextStyle(
                        fontSize: 15, letterSpacing: 0.5
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 8),
                    child: const Text('Example', style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500
                    )),
                  ),
                  const SizedBox(height: 16),
                  const Text('Choose Theme'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        // This goes to the build method
                        _customRadioButton(value: 'light', option: 'Light Theme'),
                        const SizedBox(height: 16),
                        _customRadioButton(value: 'dark', option: 'Dark Theme'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('This is card'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Icon(Icons.settings, size: 40)
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget _customRadioButton({value = 'light', option = 'Light Theme'}){
    return GestureDetector(
      onTap: (){
        setState(() {
          _theme = value;
        });
      },
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: _theme==value?Colors.pinkAccent:Colors.grey
                ),
                borderRadius: const BorderRadius.all(
                    Radius.circular(2)
                ),
                color: _theme==value?Colors.pinkAccent:Colors.white
            )
          ),
          const SizedBox(width: 16),
          Text(option)
        ],
      ),
    );
  }
}
