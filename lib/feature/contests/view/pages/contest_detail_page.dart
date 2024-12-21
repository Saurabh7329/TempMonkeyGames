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

import '../../../../core/dio/app_dio.dart';
import '../../../../core/domain/contest/leaderboardModel.dart';
import '../../../../core/route/router.dart';

class ContestDetailPage extends StatefulWidget {
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



  final bool isGuest =
      User.fromJson(jsonDecode(LocalStorage.getString(Freeplay_User)!)).type ==
          UserType.guest.name;

  @override
  State<ContestDetailPage> createState() => _ContestsDetailPageState();
}

class _ContestsDetailPageState extends State<ContestDetailPage> {

  bool isLoading = true;
  List<LeaderBoardModel>leaderBoard =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


  void getData() async {
    try {
      final response = await AppDio().getRequest(
        path: '/leaders',
        queryParameters: {
          'contest':'202',
        },
      );
      if (response.statusCode == 200) {
        var jsonList = response.data['data'] as List;
        var count = jsonList.length;
        print("objectfefef $count");
        setState(() {
          for (int i = 0; i < jsonList.length; i++) {
            final obj = LeaderBoardModel.fromJson(jsonList[i]);
            leaderBoard.add(obj);
          }
          setState(() {
            isLoading = false;
          });
        });
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContestCard(
            isFull: true,
            contest: widget.contest,
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
                          '${parseDate(widget.contest.from!)} - ${parseDate(widget.contest.to!)}',
                          style: AppTextStyle.body
                              .copyWith(color: AppColors.black)),
                    ),
                    Expanded(
                      child: Text(widget.contest.prize!,
                          style: AppTextStyle.body
                              .copyWith(color: AppColors.black)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (widget.leader != null)
                  AppOutlineButton(
                      title: 'Rank ${widget.leader!.rank}',
                      function: () {},
                      borderColor: AppColors.red,
                      backgroundColor: Colors.transparent),
                if (widget.leader == null)
                  AppElevatedButton(
                      title: 'Join This Contests',
                      function: () {
                        if (widget.isGuest) {
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
                          widget.join();
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
            leaders: widget.leaders,
            user: widget.leader,
            leaderboard: leaderBoard,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppOutlineButton(
                    title: 'Load More',
                    function: () => widget.loadMore(),
                    borderColor: AppColors.red,
                    backgroundColor: Colors.transparent),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Content details',
                  style: basycStyle.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  widget.contest.summary ?? '',
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

  String parseDate(String date) {
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
  }

  _buildPosts(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text("Rank",style: AppTextStyle.bold14,),
        Text("Player",style: AppTextStyle.bold14,),
        Text("Score",style: AppTextStyle.bold14,)

      ],)
    ],);
  }
}
