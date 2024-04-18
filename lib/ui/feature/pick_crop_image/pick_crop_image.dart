/*
install plugin in pubspec.yaml
- image_picker => to pick image from storage or camera (https://pub.dev/packages/image_picker)
  add this to ios Info.plist
  <key>NSPhotoLibraryUsageDescription</key>
  <string>I need this permission to test upload photo</string>
  <key>NSCameraUsageDescription</key>
  <string>I need this permission to test upload photo</string>
  <key>NSMicrophoneUsageDescription</key>
  <string>I need this permission to test upload photo</string>

  When using package image_picker: ^0.8.0+4, we should add this permission at AndroidManifest
  android/app/src/debug/AndroidManifest.xml | android/app/src/main/AndroidManifest.xml | android/app/src/profile/AndroidManifest.xml
  <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>

- image_cropper => to crop the image after get from storage or camera (https://pub.dev/packages/image_cropper)
  add this to android manifest :
  <activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>

- permission_handler => to handle permission such as storage, camera (https://pub.dev/packages/permission_handler)
From above link, you should add this to the podfile if you are running on iOS:
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      flutter_additional_ios_build_settings(target)

      # You can enable the permissions needed here. For example to enable camera
      # permission, just remove the `#` character in front so it looks like this:
      #
      # ## dart: PermissionGroup.camera
      # 'PERMISSION_CAMERA=1'
      #
      #  Preprocessor definitions can be found in: https://github.com/Baseflow/flutter-permission-handler/blob/master/permission_handler/ios/Classes/PermissionHandlerEnums.h
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        '$(inherited)',

        ## dart: PermissionGroup.calendar
        # 'PERMISSION_EVENTS=1',

        ## dart: PermissionGroup.reminders
        # 'PERMISSION_REMINDERS=1',

        ## dart: PermissionGroup.contacts
        # 'PERMISSION_CONTACTS=1',

        ## dart: PermissionGroup.camera
        'PERMISSION_CAMERA=1',

        ## dart: PermissionGroup.microphone
        # 'PERMISSION_MICROPHONE=1',

        ## dart: PermissionGroup.speech
        # 'PERMISSION_SPEECH_RECOGNIZER=1',

        ## dart: PermissionGroup.photos
        'PERMISSION_PHOTOS=1',

        ## dart: [PermissionGroup.location, PermissionGroup.locationAlways, PermissionGroup.locationWhenInUse]
        # 'PERMISSION_LOCATION=1',

        ## dart: PermissionGroup.notification
        # 'PERMISSION_NOTIFICATIONS=1',

        ## dart: PermissionGroup.mediaLibrary
        # 'PERMISSION_MEDIA_LIBRARY=1',

        ## dart: PermissionGroup.sensors
        # 'PERMISSION_SENSORS=1',

        ## dart: PermissionGroup.bluetooth
        # 'PERMISSION_BLUETOOTH=1',

        ## dart: PermissionGroup.appTrackingTransparency
        # 'PERMISSION_APP_TRACKING_TRANSPARENCY=1',

        ## dart: PermissionGroup.criticalAlerts
        # 'PERMISSION_CRITICAL_ALERTS=1'
      ]

    end
  end
end

we add some logic function so if the user press back or done with this pages, cache images will be deleted and not makes the storage full

Don't forget to add all images and sound used in this pages at the pubspec.yaml

*** IMPORTANT NOTES FOR IOS ***
Image Picker will crash if you pick image for a second times, this error only exist on iOS Simulator 14 globaly around the world but not error on the real device
If you want to use iOS Simulator, you need to downgrade and using iOS Simulator 13
Follow this step to downgrade :
1. Xcode > Preferences
2. Select the "Components" tab.
3. Download and select Simulator 13 after the download is finish
4. Press "Check and Install Now".
5. After that, use Simulator 13 instead of simulator 14
 */

import 'dart:io';
import 'package:universal_io/io.dart' as io;

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickCropImagePage extends StatefulWidget {
  const PickCropImagePage({super.key});

  @override
  State<PickCropImagePage> createState() => _PickCropImagePageState();
}

class _PickCropImagePageState extends State<PickCropImagePage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Color _color1 = const Color(0xFF0181cc);
  final Color _color2 = const Color(0xFF515151);
  final Color _color3 = const Color(0xff777777);

  File? _image;
  final _picker = ImagePicker();

  File? _selectedFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_selectedFile != null && _selectedFile!.existsSync()) {
      _selectedFile!.deleteSync();
    }
    _selectedFile = null;
    super.dispose();
  }

  Future requestPermission(Permission permission) async {
    final result = await permission.request();
    return result;
  }

  void _askPermissionCamera() {
    requestPermission(Permission.camera).then(_onStatusRequestedCamera);
  }

  void _askPermissionStorage() {
    _getImage(ImageSource.gallery);
  }

  void _askPermissionPhotos() {
    requestPermission(Permission.photos).then(_onStatusRequested);
  }

  void _onStatusRequested(status) {
    if (status != PermissionStatus.granted) {
      if (io.Platform.isIOS) {
        openAppSettings();
      } else {
        if(status == PermissionStatus.permanentlyDenied){
          openAppSettings();
        }
      }
    } else {
      _getImage(ImageSource.gallery);
    }
  }

  void _onStatusRequestedCamera(status) {
    if (status != PermissionStatus.granted) {
      if (io.Platform.isIOS) {
        openAppSettings();
      } else {
        if(status == PermissionStatus.permanentlyDenied){
          openAppSettings();
        }
      }
    } else {
      _getImage(ImageSource.camera);
    }
  }

  void _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });

    if(_image != null){
      CroppedFile? cropped = await ImageCropper().cropImage(
          sourcePath: _image!.path,
          aspectRatio: const CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          cropStyle:CropStyle.circle,
          compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
            initAspectRatio: CropAspectRatioPreset.original,
            toolbarColor: Colors.white,
            toolbarTitle: 'Edit Images',
            statusBarColor: _color1,
            activeControlsWidgetColor: _color2,
            cropFrameColor: Colors.white,
            cropGridColor: Colors.white,
            toolbarWidgetColor: _color2,
            backgroundColor: Colors.white,
          ),
          IOSUiSettings(
            title: 'Edit Images',
          )
        ],
      );

      setState((){
        if(cropped!=null){
          if(_selectedFile!=null && _selectedFile!.existsSync()){
            _selectedFile!.deleteSync();
          }
          _selectedFile = File(cropped.path);
        }

        // delete image camera
        if(source.toString()=='ImageSource.camera' && _image!.existsSync()){
          _image!.deleteSync();
        }

        _image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  _getImageWidget(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.camera_alt,
                              color: _color3,
                              size: 40,
                            ),
                            const SizedBox(width: 10),
                            const Text('Camera'),
                          ],
                        ),
                        onTap: () {
                          _askPermissionCamera();
                        },
                      ),
                      Container(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.photo,
                              color: _color3,
                              size: 40,
                            ),
                            const SizedBox(width: 10),
                            const Text('Gallery'),
                          ],
                        ),
                        onTap: () {
                          if (io.Platform.isIOS) {
                            _askPermissionPhotos();
                          } else {
                            _askPermissionStorage();
                          }
                        },
                      ),
                    ],
                  ),
                  _buttonSave()
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget _getImageWidget() {
    if (_selectedFile != null) {
      return ClipOval(
        child: Image.file(
          _selectedFile!,
          width: 250,
          height: 250,
          fit: BoxFit.fill,
        ),
      );
    } else {
      return ClipOval(
        child: Image.asset(
          'assets/images/placeholder.jpg',
          width: 250,
          height: 250,
          fit: BoxFit.fill,
        ),
      );
    }
  }

  Widget _buttonSave() {
    if (_selectedFile != null) {
      return Container(
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: SizedBox(
          child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) => _color1,
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    )
                ),
              ),
              onPressed: () {
                if (_selectedFile != null && _selectedFile!.existsSync()) {
                  Fluttertoast.showToast(msg: 'Click save success', toastLength: Toast.LENGTH_SHORT);
                } else {
                  Fluttertoast.showToast(
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      msg: 'File not found',
                      fontSize: 13,
                      toastLength: Toast.LENGTH_SHORT);
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
