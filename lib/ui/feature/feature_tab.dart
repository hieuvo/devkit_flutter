import 'package:devkitflutter/ui/feature/app_theme/app_theme_list.dart';
import 'package:devkitflutter/ui/feature/auto_complete/auto_complete_list.dart';
import 'package:devkitflutter/ui/feature/backdrop/backdrop_list.dart';
import 'package:devkitflutter/ui/feature/badges/badges_list.dart';
import 'package:devkitflutter/ui/feature/banner_slider/banner_slider_list.dart';
import 'package:devkitflutter/ui/feature/barcode_scanner/barcode_scanner_list.dart';
import 'package:devkitflutter/ui/feature/battery_information/battery_information.dart';
import 'package:devkitflutter/ui/feature/bottom_navigation/bottom_navigation_list.dart';
import 'package:devkitflutter/ui/feature/bottom_sheet/bottom_sheet_list.dart';
import 'package:devkitflutter/ui/feature/category_menu/category_menu_list.dart';
import 'package:devkitflutter/ui/feature/charts/charts_package_list.dart';
import 'package:devkitflutter/ui/feature/custom_icon/custom_icon.dart';
import 'package:devkitflutter/ui/feature/device_information/device_information.dart';
import 'package:devkitflutter/ui/feature/disable_screenshot/disable_screenshot.dart';
import 'package:devkitflutter/ui/feature/indicator/indicator_list.dart';
import 'package:devkitflutter/ui/feature/interactive_chat/chat_list.dart';
import 'package:devkitflutter/ui/feature/interactive_chip/interactive_chip_list.dart';
import 'package:devkitflutter/ui/feature/like_button/like_button.dart';
import 'package:devkitflutter/ui/feature/loading_animation/loading_animation.dart';
import 'package:devkitflutter/ui/feature/multi_language/multi_language_list.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/page_route_animation_list.dart';
//import 'package:devkitflutter/ui/feature/photo_filter/pick_photo.dart';
import 'package:devkitflutter/ui/feature/pick_crop_image/pick_crop_image.dart';
import 'package:devkitflutter/ui/feature/pick_image/pick_image.dart';
import 'package:devkitflutter/ui/feature/press_back_2_times/press_back_2_times.dart';
import 'package:devkitflutter/ui/feature/rating/rating_list.dart';
import 'package:devkitflutter/ui/feature/screen_utility/screen_utility.dart';
import 'package:devkitflutter/ui/feature/share_content/share_content_list.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading_list.dart';
import 'package:devkitflutter/ui/feature/signature/signature_list.dart';
import 'package:devkitflutter/ui/feature/sliver_tab_bar/sliver_tabbar_list.dart';
import 'package:devkitflutter/ui/feature/gridview_dynamic_height/gridview_dynamic_height_list.dart';
import 'package:devkitflutter/ui/feature/sound_player/sound_player_list.dart';
import 'package:devkitflutter/ui/feature/sticky_header/sticky_header_list.dart';
import 'package:devkitflutter/ui/feature/storage_location_information/storage_location_information.dart';
import 'package:devkitflutter/ui/feature/tutorial_highlighter/tutorial_highlighter.dart';
import 'package:devkitflutter/ui/feature/url_launcher/url_launcher_list.dart';
import 'package:devkitflutter/ui/feature/video_player/video_player_list.dart';
import 'package:devkitflutter/ui/feature/webview/webview_list.dart';
import 'package:devkitflutter/ui/not_supported_for_ios.dart';
import 'package:devkitflutter/ui/not_supported_for_web.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class FeatureTabPage extends StatefulWidget {
  const FeatureTabPage({super.key});

  @override
  State<FeatureTabPage> createState() => _FeatureTabPageState();
}

class _FeatureTabPageState extends State<FeatureTabPage> {
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
              icon: Icons.invert_colors_on,
              title: 'App Theme (Light Theme / Dark Theme / Custom Theme)',
              page: const AppThemeListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.search,
              title: 'Auto Complete',
              desc: 'Auto Complete Search',
              page: const AutoCompleteListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.menu,
              title: 'Backdrop',
              desc: 'Backdrop',
              page: const BackdropListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.label,
              title: 'Badges',
              desc: 'Badges for Flutter',
              page: const BadgesListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.slideshow,
              title: 'Banner Slider',
              desc: 'Image Slideshow',
              page: const BannerSliderListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.qr_code,
              title: 'Barcode Scanner',
              desc: 'Barcode Scanner for Normal Barcode or QR Code',
              page: (!kIsWeb)?const BarcodeScannerListPage():const NotSupportedForWebPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.battery_std,
              title: 'Battery Information',
              desc: 'Show Battery Information',
              page: const BatteryInformationPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.call_to_action,
              title: 'Bottom Navigation',
              desc: 'Used to navigate between page using bottom navigation',
              page: const BottomNavigationListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.open_in_browser,
              title: 'Bottom Sheet Featured',
              desc: 'Slide from bottom',
              page: const BottomSheetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.category,
              title: 'Category Menu',
              desc: 'Used to list all category of the apps',
              page: const CategoryMenuListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.bar_chart,
              title: 'Charts',
              desc: 'Used for data visualization',
              page: const ChartsPackageListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.notifications,
              title: 'Custom Icon',
              desc: 'Custom icon with label',
              page: const CustomIconPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.devices,
              title: 'Device Information',
              desc: 'Platform Device Information',
              page: const DeviceInformationPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.devices,
              title: 'Disable & Enable Screenshot',
              desc: 'Used to disable & enable screenshot',
              page: (!kIsWeb)?Platform.isIOS?const NotSupportedForIosPage():const DisableScreenshotPage():const NotSupportedForWebPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.grid_view,
              title: 'Grid View - Dynamic Height',
              desc: 'Grid View with a different height size',
              page: const GridviewDynamicHeightListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.adjust,
              title: 'Indicator',
              desc: 'Indicators with Circle and Linear',
              page: const IndicatorListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.message,
              title: 'Interactive Chat',
              desc: 'Interactive chat used for messaging',
              page: const ChatListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.label,
              title: 'Interactive Chip',
              desc: 'Nice interactive chip used for input, choice, filter and action',
              page: const InteractiveChipListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.thumb_up,
              title: 'Like Button',
              desc: 'Like Button with Animation',
              page: const LikeButtonPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Loading Animation',
              desc: 'Loading Indicator with Animation',
              page: const LoadingAnimationPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.language,
              title: 'Multi Language',
              desc: 'Used to define more than 1 language',
              page: const MultiLanguageListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.keyboard_tab,
              title: 'Page Route Animation',
              desc: 'Used to animate transition when change between screen',
              page: const PageRouteAnimationListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.image,
              title: 'Pick Image',
              desc: 'Used to change picture',
              page: const PickImagePage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.image,
              title: 'Pick & Crop Image',
              desc: 'Used to change picture',
              page: (!kIsWeb)?const PickCropImagePage():const NotSupportedForWebPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.arrow_back,
              title: 'Press Back 2 Times',
              desc: 'Usually used to exit applications',
              page: const PressBack2TimesPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.star,
              title: 'Rating',
              desc: 'Feature for rate / review',
              page: const RatingListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.devices,
              title: 'Screen Utility',
              desc: 'A flutter plugin for adapting screen and font size. Let your UI display a reasonable layout on different screen sizes!',
              page: const ScreenUtilityPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.share,
              title: 'Share Content',
              desc: 'Share Your Content',
              page: const ShareContentListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.blur_linear_sharp,
              title: 'Shimmer Loading',
              desc: 'Used to shown loading when fetching data',
              page: const ShimmerLoadingListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.edit,
              title: 'Signature',
              desc: 'Digital Signature',
              page: const SignatureListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.table_chart,
              title: 'Sliver Tab Bar',
              desc: 'Tab bar animation with sliver',
              page: const SliverTabbarListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.music_note,
              title: 'Sound Player',
              desc: 'Used to play audio',
              page: const SoundPlayerListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.sticky_note_2,
              title: 'Sticky Header',
              desc: 'Used to stick the header on the top',
              page: const StickyHeaderListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.storage,
              title: 'Storage Location Information',
              desc: 'Finding commonly used location path on the filesystem',
              page: (!kIsWeb)?const StorageLocationInformationPage():const NotSupportedForWebPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.highlight_alt,
              title: 'Tutorial Highlighter',
              desc: 'Used to show tutorial',
              page: const TutorialHighlighterPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.launch,
              title: 'URL Launcher',
              desc: 'Launching a URL in the mobile platform (Website, Email, Phone Number, SMS)',
              page: const UrlLauncherListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.ondemand_video,
              title: 'Video Player',
              desc: 'Used to play a video',
              page: const VideoPlayerListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.web_asset,
              title: 'Webview',
              desc: 'Webview on mobile platform',
              page: (!kIsWeb)?const WebviewListPage():const NotSupportedForWebPage()
          ),
        ],
      ),
    );
  }
}
