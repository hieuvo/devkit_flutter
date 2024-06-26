import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/screen/contact_us/contact_us_list.dart';
import 'package:devkitflutter/ui/screen/forgot_password/forgot_password_list.dart';
import 'package:devkitflutter/ui/screen/home/home_list.dart';
import 'package:devkitflutter/ui/screen/notification/notification_list.dart';
import 'package:devkitflutter/ui/screen/onboarding/onboarding_list.dart';
import 'package:devkitflutter/ui/screen/product_list/product_list.dart';
import 'package:devkitflutter/ui/screen/signin/signin_list.dart';
import 'package:devkitflutter/ui/screen/signup/signup_list.dart';
import 'package:devkitflutter/ui/screen/timeline/timeline_list.dart';
import 'package:devkitflutter/ui/screen/user/user_list.dart';
import 'package:devkitflutter/ui/screen/user_profile/user_profile_list.dart';
import 'package:devkitflutter/ui/screen/verification/verification_list.dart';
import 'package:flutter/material.dart';

class ScreenTabPage extends StatefulWidget {
  const ScreenTabPage({super.key});

  @override
  State<ScreenTabPage> createState() => _ScreenTabPageState();
}

class _ScreenTabPageState extends State<ScreenTabPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int number = 1;

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
    return Tab(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        children: [
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.vibration,
              title: 'On Boarding',
              desc: 'First time on board',
              page: const OnboardingListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.login,
              title: 'Sign In',
              desc: 'Used for authentication',
              page: const SigninListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.how_to_reg,
              title: 'Sign Up',
              desc: 'Used for authentication',
              page: const SignupListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.check,
              title: 'Verification',
              desc: 'Used for authentication',
              page: const VerificationListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.vpn_key,
              title: 'Forgot Password',
              desc: 'Used for authentication',
              page: const ForgotPasswordListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.home,
              title: 'Home',
              desc: 'Main screen of the apps',
              page: const HomeListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.person_outline,
              title: 'User / Account',
              desc: 'Used for user / account menu',
              page: const UserListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.account_circle,
              title: 'User Profile',
              desc: 'Used for profile',
              page: const UserProfileListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.phone,
              title: 'Contact Us',
              desc: 'Used for contact the customer support',
              page: const ContactUsListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.list_alt,
              title: 'Product List',
              desc: 'Used for listing product',
              page: const ProductListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.timeline,
              title: 'Timeline',
              desc: 'Used for timeline',
              page: const TimelineListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.notifications,
              title: 'Notification',
              desc: 'Used for notification message',
              page: const NotificationListPage()
          ),
        ],
      ),
    );
  }
}
