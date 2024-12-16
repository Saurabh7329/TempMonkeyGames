import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/leader/leader.dart';
import 'package:freeplay/feature/common/spacers/row_spacer.dart';

class LeaderboardWidget extends StatelessWidget {
  final List<Leader> leaders;
  final Leader? user;
  const LeaderboardWidget({super.key, required this.leaders, required this.user});
  
  @override
  Widget build(BuildContext context) {
    leaders.remove(user);
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
                              '#${leaders[index].rank}',
                              style: AppTextStyle.body.copyWith(
                                color: AppColors.purpleLightColor,
                              ),
                            ),
                            const RowSpacer(60),
                            Text(
                              leaders[index].username ?? 'Player',
                              style: AppTextStyle.body,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              leaders[index].score.toString(),
                              style: AppTextStyle.body,
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      );
                    }),
                if (user != null)
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
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
