import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/feature/common/buttons/app_text_button.dart';

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
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: AppTextStyle.semiBold16,
      ),
      content: Text('Are you sure?'),
      actions: <Widget>[
        CupertinoDialogAction(
          textStyle: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
          },
          child: Text('Cancel'),
        ),
        CupertinoDialogAction(
          // isDestructiveAction: true,
          textStyle: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
            // Add logout logic here
            print('User logged out');
            confirm();
          },
          child: Text(action),
        ),
      ],
    );
  }
}


/*
return CupertinoAlertDialog(
        title: Text(
          title,
          style: AppTextStyle.semiBold16,
        ),
        content: Text(
          'Are you sure?',
          style: AppTextStyle.bodyXS,
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
      );
 */