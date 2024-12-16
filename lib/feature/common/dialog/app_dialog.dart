import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/feature/common/buttons/app_text_button.dart';

import '../../../core/design/colors.dart';

class AppDialog extends StatelessWidget {
  final String action;
  final String title;
  final Function confirm;
  final BuildContext dialogContext;
  const AppDialog(
      {super.key,
      required this.action,
      required this.title,
      required this.confirm, required this.dialogContext});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: Text(
          title,
          style: AppTextStyle.semiBold16,
        ),
        content: Text(
          'Are you sure?',
          style: basycStyle.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
          ),
        ),
        actions: <Widget>[
          AppTextButton(
            text: 'Cancel',
            function: () {
              Navigator.pop(dialogContext);
            },
          ),
          AppTextButton(
            text: action,
            function: () {
              Navigator.pop(dialogContext);
               confirm();}
          ),
        ],
      ),
    );
  }
}
