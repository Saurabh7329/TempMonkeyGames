import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';

class AppTextButton extends StatelessWidget {
  final Function function;
  final String text;
  final TextStyle? style;
  const AppTextButton({Key? key, required this.function, required this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: () => function(),
        child: Text(text,
            style: style?.copyWith(color: AppColors.red) ?? AppTextStyle.body.copyWith(
              color: AppColors.red,
              
            )));
  }
}
