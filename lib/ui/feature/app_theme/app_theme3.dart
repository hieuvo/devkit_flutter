import 'package:devkitflutter/cubit/theme/theme_cubit.dart';
import 'package:devkitflutter/ui/feature/app_theme/change_theme.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTheme3Page extends StatefulWidget {
  const AppTheme3Page({super.key});

  @override
  State<AppTheme3Page> createState() => _AppTheme3PageState();
}

class _AppTheme3PageState extends State<AppTheme3Page> {
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
        appBar: _globalWidget.globalAppBar(),
        // App Theme is start from Material App
        body: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
          return MaterialApp(
            title: 'App Theme',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: (state is ChangeThemeSuccess)
                ? (state.isDarkMode)
                    ? ThemeMode.dark
                    : ThemeMode.light
                : ThemeMode.light,
            home: Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        'App Theme (Change Theme from another screen using Cubit)',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: const Text(
                          'This is the example of change theme from another screen',
                          style: TextStyle(fontSize: 15, letterSpacing: 0.5)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24, bottom: 8),
                      child: const Text('Example',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    _globalWidget.createButton(
                        buttonName: 'Change Theme From this Screen',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChangeThemePage()));
                        }),
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
          );
        }));
  }
}
