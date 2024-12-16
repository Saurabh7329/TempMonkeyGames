import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String description;
  const NotificationWidget({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: basycStyle.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp),),
            SizedBox(height: 8.h,),
            Text(description, style: AppTextStyle.bold14.copyWith(color: AppColors.black),)
          ],
        ),
      ),
    );
  }
}
