import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';

class AppElevatedButton2 extends StatelessWidget {
  final String title;
  final VoidCallback function;
  final bool? isDisabled;
  final bool hasGradient;

  const AppElevatedButton2({
    Key? key,
    required this.title,
    required this.function,
    this.isDisabled,
    this.hasGradient = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: (isDisabled ?? false) ? AppColors.greyMediumColor : null,
            borderRadius: BorderRadius.circular(40.r),
            gradient: (isDisabled ?? false)
                ? null
                : hasGradient ? const RadialGradient(
                    radius: 3,
                    colors: [
                      AppColors.red,
                      AppColors.red,
                    ],
                  ) : const RadialGradient(
              radius: 3,
              colors: [
                AppColors.signupRegisterColor,
                AppColors.signupRegisterColor,
              ],
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(40.r),
            onTap: (isDisabled ?? false) ? null : function,
            child: Center(
                child: Text(
              title,
              style: AppTextStyle.veryBold14.copyWith(fontSize: 16.sp),
            )),
          ),
        ),
      ),
    );
  }
}