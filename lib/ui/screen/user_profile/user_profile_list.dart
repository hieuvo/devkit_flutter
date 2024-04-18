import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/screen/user_profile/user_profile1.dart';
import 'package:devkitflutter/ui/screen/user_profile/user_profile2.dart';
import 'package:devkitflutter/ui/screen/user_profile/user_profile3.dart';
import 'package:flutter/material.dart';

class UserProfileListPage extends StatefulWidget {
  const UserProfileListPage({super.key});

  @override
  State<UserProfileListPage> createState() => _UserProfileListPageState();
}

class _UserProfileListPageState extends State<UserProfileListPage> {
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
            const Text('User Profile Screen',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('User profile screen',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.account_circle,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('Screen List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'User Profile 1',
                page: const UserProfile1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'User Profile 2',
                page: const UserProfile2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'User Profile 3',
                page: const UserProfile3Page()),
          ],
        ));
  }
}
