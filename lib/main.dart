import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:freeplay/core/app/app.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/di/injections.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/firebase_options.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:url_launcher/url_launcher_string.dart';

// import 'package:timezone/data/latest.dart' as tz;

late String timezone;

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

const platform = MethodChannel('my_flutter_app/channel');

Future<void> openBrowser(String webURl) async {
  if (Platform.isIOS) {
    try {
      await platform.invokeMethod('openExternalBrowser', {'url': webURl});
      print("Browser opened successfully");
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
    }
  } else {
    if (await canLaunchUrlString(webURl)) {
      await launchUrlString(webURl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $webURl';
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  var afDevKey = 'CYoWPyCAHPpUoNxwMQKaz7';
  var appId = '6443625031';
  if (Platform.isAndroid) {
    appId = 'com.fivemonkeygames';
  }



  AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
    afDevKey: 'CYoWPyCAHPpUoNxwMQKaz7',
    appId: appId,
    showDebug: true,
    timeToWaitForATTUserAuthorization: 50, // for iOS 14.5
    disableAdvertisingIdentifier: false, // Optional field
    disableCollectASA: false, //Optional field
    manualStart: true); // Optional field

  AppsflyerSdk appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

  appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true
  );

  appsflyerSdk.startSDK(
    onSuccess: () {
      log("AppsFlyer SDK initialized successfully.");
    },
    onError: (int errorCode, String errorMessage) {
      log("Error initializing AppsFlyer SDK: Code $errorCode - $errorMessage");
    },
  );

  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var sdkInt = androidInfo.version.sdkInt;
    if (sdkInt! > 31) {
      checkPermission();
    }
  } else if (Platform.isIOS) {
    checkPermission();
  }
  await _initApp().then((value) {
    runApp(App());
  });
}

Future<void> checkPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}

Future _initApp() async {
  final futures = <Future>[
    dot_env.dotenv.load(fileName: ".env"),
    configureDependencies()
  ];
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait(futures);
  // timezone = await FlutterNativeTimezone.getLocalTimezone();
  timezone = await FlutterTimezone.getLocalTimezone();
  log('[Flutter]: $timezone');
  //LocalNotificationService.initialize();
  // tz.initializeTimeZones();
  // tz.setLocalLocation(tz.getLocation(dtz));

}
