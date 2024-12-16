import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';

class EmptyContestCard extends StatelessWidget {
  const EmptyContestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [4, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
        color: AppColors.lightNaviBlue,
        strokeWidth: 2,
        child: Container(
          height: 120.h,
          decoration: BoxDecoration(
            color: AppColors.lightNaviBlue,
            borderRadius: BorderRadius.circular(8),
          ),
        ));
  }
}
