import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/common/spacers/column_spacer.dart';
import 'package:freeplay/feature/home/bloc/wager_bloc/wager_bloc.dart';

class WagerBottomSheet {
  static Future<bool?> show(BuildContext context) async {
    return showModalBottomSheet<bool?>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -12),
                blurRadius: 12,
                spreadRadius: -6,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
            color: AppColors.lightNaviBlue,
          ),
          child: BlocBuilder<WagerBloc, WagerState>(
            builder: (context, state) {
              final team = state.team == 'home'
                  ? state.game?.teams.home.name
                  : state.game?.teams.away.name;
              final value = state.team == 'home'
                  ? state.game?.odds?.moneyline?.current.homeOdds
                  : state.game?.odds?.moneyline?.current.awayOdds;
              return Padding(
                padding: EdgeInsets.only(
                  top: 16.h,
                  bottom: 24.h,
                  left: 20.w,
                  right: 20.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          team ?? '',
                          style: AppTextStyle.body.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          (value ?? 0).isNegative ? '$value' : '+$value',
                          style: AppTextStyle.body.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Winner',
                      style: AppTextStyle.body.copyWith(
                        color: AppColors.purpleLightColor,
                      ),
                    ),
                    ColumnSpacer(10.h),
                    const TextField(),
                    ColumnSpacer(8.w),
                    AppElevatedButton(
                      title: 'Place a Wager',
                      function: () {},
                    ),
                    ColumnSpacer(24.w),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
