import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/feature/betslip/view/pages/betslip_view.dart';
import 'package:freeplay/feature/home/view/local_widgets/popover_widget.dart';
import 'package:freeplay/feature/home/view/local_widgets/team_name_initial_round_logo_widget.dart';
import 'package:freeplay/feature/home/view/pages/home_page.dart';
import 'package:popover/popover.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/common/spacers/column_spacer.dart';
import 'package:freeplay/feature/common/spacers/row_spacer.dart';
import 'package:freeplay/feature/home/bloc/match_details_wager_bloc/match_details_wager_bloc.dart';
import 'package:freeplay/feature/home/view/local_widgets/matchup_details_odd_widget.dart';

import '../../local_widgets/balance_text_widget.dart';

part 'teams.dart';

part 'info.dart';

part 'panel.dart';

class MatchDetailsPage extends StatefulWidget {
  final Game game;

  const MatchDetailsPage({Key? key, required this.game}) : super(key: key);

  @override
  State<MatchDetailsPage> createState() => _MatchDetailsPageState();
}

class _MatchDetailsPageState extends State<MatchDetailsPage> {
  late PanelController _panelController;

  @override
  void initState() {
    super.initState();
    _panelController = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whities,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightNaviBlue,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context
              ..router.navigateBack()
              ..read<MatchDetailsWagerBloc>()
                  .add(const MatchDetailsWagerEvent.stop());
          },
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          'Matchup Details',
          style: AppTextStyle.titleS.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
      body: BlocBuilder<MatchDetailsWagerBloc, MatchDetailsWagerState>(
        builder: (context, state) {
          final isActive = state.isActive;
          final team = state.team;
          final type = state.wagerType;
          return SlidingUpPanel(
            controller: _panelController,
            color: AppColors.lightgrey,
            maxHeight: 150.h,
            minHeight: 0,
            onPanelClosed: () {
              context
                  .read<MatchDetailsWagerBloc>()
                  .add(const MatchDetailsWagerEvent.stop());
            },
            body: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 16.h,
                right: 20.w,
                left: 20.w,
                bottom: kToolbarHeight * 2,
              ),
              child: Container(
                padding: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lightgrey,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _Teams(
                      home: widget.game.teams.home.name,
                      away: widget.game.teams.away.name,
                    ),
                    _Info(
                      league: widget.game.teams.away.conference,
                      time: widget.game.localGameDate,
                    ),
                    ColumnSpacer(16.h),
                    if (widget.game.odds?.moneyline != null)
                      _moneyline(isActive, type, team, context),
                    if (widget.game.odds?.spread != null)
                      _spread(isActive, type, team, context),
                    if (widget.game.odds?.total != null)
                      _total(isActive, type, team, context),
                    Container(
                      width: double.infinity, // Full width
                      height: MediaQuery.of(context).size.height / 3, // Fixed height
                      color: Colors.transparent, // Background color
                    ),
                  ],
                ),
              ),
            ),
            panel: _Panel(gameID: widget.game.id),
          );
        },
      ),
    );
  }

  Column _total(
    bool isActive,
    String type,
    String team,
    BuildContext context,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ColumnSpacer(8.h),
        const Divider(
          color: AppColors.whities,
          height: 1,
        ),
        ColumnSpacer(8.h),
        MatchupDetailsOddWidget(
          type: 'total',
          game: widget.game,
          isHomeActive: isActive && type.isTotal && team.isOver,
          isAwayActive: isActive && type.isTotal && team.isUnder,
          onHomeTap: () async {
            if (_panelController.isPanelOpen) {
              await _panelController.close();
            }
            context.read<MatchDetailsWagerBloc>().add(
                  const MatchDetailsWagerEvent.start(
                    wagerType: 'total',
                    team: 'over',
                  ),
                );
            _panelController.open();
          },
          onAwayTap: () async {
            if (_panelController.isPanelOpen) {
              await _panelController.close();
            }
            context.read<MatchDetailsWagerBloc>().add(
                  const MatchDetailsWagerEvent.start(
                    wagerType: 'total',
                    team: 'under',
                  ),
                );
            _panelController.open();
          },
          onInfoTap: () {
            String? total = LocalStorage.getConfiguration(CONFIGURATION)
                ?.data
                .info
                .total
                .text;
            /*showPopover(
              context: context,
              bodyBuilder: (context) => PopOverWidget(contentText:total ??
                  "A totals wager is when you are presented with a number of points the oddsmakers believe will be scored in the game."),
              onPop: () => print('Popover was popped!'),
              direction: PopoverDirection.bottom,
              arrowHeight: 15,
              arrowWidth: 30,
            );*/

            _showBottomSheet(
                context,
                total ??
                    "A totals wager is when you are presented with a number of points the oddsmakers believe will be scored in the game.");
          },
        ),
      ],
    );
  }

  Column _spread(
    bool isActive,
    String type,
    String team,
    BuildContext context,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ColumnSpacer(8.h),
        const Divider(
          color: AppColors.whities,
          height: 1,
        ),
        ColumnSpacer(8.h),
        MatchupDetailsOddWidget(
          type: 'spread',
          game: widget.game,
          isHomeActive: isActive && type.isSpread && team.isHome,
          isAwayActive: isActive && type.isSpread && team.isAway,
          onHomeTap: () async {
            if (_panelController.isPanelOpen) {
              await _panelController.close();
            }
            context.read<MatchDetailsWagerBloc>().add(
                  const MatchDetailsWagerEvent.start(
                    wagerType: 'spread',
                    team: 'home',
                  ),
                );
            _panelController.open();
          },
          onAwayTap: () async {
            if (_panelController.isPanelOpen) {
              await _panelController.close();
            }
            context.read<MatchDetailsWagerBloc>().add(
                  const MatchDetailsWagerEvent.start(
                    wagerType: 'spread',
                    team: 'away',
                  ),
                );
            _panelController.open();
          },
          onInfoTap: () {
            String? spread = LocalStorage.getConfiguration(CONFIGURATION)
                ?.data
                .info
                .spread
                .text;
            _showBottomSheet(
                context,
                spread ??
                    "Point spreads are a bookmakers way of evening out to mismatched teams.");
          },
        ),
      ],
    );
  }

  MatchupDetailsOddWidget _moneyline(
    bool isActive,
    String type,
    String team,
    BuildContext context,
  ) {
    return MatchupDetailsOddWidget(
      type: 'moneyline',
      game: widget.game,
      isHomeActive: isActive && type.isMoneyline && team.isHome,
      isAwayActive: isActive && type.isMoneyline && team.isAway,
      onHomeTap: () async {
        if (_panelController.isPanelOpen) {
          await _panelController.close();
        }
        context.read<MatchDetailsWagerBloc>().add(
              const MatchDetailsWagerEvent.start(
                wagerType: 'moneyline',
                team: 'home',
              ),
            );
        _panelController.open();
      },
      onAwayTap: () async {
        if (_panelController.isPanelOpen) {
          await _panelController.close();
        }
        context.read<MatchDetailsWagerBloc>().add(
              const MatchDetailsWagerEvent.start(
                wagerType: 'moneyline',
                team: 'away',
              ),
            );
        _panelController.open();
      },
      onInfoTap: () {
        String? moneyLine =
            LocalStorage.getConfiguration(CONFIGURATION)?.data.info.moneyline.text;
        /*showPopover(
          context: context,
          bodyBuilder: (context) => PopOverWidget(contentText:moneyLine ??
              "The moneyline is a bet on which team you think will win straight up."),
          direction: PopoverDirection.bottom,
          arrowHeight: 15,
          arrowWidth: 15,
        );*/
        _showBottomSheet(
            context,
            moneyLine ??
                "The moneyline is a bet on which team you think will win straight up.");
      },
    );
  }

  void _showBottomSheet(BuildContext context, String note) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 8),
                child: Text(
                  note,
                  style: AppTextStyle.bold14.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(64, 0, 64, 48),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            4.0), // Adjust the value as needed
                      ),
                      backgroundColor: AppColors.red),
                  child: Text(
                    'Close',
                    style: AppTextStyle.semibold12
                        .copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
