import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/contest/leaderboardModel.dart';
import 'package:freeplay/core/domain/leader/leader.dart';
import 'package:freeplay/feature/common/spacers/row_spacer.dart';

class LeaderboardWidget extends StatelessWidget {
  final List<Leader> leaders;
  final List<LeaderBoardModel> leaderboard;
  final Leader? user;
  const LeaderboardWidget({super.key, required this.leaders, required this.user,required this.leaderboard});

  @override
  Widget build(BuildContext context) {
    leaders.removeWhere((leader) => leader.userId == user?.userId);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Leaderboard',
              style: AppTextStyle.body.copyWith(color: AppColors.black)),
          SizedBox(
            height: 10.h,
          ),
          // Conditionally display "TBD" message
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Rank',
                          style: AppTextStyle.bodyXS
                              .copyWith(color: AppColors.purpleLightColor)),
                      const RowSpacer(45),
                      Text('Player',
                          style: AppTextStyle.bodyXS
                              .copyWith(color: AppColors.purpleLightColor)),
                      const Expanded(child: SizedBox()),
                      Text('Bank',
                          style: AppTextStyle.bodyXS
                              .copyWith(color: AppColors.purpleLightColor))
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: leaders.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              leaders[index].rank == 0 ? 'TBD' : '#${leaders[index].rank}',
                              style: AppTextStyle.body.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            const RowSpacer(60),
                            Text(
                              leaders[index].username ?? 'Player',
                              style: basycStyle.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              leaders[index].score.toString(),
                              style: basycStyle.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      );
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: leaderboard.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '#${leaderboard[index].rank}',
                              style: AppTextStyle.body.copyWith(
                                color: AppColors.purpleLightColor,
                              ),
                            ),
                            const RowSpacer(60),
                            Text(
                              leaderboard[index].username ?? 'Player',
                              style: basycStyle.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              leaderboard[index].score.toString(),
                              style: basycStyle.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      );
                    }),
                // Conditionally display "TBD" message
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  '**TBD - No score rank to be determined',
                  style: AppTextStyle.bodyXS.copyWith(color: AppColors.red),
                ),
                /*if (user != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '#${user!.rank}',
                          style: AppTextStyle.body.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                        const RowSpacer(60),
                        Text(
                          user!.username ?? 'Player',
                          style: AppTextStyle.body.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          user!.score.toString(),
                          style: AppTextStyle.body.copyWith(
                            color: AppColors.red,
                          ),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),*/
              ],
            ),
          )
        ],
      ),
    );
  }
}
