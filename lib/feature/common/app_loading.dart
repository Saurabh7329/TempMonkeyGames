import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';

class AppLoading extends StatelessWidget{
  final String? title;
  const AppLoading({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicAppWidget(
      showBack: false,
      title: title,
      content: const Center(child: CircularProgressIndicator(color: AppColors.red),),
    );
  }

}