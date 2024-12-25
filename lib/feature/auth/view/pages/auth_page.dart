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
        (await rootBundle.load('assets/images/auth/auth_bg.png'))
            .buffer
            .asUint8List();
    setState(() => imageData = data);
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
          if (state.logged == true) {
            context.router.navigate(const HomePageRoute());
            // context.router.replace(const HomePageRoute());
          }
        }, builder: (context, state) {
          if (state.isLoading) {
            return const AppLoading();
          }
          return Scaffold(
            backgroundColor: AppColors.darkNaviBlue,
            body: imageData == null
                ? const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.red),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(child: SizedBox()),
                            /*const GradientText(
                              'Risk free sports betting',
                              style: TextStyle(fontSize: 28,color: AppColors.red),
                              gradient:LinearGradient(colors: [
                                Color.fromRGBO(189, 11, 49,1.0),
                                Color.fromRGBO(189, 11, 49,1.0),
                                Color.fromRGBO(189, 11, 49,1.0)
                              ]) *//*LinearGradient(colors: [
                                Color.fromRGBO(181, 56, 244,1.0),
                                Color.fromRGBO(139, 59, 232,1.0),
                                Color.fromRGBO(177, 56, 243,1.0)
                              ])189, 11, 49*//*,
                            ),*/
                            // Image.asset(
                            //   'assets/images/app_logo/freeplay_logo.png',
                            //   height: 23.h,
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            /*Text(
                              'Welcome to  5 Monkey Games',
                              style: AppTextStyle.titleL,
                            ),*/
                            /*Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 40),
                              child: Text(
                                'People all over the world are fond of sports and sport games.',
                                style: AppTextStyle.subtitle.copyWith(
                                  color: AppColors.red,
                                ),
                              ),
                            ),*/
                            SizedBox(
                              height: 50.h,
                            ),
                            AppElevatedButton2(
                              title: 'Register',
                              function: () {
                                context.router.push(AuthBuilderRoute(
                                    authStatus: Auth.register));
                              },
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            AppOutlineButton2(
                              title: 'Login',
                              backgroundColor: Colors.transparent,
                              borderColor: AppColors.red,
                              function: () {
                                context.router.push(
                                    AuthBuilderRoute(authStatus: Auth.login));
                              },
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            if (showButton)
                              AppOutlineButton(
                                title: 'Continue as Guest',
                                backgroundColor: Colors.transparent,
                                borderColor: AppColors.red,
                                function: () {
                                  BlocProvider.of<LoginBloc>(context).add(const LoginEvent.loginAsGuest());
                                },
                              ),
                            SizedBox(
                              height: showButton ? 40.h : 0.h,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                          ],
                        ),
                      ),
                    )),
          );
        }));
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
