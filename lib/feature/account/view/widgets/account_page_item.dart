import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';

class AccountPageItem extends StatelessWidget {
  final bool isTop;
  final bool isBottom;
  final String title;
  final Function onTap;
  final String? subTitle;
  const AccountPageItem(
      {super.key,
      this.isTop = false,
      this.isBottom = false,
      required this.title,
      required this.onTap,
      this.subTitle});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const roundRadius = Radius.circular(8);
    const squareRadius = Radius.zero;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => onTap(),
        child: Container(
          width: size.width * 0.9,
          height: 50.h,
          decoration: BoxDecoration(
              color: AppColors.lightgrey,
              borderRadius: BorderRadius.vertical(
                  top: isTop ? roundRadius : squareRadius,
                  bottom: isBottom ? roundRadius : squareRadius)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: title,
                    style: AppTextStyle.bold14
                        .copyWith(color: AppColors.black),
                    children: subTitle != null
                        ? <TextSpan>[
                            TextSpan(
                              text: ' $subTitle',
                              style: AppTextStyle.semibold12
                                  .copyWith(color: AppColors.red),
                            ),
                          ]
                        : null,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/arrow_right.svg',
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
