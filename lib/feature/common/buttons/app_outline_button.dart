import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';

class AppOutlineButton extends StatelessWidget {
  final String title;
  final Function function;
  final Color borderColor;
  final Color backgroundColor;

  const AppOutlineButton(
      {Key? key,
      required this.title,
      required this.function,
      required this.borderColor,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(color: borderColor),
              color: backgroundColor
             ),
          child: InkWell(
            borderRadius: BorderRadius.circular(40.r),
            onTap: () => function(),
            child: Center(
                child: Text(
              title,
              style: AppTextStyle.body.copyWith(fontSize: 16.sp, color: borderColor),
            )),
          ),
        ),
      ),
    );
  }
}


class AppOutlineButton2 extends StatelessWidget {
  final String title;
  final Function function;
  final Color borderColor;
  final Color backgroundColor;

  const AppOutlineButton2(
      {Key? key,
        required this.title,
        required this.function,
        required this.borderColor,
        required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(color: borderColor),
              color: backgroundColor
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(40.r),
            onTap: () => function(),
            child: Center(
                child: Text(
                  title,
                  style: basycStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: borderColor
                  ),
                )),
          ),
        ),
      ),
    );
  }
}