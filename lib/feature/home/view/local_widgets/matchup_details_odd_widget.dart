import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/common/spacers/column_spacer.dart';
import 'package:freeplay/feature/common/spacers/row_spacer.dart';

import 'balance_text_widget.dart';
import 'balance_text_widget2.dart';

class MatchupDetailsOddWidget extends StatelessWidget {
  const MatchupDetailsOddWidget({
    Key? key,
    required this.type,
    required this.game,
    required this.isHomeActive,
    required this.isAwayActive,
    required this.onHomeTap,
    required this.onAwayTap,
    required this.onInfoTap
  }) : super(key: key);
  final String type;
  final Game game;
  final bool isHomeActive;
  final bool isAwayActive;
  final VoidCallback onHomeTap;
  final VoidCallback onAwayTap;
  final VoidCallback onInfoTap;

  String homeOdd() {
    switch (type) {
      case 'spread':
        final a = game.odds!.spread!.current.home;
        final a1 = a.isNegative ? '$a%' : '+$a%';
        final b = game.odds!.spread!.current.homeOdds;
        final b1 = b.isNegative ? '$b' : '+$b';
        return '$a1 $b1';
      case 'moneyline':
        final val = game.odds!.moneyline!.current.homeOdds;
        return val.isNegative ? '$val' : '+$val';
      case 'total':
        final a1 = '↑${game.odds!.total!.current.total}';
        final b = game.odds!.total!.current.overOdds;
        final b1 = b.isNegative ? '$b' : '+$b';
        return '$a1 $b1';
      default:
        return '';
    }
  }

  String awayOdd() {
    switch (type) {
      case 'spread':
        final a = game.odds!.spread!.current.away;
        final a1 = a.isNegative ? '$a%' : '+$a%';
        final b = game.odds!.spread!.current.awayOdds;
        final b1 = b.isNegative ? '$b' : '+$b';
        return '$a1 $b1';
      case 'moneyline':
        final val = game.odds!.moneyline!.current.awayOdds;
        return val.isNegative ? '$val' : '+$val';
      case 'total':
        final a1 = '↓${game.odds!.total!.current.total}';
        final b = game.odds!.total!.current.underOdds;
        final b1 = b.isNegative ? '$b' : '+$b';
        return '$a1 $b1';
      default:
        return '';
    }
  }

  String homePayout() {
    switch (type) {
      case 'spread':
        final val = game.odds!.spread!.current.homeOddsPayout.round();
        return '$val';
      case 'moneyline':
        final val = game.odds!.moneyline!.current.homeOddsPayout.round();
        return '$val';
      case 'total':
        final val = game.odds!.total!.current.overOddsPayout.round();
        return '$val';
      default:
        return '';
    }
  }

  String awayPayout() {
    switch (type) {
      case 'spread':
        final val = game.odds!.spread!.current.homeOddsPayout.round();
        return '$val';
      case 'moneyline':
        final val = game.odds!.moneyline!.current.awayOddsPayout.round();
        return '$val';
      case 'total':
        final val = game.odds!.total!.current.underOddsPayout.round();
        return '$val';
      default:
        return '';
    }
  }

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                type.capitalize(),
                style: AppTextStyle.bold14.copyWith(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: 8.0),
              GestureDetector(
                onTap: onInfoTap,
                child: const Icon(
                  Icons.info_outline_rounded, // Replace 'your_icon' with the icon you want to use
                  color: AppColors.black, // Set the color of the icon
                ),
              ),
            ],
          ),
          ColumnSpacer(8.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: onHomeTap,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 12.h,
                          bottom: 14.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.lightNaviBlue,
                          border: Border.all(
                            width: 2,
                            color: isHomeActive
                                ? AppColors.red
                                : AppColors.lightNaviBlue,
                          ),
                        ),
                        alignment: Alignment.center,
                        // child:  BalanceTextWidget(prefix: "", amount: homeOdd())
                        child: Text(
                          homeOdd(),
                          style: AppTextStyle.bold14.copyWith(
                            color: AppColors.whities,
                          ),
                        ),
                      ),
                    ),
                    ColumnSpacer(2.h),
                    BalanceTextWidget2(prefix: " ", amount: homePayout()),
                    // Text(
                    // homePayout(),
                    //   style: AppTextStyle.bold14.copyWith(
                    //     color: AppColors.greyMediumColor,
                    //   ),
                    // ),
                  ],
                ),
              ),
              RowSpacer(16.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: onAwayTap,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 12.h,
                          bottom: 14.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.lightNaviBlue,
                          border: Border.all(
                            width: 2,
                            color: isAwayActive
                                ? AppColors.red
                                : AppColors.lightNaviBlue,
                          ),
                        ),
                        alignment: Alignment.center,
                        // child:  BalanceTextWidget(prefix: "", amount: awayOdd()),
                        child: Text(
                          awayOdd(),
                          style: AppTextStyle.bold14.copyWith(
                            color: AppColors.whities,
                          ),
                        ),
                      ),
                    ),
                    ColumnSpacer(2.h),
                    BalanceTextWidget2(prefix: " ", amount: awayPayout()),
                    // Text(
                    //   awayPayout(),
                    //   style: AppTextStyle.bold14.copyWith(
                    //     color: AppColors.greyMediumColor,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
