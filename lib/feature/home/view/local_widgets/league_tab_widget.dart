import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/league/league.dart';

class LeagueTabWidget extends StatelessWidget {
  const LeagueTabWidget({
    super.key,
    required this.league,
    required this.onTap,
    required this.isActive,
  });
  final League league;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? null : onTap,
      child: SizedBox(
        height: 66.w,
        child: Stack(
          children: [
            Container(
              height: 64.w,
              width: 64.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.darkNaviBlue,
              ),
              alignment: Alignment.center,
              child: Text(
                league.abbreviation,
                style: AppTextStyle.semiBold16.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              // TODO(max): change it to icon or image
              // child: SvgPicture.asset(
              //   'assets/icons/default.svg',
              //   fit: BoxFit.fill,
              //   color: AppColors.red,
              // ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  width: 24.w,
                  height: 4.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:
                        isActive ? AppColors.red : Colors.transparent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
