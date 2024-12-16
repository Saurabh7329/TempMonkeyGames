import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/dio/app_dio.dart';
import 'package:freeplay/core/domain/wager.dart';
import 'package:freeplay/feature/betslip/view/local_widgets/wager_card_widget.dart';
import 'package:freeplay/feature/common/spacers/column_spacer.dart';
import 'package:freeplay/main.dart';

import '../local_widgets/straight_wager_card_widget.dart';


class PicksViewPage extends StatefulWidget {
  const PicksViewPage({Key? key}) : super(key: key);

  @override
  State<PicksViewPage> createState() => _PicksViewPageState();
}

class _PicksViewPageState extends State<PicksViewPage> {

  bool isLoading = true;
  List<Wager> arrWagerList = [];
  @override
  void initState() {
    getData();
  }

  void getData() async {
    try {
      final response = await AppDio().getRequest(
        path: '/wagers',
        queryParameters: {
          'fields':'teams,parlay',
          'timezone':timezone,
          'sort':'asc',
          'page':'1',
          'unread':'1',
          'status':'open',
        },
      );
      if (response.statusCode == 200) {
        var jsonList = response.data['data'] as List;
        var count = jsonList.length;
        print("objectfefef $count");
        setState(() {
          for (int i = 0; i < jsonList.length; i++) {
            final obj = Wager.fromJson(jsonList[i]);
            arrWagerList.add(obj);
          }
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whities,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'My Picks',
          style: AppTextStyle.titleS.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        backgroundColor: AppColors.lightNaviBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          /*
          context
              .read<BetslipsBloc>()
              .add(const BetslipsEvent.refreshBetslips());
          await Future.delayed(const Duration(seconds: 2));*/
        },
        backgroundColor: AppColors.lightNaviBlue,
        color: AppColors.whities,
        child: isLoading ? const Center(child: CircularProgressIndicator(color: AppColors.whities)) : ListView.separated(
          physics: arrWagerList.length < 2
              ? const AlwaysScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: 16.w,
            right: 12.w,
            left: 20.w,
            bottom: arrWagerList.length < 2
                ? 0
                : MediaQuery.of(context).size.height * .5,
          ),
          itemCount: arrWagerList.length,
          separatorBuilder: (_, __) => ColumnSpacer(8.w),
          itemBuilder: (context, index) {
            final wager = arrWagerList[index];
            return WagerCardWidget(
              wager: wager,
            );
          },
        ),
      ),
    );
  }
}