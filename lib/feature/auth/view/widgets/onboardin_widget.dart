import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';

class OnboardingWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const OnboardingWidget(
      {super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 200.h,
              decoration: const BoxDecoration(
                  color: AppColors.lightNaviBlue,
                  shape: BoxShape.circle)),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "" /*title ?? 'Welcome to  5 monkey games'*/,
            style: AppTextStyle.titleM,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(subTitle ?? 'People all over the world are fond of sports and sport games. Sport makes people healthy, more organized and better disciplined.',
              textAlign: TextAlign.center,
              style: AppTextStyle.subtitle
                  .copyWith(color: AppColors.purpleLightColor))
        ],
      ),
    );
  }
}