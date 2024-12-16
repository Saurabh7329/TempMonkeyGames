import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/betslip/bloc/betslips_bloc/betslips_bloc.dart';
import 'package:freeplay/feature/betslip/bloc/bloc/edit_wager_bloc.dart';
import 'package:freeplay/feature/common/spacers/column_spacer.dart';
import 'package:freeplay/feature/common/spacers/row_spacer.dart';

import '../../../home/view/local_widgets/balance_text_widget.dart';
import '../../../home/view/local_widgets/team_name_initial_round_logo_widget.dart';


class WagerCardWidget extends StatelessWidget {
  const WagerCardWidget({
    Key? key,
    required this.wager,
  }) : super(key: key);
  final Wager wager;

  @override
  Widget build(BuildContext context) {
    late List<String> teams;
    if (wager.game.summary.contains('@')) {
      teams = wager.game.summary.split(' @ ');
    } else {
      teams = wager.game.summary.split(' vs ');
    }
    final home = teams[0];
    final away = teams[1];
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            top: 8.w,
            right: 8.w,
          ),
          padding: EdgeInsets.only(
            top: 16.w,
            bottom: 14.w,
            right: 16.w,
            left: 16.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.lightNaviBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wager.game.status.toUpperCase(),
                style: AppTextStyle.titleSplus.copyWith(
                  color: AppColors.red,
                ),
              ),
              ColumnSpacer(15.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            color: AppColors.darkNaviBlue,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              home.isNotEmpty
                                  ? TeamNameInitialLogoWidget(
                                name: home,
                                height: 56.w,
                                width: 56.w,
                              )
                                  : Container(
                                height: 56.w,
                                width: 56.w,
                                decoration: const BoxDecoration(
                                  color: AppColors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              ColumnSpacer(12.w),
                              Text(
                                home,
                                style: AppTextStyle.semibold12.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const RowSpacer(3),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            color: AppColors.darkNaviBlue,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              away.isNotEmpty
                                  ? TeamNameInitialLogoWidget(name: away,height: 56.w,width: 56.w,)
                                  : Container(
                                height: 56.w,
                                width: 56.w,
                                decoration: const BoxDecoration(
                                  color: AppColors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              ColumnSpacer(12.w),
                              Text(
                                away,
                                style: AppTextStyle.semibold12.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 32.w,
                    width: 32.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.lightNaviBlue,
                        width: 3,
                      ),
                      color: AppColors.red,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'VS',
                      style: AppTextStyle.semibold12.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNaviBlue,
                      ),
                    ),
                  ),
                ],
              ),
              ColumnSpacer(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    wager.team.name,
                    style: AppTextStyle.bold14.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    wager.oddsType[0].toUpperCase() + wager.oddsType.substring(1),
                    style: AppTextStyle.menu.copyWith(
                      color: AppColors.greyMediumColor,
                    ),
                  ),
                  Text(
                    '${wager.oddsSelection}',
                    style: AppTextStyle.veryBold14.copyWith(
                      color: AppColors.red,
                    ),
                  ),

                ],
              ),
              ColumnSpacer(8.h),
              const Divider(
                height: 1,
                color: AppColors.lightNaviBlue,
              ),
              ColumnSpacer(8.h),
              Text(
                'Plays on ${wager.game.localGameDate.formatTime()} ${wager.game.localDetails.abbreviation}',
                style: AppTextStyle.menu.copyWith(
                  color: AppColors.greyMediumColor,
                ),
              ),
              ColumnSpacer(11.h),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColumnSpacer(10.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: 12.h,
                                  bottom: 12.h,
                                  right: 16.w,
                                  left: 16.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: AppColors.lightNaviBlue,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      left: 0,
                                      child: Text(
                                        'Risk',
                                        style: AppTextStyle.bodyXS.copyWith(
                                          color: AppColors.purpleLightColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 30.h),
                                      child: BalanceTextWidget(prefix: " ", amount: "${wager.amount}"),
                                    ),
                                    /*Text(
                                      'C ${wager.amount}',
                                      style: AppTextStyle.veryBold14.copyWith(
                                        color: AppColors.greyMediumColor,
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ColumnSpacer(8.w),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 12.h,
                                bottom: 12.h,
                                right: 16.w,
                                left: 16.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: AppColors.lightNaviBlue,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Risk',
                                      style: AppTextStyle.bodyXS.copyWith(
                                        color: AppColors.purpleLightColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child:BalanceTextWidget(prefix: " ", amount: "${wager.amount}"),
                                    /*Text(
                                      'C ${wager.amount}',
                                      style: AppTextStyle.veryBold14.copyWith(
                                        color: AppColors.greyMediumColor,
                                      ),
                                    ),*/
                                  ),
                                ],
                              ),
                            ),
                          ),
                          RowSpacer(10.w),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 12.h,
                                bottom: 12.h,
                                right: 16.w,
                                left: 16.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: AppColors.lightNaviBlue,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Win',
                                      style: AppTextStyle.bodyXS.copyWith(
                                        color: AppColors.purpleLightColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: BalanceTextWidget(prefix: " ", amount: "${wager.toWin.round()}"),
                                    /*Text(
                                      'C ${wager.toWin.round()}',
                                      // calcPayout(
                                      //   value: amount,
                                      //   valueForHundred: payoutForHundred ?? 0,
                                      // ),
                                      style: AppTextStyle.veryBold14.copyWith(
                                        color: AppColors.greyMediumColor,
                                      ),
                                    ),*/
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}