import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/di/injections.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/common/spacers/column_spacer.dart';
import 'package:freeplay/feature/common/spacers/row_spacer.dart';
import 'package:freeplay/feature/home/bloc/leagues_bloc/leagues_bloc.dart';
import 'package:freeplay/feature/home/bloc/wager_bloc/wager_bloc.dart';
import 'package:freeplay/feature/home/view/local_widgets/team_name_initial_round_logo_widget.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GameCardWidget extends StatelessWidget {
  const GameCardWidget(this.game, {this.margin, Key? key}) : super(key: key);
  final Game game;
  final EdgeInsets? margin;
  static const message = "You can not put a wager the game is ongoing/done";

  bool checkDateValidation() {
    try {
      DateTime givenDate =
          DateFormat("yyyy-MM-dd HH:mm:ss").parse(game.localGameDate);

      DateTime now = DateTime.now();

      if (now.isAfter(givenDate) || now.isAtSameMomentAs(givenDate)) {
        return false;
      } else {
        return true;
      }
    } catch (_) {}
    return false;
  }

  bool isStartingWithinFifteenMinutes() {
    try {
      DateTime givenDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(game.localGameDate);
      DateTime now = DateTime.now();
      Duration difference = givenDate.difference(now);
      return difference.inMinutes <= 15 && difference.inMinutes > 0;
    } catch (_) {
      return false;
    }
  }

  bool isStartingToday() {
    try {
      DateTime givenDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(game.localGameDate);
      DateTime now = DateTime.now();

      // Extracting only the date part from the DateTime objects
      DateTime givenDateOnly = DateTime(givenDate.year, givenDate.month, givenDate.day);
      DateTime nowDateOnly = DateTime(now.year, now.month, now.day);

      // Checking if the dates are the same
      return givenDateOnly == nowDateOnly;
    } catch (_) {
      return false;
    }
  }

  Widget element({
    required String type,
    required double value,
    required bool isActive,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 14.w,
            horizontal: 8.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isActive
                  ? AppColors.red
                  : AppColors.lightNaviBlue,
              width: 2,
            ),
            color: AppColors.lightNaviBlue,
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  type,
                  style: AppTextStyle.bold14.copyWith(
                    color: AppColors.purpleLightColor,
                  ),
                ),
              ),
              RowSpacer(12.w),
              Center(
                child: Text(
                  value.isNegative ? '$value' : '+$value',
                  style: AppTextStyle.bold14.copyWith(
                    color: AppColors.whities,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(checkDateValidation()){
      return BlocBuilder<WagerBloc, WagerState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (checkDateValidation()) {
                context.router.push(MatchDetailsPageRoute(game: game));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red, // Customize the color if needed
                  ),
                );
              }
            },
            child: Container(
              margin: margin ?? EdgeInsets.zero,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.lightgrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'LEAGUE',
                        style: AppTextStyle.superBold10.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                      if (isStartingToday())
                        Text(
                          '• STARTING SOON',
                          style: AppTextStyle.superBold10.copyWith(
                            color: Colors.blue,
                          ),
                        ),
                    ],
                  ),
                  ColumnSpacer(4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<LeaguesBloc, LeaguesState>(
                        builder: (context, state) {
                          final league = state.leagues
                              .firstWhere((e) => e.id == game.leagueID);
                          return Text(
                            league.abbreviation,
                            style: AppTextStyle.semiBold16.copyWith(
                              color: AppColors.black,
                            ),
                          );
                        },
                      ),
                      Text(
                        game.localGameDate.formatTime(),
                        style: AppTextStyle.subtitle.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  ColumnSpacer(16.h),
                  Row(
                    children: [
                      game.teams.home.name.isNotEmpty
                          ? TeamNameInitialLogoWidget(
                              name: game.teams.home.name,
                              height: 26.w,
                              width: 26.w)
                          : Container(
                              height: 26.w,
                              width: 26.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.red,
                              ),
                            ),
                      RowSpacer(12.w),
                      Text(
                        game.teams.home.name,
                        style: AppTextStyle.body.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  ColumnSpacer(8.h),
                  Row(
                    children: [
                      game.teams.away.name.isNotEmpty
                          ? TeamNameInitialLogoWidget(
                              name: game.teams.away.name,
                              height: 26.w,
                              width: 26.w)
                          : Container(
                              height: 26.w,
                              width: 26.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.red,
                              ),
                            ),
                      RowSpacer(12.w),
                      Text(
                        game.teams.away.name,
                        style: AppTextStyle.body.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  ColumnSpacer(16.h),
                  Text(
                    "Money Line",
                    style: AppTextStyle.body.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  ColumnSpacer(8.h),
                  if (game.odds != null)
                    Row(
                      children: [
                        element(
                          type: '1x',
                          value: game.odds!.moneyline?.current.homeOdds ?? 0.0,
                          isActive: game == state.game &&
                              state.team == 'home' &&
                              state.isActive,
                          onTap: () async {
                            if (checkDateValidation()) {
                              final panelController = getIt<PanelController>();
                              if (panelController.isPanelOpen) {
                                await panelController.close();
                              }
                              context.read<WagerBloc>().add(
                                    WagerEvent.start(
                                      game: game,
                                      wagerType: 'moneyline',
                                      team: 'home',
                                    ),
                                  );
                              panelController.open();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(message),
                                  backgroundColor:
                                      Colors.red, // Customize the color if needed
                                ),
                              );
                            }
                          },
                        ),
                        RowSpacer(7.w),
                        // element(type: 'x', value: 00.0, isActive: false),
                        // RowSpacer(7.w),w
                        element(
                          type: '2x',
                          value: game.odds!.moneyline?.current.awayOdds ?? 0,
                          isActive: game == state.game &&
                              state.team == 'away' &&
                              state.isActive,
                          onTap: () async {
                            if (checkDateValidation()) {
                              final panelController = getIt<PanelController>();
                              if (panelController.isPanelOpen) {
                                await panelController.close();
                              }
                              context.read<WagerBloc>().add(
                                    WagerEvent.start(
                                      game: game,
                                      wagerType: 'moneyline',
                                      team: 'away',
                                    ),
                                  );
                              panelController.open();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(message),
                                  backgroundColor:
                                      Colors.red, // Customize the color if needed
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
          );
        },
      );
  }
  else {
    return SizedBox(height: 0.1,);
    }
  }
}
