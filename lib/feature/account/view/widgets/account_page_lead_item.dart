import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';

import '../../../home/view/local_widgets/balance_text_widget.dart';
import '../../../home/view/local_widgets/balance_text_widget2.dart';

class AccountPageLeadItem extends StatelessWidget {
  final String name;
  final String balance;
  const AccountPageLeadItem(
      {super.key, required this.name, required this.balance});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        width: size.width * 0.9,
        height: 100.h,
        decoration: BoxDecoration(
            color: AppColors.lightgrey,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: AppTextStyle.semiBold16
                    .copyWith(color: AppColors.black),
              ),
              const Divider(
                color: AppColors.lightgrey,
              ),
              BalanceTextWidget2(prefix: "Current Balance: ", amount: balance),
              /*RichText(
                text: TextSpan(
                  text: 'Current Balance: ',
                  style: AppTextStyle.bold14
                      .copyWith(color: AppColors.purpleLightColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: '🟡 $balance',
                      style: AppTextStyle.bold14
                          .copyWith(color: AppColors.red),
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
