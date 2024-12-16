import 'package:flutter/material.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const TextStyle basycStyle = TextStyle(fontFamily: 'Raleway');

class AppTextStyle {
  static TextStyle titleS = basycStyle.copyWith(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp);

  static TextStyle noDataBetSlip = basycStyle.copyWith(
      color: AppColors.purpleLightColor,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp);

  static TextStyle titleM = basycStyle.copyWith(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w600,
      fontSize: 24.sp);

  static TextStyle titleSplus = basycStyle.copyWith(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w600,
      fontSize: 18.sp);

  static TextStyle titleL = basycStyle.copyWith(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 32.sp,
  );

  static TextStyle titleXL = basycStyle.copyWith(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w800,
    fontSize: 60.sp,
    fontStyle: FontStyle.italic
  );

static TextStyle titleXXL = basycStyle.copyWith(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w900,
    fontSize: 64.sp
  );

  static TextStyle subtitle = basycStyle.copyWith(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  );

  static TextStyle body = basycStyle.copyWith(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );

  static TextStyle bodyXS = basycStyle.copyWith(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );

  static TextStyle bodyS = basycStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );

  static TextStyle menu = basycStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );

  static TextStyle superBold10 = basycStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 10.sp,
  );

  static TextStyle bodyXXS = basycStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
  );

  static TextStyle semiBold16 = basycStyle.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );

  static TextStyle bold14 = basycStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );

  static TextStyle veryBold14 = basycStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
  );

  static TextStyle semibold12 = basycStyle.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
  );

  static TextStyle regular12 = basycStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );

  static TextStyle veryBold22 = basycStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 22.sp,
  );
}
