import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeplay/core/design/colors.dart';

import '../../../core/design/text_style/text_styles.dart';

class GradientTextButton extends StatelessWidget {
  final Function function;
  final String title;
  final Shader gradient = const RadialGradient(radius: 3, colors: [
    AppColors.red,
    AppColors.red,
  ]).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  GradientTextButton({Key? key, required this.function, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: () => function(),
        child: Text(title,
            style: AppTextStyle.bodyS.copyWith(
                foreground: Paint()..shader = gradient,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.red)));
  }
}


class GradientSignupTextButton extends StatelessWidget {
  final Function function;
  final String title;
  GradientSignupTextButton({Key? key, required this.function, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: () => function(),
        child: Text(title,
            style: AppTextStyle.bodyS.copyWith(
                color: AppColors.red,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.red)));
  }
}