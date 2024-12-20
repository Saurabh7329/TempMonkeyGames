import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/configuration.dart';
import 'package:freeplay/core/domain/contest/contest.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/feature/contests/view/widgets/contest_card.dart';
import 'package:freeplay/feature/contests/view/widgets/empty_contest_card.dart';

import '../../../../core/route/router.dart';
import '../../../auth/auth.dart';
import '../../../home/view/pages/home_page.dart';

class ContestsPage extends StatefulWidget {
  final Function(String) showDetails;
  final List<Contest> contests;

  const ContestsPage(
      {super.key, required this.showDetails, required this.contests});

  @override
  State<ContestsPage> createState() => _ContestsPageState();
}

class _ContestsPageState extends State<ContestsPage> {
  late Promotion? promotion;
  bool _isVisible = true;

  @override
  void initState() {
    checkRealPlayText();
  }

  void checkRealPlayText() {
      int type = 0;
      promotion = LocalStorage.getBannerPromotion(PROMOTION);
      if (promotion?.link.toLowerCase() == "affiliatescreen") {
        type = 1;
      } else if (promotion?.link.toLowerCase() == "signup") {
        type = 2;
      }
      if (type != 0) {
        _isVisible = true;
      }else {
        _isVisible = false;
      }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.9;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        // height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            SizedBox(
              height: 16.h,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.contests.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ContestCard(
                      showDetails: () => widget
                          .showDetails(widget.contests[index].id.toString()),
                      isFull: false,
                      contest: widget.contests[index],
                    ),
                  );
                }),
            SizedBox(
              height: 10.h,
            ),
            // const EmptyContestCard(),
            // _isVisible ? Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            //   child: Text('Switch to Real Money mode take advantage of this offer.',
            //       textAlign: TextAlign.center,
            //       style: AppTextStyle.bodyS.copyWith(
            //         color: AppColors.whiteColor,
            //         decoration: TextDecoration.underline,
            //       )),
            // ):Container(),
            _isVisible ? GestureDetector(
              onTap: (){
                var homePageState = context.findAncestorStateOfType<HomePageState>();
                if (homePageState != null) {
                  homePageState.programmaticallyClick(2);
                } else {
                  print('HomePageState not found');
                }
              },
              child: Container(
                height: 100.h,
                decoration: BoxDecoration(
                  color: AppColors.lightNaviBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child:   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Switch to Real Money mode take advantage of this offer.',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.bodyS.copyWith(
                          color: AppColors.whities,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                ),
              ),
            ) :Container(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            //   child: Text(
            //       'Switch to Real Money mode take advantage of this offer.',
            //       textAlign: TextAlign.center,
            //       style: AppTextStyle.bodyS.copyWith(
            //         color: AppColors.whiteColor,
            //         decoration: TextDecoration.underline,
            //       )),
            // ),
            SizedBox(
              height: 30.h,
            ),
          ]),
        ),
      ),
    );
  }
}
