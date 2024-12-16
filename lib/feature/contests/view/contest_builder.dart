import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/configuration.dart';
import 'package:freeplay/core/domain/contest/contest.dart';
import 'package:freeplay/core/domain/leader/leader.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';
import 'package:freeplay/feature/contests/bloc/contest_bloc.dart';
import 'package:freeplay/feature/contests/view/pages/contest_detail_page.dart';
import 'package:freeplay/feature/contests/view/pages/contests_page.dart';
import 'package:global_snack_bar/global_snack_bar.dart';

enum Contests { contestsList, contestsDetail }

class ContestBuilder extends StatefulWidget {
  const ContestBuilder({super.key});

  @override
  State<ContestBuilder> createState() => _ContestBuilderState();
}

class _ContestBuilderState extends State<ContestBuilder> {
  Contests contestState = Contests.contestsList;
  late String selectedContestId;

  @override
  Widget build(BuildContext context) {
    return GlobalMsgWrapper(
      BasicAppWidget(
        showBack: contestState == Contests.contestsDetail,
        backRoute: () {
          setState(() {
            contestState = Contests.contestsList;
          });
        },
        title: 'Contests',
        appBarColor: AppColors.lightNaviBlue,
        content: RefreshIndicator(
          backgroundColor: AppColors.lightNaviBlue,
          color: AppColors.whities,
          onRefresh: () async {
            context.read<ContestBloc>().add(const ContestEvent.getContests());
            await Future.delayed(const Duration(seconds: 2));
          },
          child:
              BlocBuilder<ContestBloc, ContestState>(builder: (context, state) {
            return state.map(idle: (value) {
              if (value.isLoading == true) {
                return const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.whities),
                );
              } else if (value.error) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Center(
                    child: Text(
                      value.errorMessage,
                      style: AppTextStyle.body,
                    ),
                  ),
                );
              }
              return const SizedBox();
            }, success: (value) {
              switch (contestState) {
                case Contests.contestsList:
                  return ContestsPage(
                    showDetails: (item) {
                      setState(() {
                        contestState = Contests.contestsDetail;
                        selectedContestId = item;
                      });
                    },
                    contests: value.contests,
                  );
                case Contests.contestsDetail:
                  Contest contest = value.contests.firstWhere(
                      (element) => element.id.toString() == selectedContestId);
                  List<Leader> leaders = [];
                  final leaderRange = contest.leaders!.getRange(
                      0,
                      contest.leaders!.length < 10
                          ? contest.leaders!.length
                          : 10);
                  leaders.addAll(leaderRange);
                  return ContestDetailPage(
                    contest: contest,
                    leader: contest.leader,
                    leaders: leaders,
                    join: () {
                      context.read<ContestBloc>().add(ContestEvent.joinContest(
                          contestId: contest.id.toString()));
                    },
                    back: () {
                      setState(() {
                        contestState = Contests.contestsList;
                      });
                    },
                    loadMore: () {
                      setState(() {
                        leaders = contest.leaders ?? [];
                      });
                    },
                  );
              }
            });
          }),
        ),
      ),
    );
  }
}
