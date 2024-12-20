import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/contest/contest.dart';
import 'package:freeplay/core/domain/leader/leader.dart';
import 'package:freeplay/core/domain/user/user.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/feature/account/view/pages/account_page.dart';
import 'package:freeplay/feature/auth/auth.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/common/buttons/app_outline_button.dart';
import 'package:freeplay/feature/contests/view/widgets/contest_card.dart';
import 'package:freeplay/feature/contests/view/widgets/leaderboard_widget.dart';
import 'package:intl/intl.dart';

import '../../../../core/route/router.dart';

class ContestDetailPage extends StatelessWidget {
  final Function back;
  final Function join;
  final Contest contest;
  final Leader? leader;
  final List<Leader> leaders;
  final Function loadMore;
  ContestDetailPage(
      {super.key,
      required this.back,
      required this.contest,
      this.leader,
      required this.join,
      required this.leaders,
      required this.loadMore});

  String parseDate(String date) {
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
  }

  final bool isGuest =
      User.fromJson(jsonDecode(LocalStorage.getString(Freeplay_User)!)).type ==
          UserType.guest.name;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContestCard(
            isFull: true,
            contest: contest,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Runs from ',
                        style: AppTextStyle.bodyS
                            .copyWith(color: AppColors.purpleLightColor)),
                    Text('Prize ',
                        style: AppTextStyle.bodyS
                            .copyWith(color: AppColors.purpleLightColor)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                          '${parseDate(contest.from!)} - ${parseDate(contest.to!)}',
                          style: AppTextStyle.body
                              .copyWith(color: AppColors.black)),
                    ),
                    Expanded(
                      child: Text(contest.prize!,
                          style: AppTextStyle.body
                              .copyWith(color: AppColors.black)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (leader != null)
                  AppOutlineButton(
                      title: 'Rank ${leader!.rank}',
                      function: () {},
                      borderColor: AppColors.red,
                      backgroundColor: Colors.transparent),
                if (leader == null)
                  AppElevatedButton(
                      title: 'Join This Contests',
                      function: () {
                        if (isGuest) {
                          /*
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Contests are not available for guests. Please become user',
                                style: AppTextStyle.subtitle),
                            backgroundColor: AppColors.red,
                          )); */
                          context.router.push(AuthBuilderRoute(
                              authStatus: Auth.register));
                        } else {
                          join();
                        }
                      }),
              ],
            ),
          ),
          const Divider(
            color: AppColors.lightNaviBlue,
            thickness: 1,
          ),
          LeaderboardWidget(
            leaders: leaders,
            user: leader,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppOutlineButton(
                    title: 'Load More',
                    function: () => loadMore(),
                    borderColor: AppColors.red,
                    backgroundColor: Colors.transparent),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Content details',
                  style: AppTextStyle.body,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  contest.summary ?? '',
                  style: AppTextStyle.bodyS
                      .copyWith(color: AppColors.black, height: 1.8),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
