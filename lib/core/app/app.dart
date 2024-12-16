import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/di/injections.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/account/bloc/account_bloc.dart';
import 'package:freeplay/feature/betslip/bloc/betslips_bloc/betslips_bloc.dart';
import 'package:freeplay/feature/auth/bloc/login_bloc.dart';
import 'package:freeplay/feature/contests/bloc/contest_bloc.dart';
import 'package:freeplay/feature/home/bloc/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';
import 'package:freeplay/feature/home/bloc/configuration_bloc/configuration_bloc.dart';
import 'package:freeplay/feature/home/bloc/home_banner_bloc/home_banner_bloc.dart';
import 'package:freeplay/feature/home/bloc/home_games_bloc/home_games_bloc.dart';
import 'package:freeplay/feature/home/bloc/leagues_bloc/leagues_bloc.dart';
import 'package:freeplay/feature/betslip/bloc/bloc/edit_wager_bloc.dart';
import 'package:freeplay/feature/betslip/bloc/place_betslib_bloc/place_betslib_bloc.dart';
import 'package:freeplay/feature/home/bloc/match_details_wager_bloc/match_details_wager_bloc.dart';
import 'package:freeplay/feature/home/bloc/notification_bloc/notification_bloc.dart';
import 'package:freeplay/feature/home/bloc/signup_bloc/signup_bloc.dart';
import 'package:freeplay/feature/home/bloc/sports_bloc/sports_bloc.dart';
import 'package:freeplay/feature/home/bloc/wager_bloc/wager_bloc.dart';

import '../../notificationService/local_notification_service.dart';
import '../dio/app_dio.dart';
import '../domain/configuration.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _MainEntryPointState();
}

class _MainEntryPointState extends State<App> {
  final appRouter = AppRouter();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    receiveNotification();
    getPUBConfiguration();
  }

  void receiveNotification() {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/app_icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          /*   ShowPushNotificationExpand(
              message.notification!.title, message.notification!.body);
       */
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => getIt<LoginBloc>(),
        ),
        BlocProvider<BottomNavBarBloc>(
            create: (_) => getIt<BottomNavBarBloc>()),
        BlocProvider<SportsBloc>(
          create: (_) =>
              getIt<SportsBloc>()..add(const SportsEvent.getSports()),
        ),
        BlocProvider<LeaguesBloc>(
          create: (_) =>
              getIt<LeaguesBloc>()..add(const LeaguesEvent.getLeagues()),
        ),
        BlocProvider<AccountBloc>(
          create: (_) => getIt<AccountBloc>(),
        ),
        BlocProvider<ContestBloc>(
          create: (_) => getIt<ContestBloc>(),
        ),
        BlocProvider<NotificationBloc>(
          create: (_) => getIt<NotificationBloc>(),
        ),
        BlocProvider<HomeGamesBloc>(create: (_) => getIt<HomeGamesBloc>()),
        BlocProvider<WagerBloc>(create: (_) => getIt<WagerBloc>()),
        BlocProvider<MatchDetailsWagerBloc>(
            create: (_) => getIt<MatchDetailsWagerBloc>()),
        BlocProvider<EditWagerBloc>(create: (_) => getIt<EditWagerBloc>()),
        BlocProvider<PlaceBetslibBloc>(
            create: (_) => getIt<PlaceBetslibBloc>()),
        BlocProvider<BetslipsBloc>(
            create: (_) => getIt<BetslipsBloc>()
              ..add(const BetslipsEvent.fetchBetslips())),
        BlocProvider<ConfigurationBloc>(
          create: (_) => getIt<ConfigurationBloc>(),
        ),
        BlocProvider<SignUpBloc>(
          create: (_) => getIt<SignUpBloc>(),
        ),
        BlocProvider<HomeBannerBloc>(
          create: (_) => HomeBannerBloc(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: appRouter.delegate(initialRoutes: [
              if (!LocalStorage.getBool(ONBOARDING_DONE))
                const OnboardingBuilderRoute(),
              if (LocalStorage.getString(Freeplay_User) != null &&
                  LocalStorage.getString(SHARED_PREFS_ACCESS_TOKEN) != null)
                const HomePageRoute()
              else
                const AuthPageRoute()
            ]),
            routeInformationParser: appRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }


  void getPUBConfiguration() async {
    try {
      final response = await AppDio().getRequest(
        path: 'pub-configuration',
      );
      if (response.statusCode == 200) {
        var jsonList = publicConfiguration.fromJson(response.data);
        LocalStorage.setPublicConfiguration(PUBLICCONFURATION, jsonList);
      }
    } catch (e) {
      print(e);
    }
  }
}
