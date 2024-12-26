import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/feature/common/buttons/app_text_button2.dart';

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
    return AlertDialog(
      backgroundColor: AppColors.greyDarkColor,
      title: Text(
        title,
        style: basycStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.whities
        ),
      ),
      content: Text(
        'Are you sure?',
        style: basycStyle.copyWith(
          color: AppColors.whities,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
        ),
      ),
      actions: <Widget>[
        /*TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('OK'),
        ),*/
        AppTextButton2(
          text: 'Cancel',
          function: () {
            Navigator.pop(dialogContext);
          },
        ),
        AppTextButton2(
            text: action,
            function: () {
              Navigator.pop(dialogContext);
              confirm();}
        ),
      ],
    ); /* CupertinoAlertDialog(
        title: Text(
          title,
          style: basycStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.whities
          ),
        ),
        content: Text(
          'Are you sure?',
          style: basycStyle.copyWith(
            color: AppColors.whities,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
          ),
        ),
        actions: <Widget>[
          AppTextButton2(
            text: 'Cancel',
            function: () {
              Navigator.pop(dialogContext);
            },
          ),
          AppTextButton2(
            text: action,
            function: () {
              Navigator.pop(dialogContext);
               confirm();}
          ),
        ],

    )*/;
  }
}
