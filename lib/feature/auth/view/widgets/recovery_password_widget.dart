import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';

import '../../../../core/design/colors.dart';

class RecoveryPasswordWidget extends StatelessWidget {
  final String title;
  final Widget textField;
  final Function onTap;

  const RecoveryPasswordWidget(
      {super.key,
      required this.title,
      required this.textField,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: basycStyle.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 32.sp,
            ),
          ),
          SizedBox(height: 12.h,),
          textField,
          SizedBox(height: 12.h,),
          AppElevatedButton(
            title: 'Submit',
            function: () => onTap(),
          ),
        ],
      ),
    );
  }
}