import 'package:flutter/material.dart';

class AppColors {
  static const Color whiteColor = Colors.white;
  static const Color purpleLightColor = Color(0xff9DA3CC);
  static const Color purpleGreyDarkColor = Color(0xff686C87);
  static const Color greyMediumColor = Color(0xff9A9BB1);
  static const Color greyDarkColor = Color(0xff999CA0);
  static const Color greyLightColor = Color(0xffF5F5F5);
  static const Color gardientDarkColor = Color(0xff8B3BE7);
  static const Color gardientLightColor = Color(0xffBB38F6);
  static const Color purpleDarkColor = Color(0xff4E46B4);
  static const Color floatingColor = Color(0xffffffff);
  static const Color signupBackgroundColor = Color(0xFF18191B);
  static const Color signupLightBackgroundColor = Color(0xFF282B2D);
  static const Color signupRegisterColor = Color(0xFFE5B362);


  static const Color darkNaviBlue = Color(0xFF002768);
  static const Color lightNaviBlue = Color(0xFF184590);
  static const Color red = Color(0xFFBD0B31);
  static const Color grey = Color(0xFF65656E);
  static const Color lightgrey = Color(0xFFE4E5E9);
  static const Color whities = Color(0xFFFCFCFC);
  static const Color black = Color(0xFF151516);
  static const Color blue = Color(0xFF0A12F8);
  static const Color light = Color(0xFFF6F6F6);

  final Shader gradient = const RadialGradient(radius: 3, colors: [
    AppColors.gardientDarkColor,
    AppColors.gardientLightColor,
  ]).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
