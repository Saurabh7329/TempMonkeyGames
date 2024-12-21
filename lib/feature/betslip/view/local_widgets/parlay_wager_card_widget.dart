import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/common/spacers/column_spacer.dart';
import 'package:freeplay/feature/common/spacers/row_spacer.dart';

import '../../../home/view/local_widgets/team_name_initial_round_logo_widget.dart';

class ParlayWagerCardWidget extends StatelessWidget {
  const ParlayWagerCardWidget({
    Key? key,
    required this.wager,
    required this.onDelete,
  }) : super(key: key);
  final Wager wager;
  final VoidCallback onDelete;

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
            top: 5.w,
            right: 5.w,
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: [
                      /*Expanded(
                        child: */Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 150,
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
                    //  ),
                      const RowSpacer(3),
                     /* Expanded(
                        child:*/ Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 150,
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
                                  ? TeamNameInitialLogoWidget(name: away,height: 56.w,width: 56.w)
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
                     // ),
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
              // ColumnSpacer(2.h),
              // Text(
              //   wager.oddsType[0].toUpperCase() + wager.oddsType.substring(1),
              //   style: AppTextStyle.menu.copyWith(
              //     color: AppColors.greyMediumColor,
              //   ),
              // ),
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
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: onDelete,
            child: Container(
              height: 32.w,
              width: 32.w,
              decoration: BoxDecoration(
                color: AppColors.darkNaviBlue,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2.w,
                  color: AppColors.lightNaviBlue,
                ),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.close,
                size: 20.w,
                color: AppColors.whities,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
