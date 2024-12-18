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

class StraightWagerCardWidget extends StatelessWidget {
  const StraightWagerCardWidget({
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Flexible(
                                  child: Text(home,
                                      style: AppTextStyle.semibold12.copyWith(
                                        color: AppColors.whiteColor,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const RowSpacer(3),
                      Expanded(
                        child: Container(
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
                                  ? TeamNameInitialLogoWidget(
                                      name: away,
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
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Flexible(
                                    child: Text(away,
                                        style: AppTextStyle.semibold12.copyWith(
                                          color: AppColors.whiteColor,
                                        )),
                                  )),
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
                    wager.oddsType[0].toUpperCase() +
                        wager.oddsType.substring(1),
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
                color: AppColors.whities,
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
                                context
                                    .read<EditWagerBloc>()
                                    .add(const EditWagerEvent.start());
                                showEditor(context, wagerID: wager.id);
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
                                  color: AppColors.darkNaviBlue,
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
                                      padding: EdgeInsets.only(left: 20.h),
                                      child: BalanceTextWidget(
                                          prefix: " ",
                                          amount: "${wager.amount}"),
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
                                color: AppColors.darkNaviBlue,
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
                                    child: BalanceTextWidget(
                                        prefix: " ", amount: "${wager.amount}"),
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
                                color: AppColors.darkNaviBlue,
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
                                    child: BalanceTextWidget(
                                        prefix: " ",
                                        amount: "${wager.toWin.round()}"),
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

Future<void> showEditor(
  BuildContext context, {
  required int wagerID,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return BlocConsumer<EditWagerBloc, EditWagerState>(
        listener: (context, state) {
          state.whenOrNull(
              success: () => context
                  .read<BetslipsBloc>()
                  .add(const BetslipsEvent.refreshBetslips()),
              error: (message) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              });
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: state.maybeWhen(
                  initial: (value) {
                    final amount =
                        value.isEmpty ? 0 : double.parse(value).toInt();
                    return AlertDialog(
                      backgroundColor: AppColors.darkNaviBlue,
                      actionsAlignment: MainAxisAlignment.spaceAround,
                      content: TextField(
                        autofocus: true,
                        enabled: true,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.body.copyWith(
                          color: AppColors.purpleGreyDarkColor,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) => context
                            .read<EditWagerBloc>()
                            .add(EditWagerEvent.onChange(value)),
                        cursorColor: AppColors.red,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.lightNaviBlue,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.red),
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: AppTextStyle.body.copyWith(
                              color: AppColors.red,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (amount != 0) {
                              FocusScope.of(context).unfocus();
                              context.read<EditWagerBloc>().add(
                                    EditWagerEvent.edit(
                                      wagerID: wagerID,
                                      amount: amount,
                                    ),
                                  );
                            }
                          },
                          child: Text(
                            'Change',
                            style: AppTextStyle.body.copyWith(
                              color: AppColors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  loading: () {
                    return Container(
                      height: 100.w,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.darkNaviBlue,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.red,
                        ),
                      ),
                    );
                  },
                  success: () {
                    return Container(
                      height: 100.w,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.darkNaviBlue,
                      ),
                      child: Icon(
                        Icons.check,
                        size: 60.w,
                        color: AppColors.red,
                      ),
                    );
                  },
                  orElse: () => const SizedBox(),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
