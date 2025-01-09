import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/di/injections.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/auth/auth.dart';
import 'package:freeplay/feature/auth/bloc/login_bloc.dart';
import 'package:freeplay/feature/auth/view/pages/gradient_text.dart';
import 'package:freeplay/feature/common/app_loading.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button2.dart';
import 'package:freeplay/feature/common/buttons/app_outline_button.dart';

import '../../../../core/dio/app_dio.dart';
import '../../../../core/domain/configuration.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Uint8List? imageData;
  bool showButton = true;

  @override
  void initState() {
    super.initState();
    loadAsset();
    retriveFirebaseToken();
    var terms = LocalStorage.getPublicConfiguration(PUBLICCONFURATION);
    if (terms != null) {
      String guestUser = terms.data.guest_user.toLowerCase();
      print("guestUserguestUser :  $guestUser");
      if (guestUser == "true") {
        showButton = true;
      } else {
        showButton = false;
      }
    } else {
      getPUBConfiguration();
    }
  }

  void loadAsset() async {
    Uint8List data =
        (await rootBundle.load('assets/images/auth/login_bg.png'))
            .buffer
            .asUint8List();
    setState(() => imageData = data);
  }



  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.logged == true) {
            context.router.navigate(const HomePageRoute());
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const AppLoading();
          }
          return Scaffold(
            backgroundColor: AppColors.darkNaviBlue,
            body: imageData == null
                ? const Center(
              child: CircularProgressIndicator(color: AppColors.red),
            )
                : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(imageData!, scale: 0.5),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Align the logo at the top center
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Image.asset(
                            'assets/images/app_logo/freeplay_logo.png',
                            height: 120,
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      Text(
                        'Risk Free Sports Betting',
                        style: AppTextStyle.titleAuthXL,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'People all over the world are fond of sports and sport games.',
                        style: AppTextStyle.titleAuth,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 40),
                      AppElevatedButton2(
                        title: 'Register',
                        function: () {
                          context.router.push(
                            AuthBuilderRoute(authStatus: Auth.register),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      AppOutlineButton2(
                        title: 'Login',
                        backgroundColor: Colors.transparent,
                        borderColor: AppColors.red,
                        function: () {
                          context.router.push(
                            AuthBuilderRoute(authStatus: Auth.login),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      if (showButton)
                        AppOutlineButton(
                          title: 'Continue as Guest',
                          backgroundColor: Colors.transparent,
                          borderColor: AppColors.red,
                          function: () {
                            BlocProvider.of<LoginBloc>(context).add(
                              const LoginEvent.loginAsGuest(),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  Future<void> retriveFirebaseToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('token=============>$token');
  }

  void getPUBConfiguration() async {
    try {
      final response = await AppDio().getRequest(
        path: 'pub-configuration',
      );
      if (response.statusCode == 200) {
        var jsonList = publicConfiguration.fromJson(response.data);
        LocalStorage.setPublicConfiguration(PUBLICCONFURATION, jsonList);
        setState(() {
          var terms = LocalStorage.getPublicConfiguration(PUBLICCONFURATION);
          if (terms != null) {
            String guestUser = terms.data.guest_user.toLowerCase();
            print("guestUserguestUser :  $guestUser");
            if (guestUser == "true") {
              showButton = true;
            } else {
              showButton = false;
            }
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
