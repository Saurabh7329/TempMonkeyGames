import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/common/buttons/app_outline_button.dart';

class AccountDeletedPage extends StatelessWidget {
  const AccountDeletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppWidget(
        title: 'Delete Account',
        showBack: false,

        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              Text(
                'We are sorry',
                textAlign: TextAlign.center,
                style: AppTextStyle.titleXXL.copyWith(
                  foreground: Paint()..shader = AppColors().gradient,
                ),
              ),
              SizedBox(height: 16.h,),
              Text(
                'But your delete your account, we hope to meet again in the future',
                textAlign: TextAlign.center,
                style: AppTextStyle.bold14.copyWith(color: AppColors.whiteColor),
              ),
              const Expanded(child: SizedBox()),
              Text(
                  'Leave a review so we know what you don\'t like about our app',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.body
                      .copyWith(color: AppColors.purpleLightColor)),
                     SizedBox(
                height: 8.h,
              ),  
              AppElevatedButton(
                function: () {},
                title: 'Leave a review',
              ),
              SizedBox(
                height: 12.h,
              ),
              AppOutlineButton(
                title: 'Go out',
                function: () {
                  context.router.replace(const AuthPageRoute());
                },
                backgroundColor: Colors.transparent,
                borderColor: AppColors.red,
              )
            ],
          ),
        ));
  }
}
