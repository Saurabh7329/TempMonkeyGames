import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/account/view/widgets/account_page_item.dart';
import 'package:freeplay/feature/account/view/widgets/app_version_widget.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppWidget(
        title: 'Settings',
        appBarColor: AppColors.lightNaviBlue,
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              AccountPageItem(
                title: 'Change Password',
                onTap: () {
                  context.router.push(ChangePasswordPageRoute());
                },
                isBottom: true,
                isTop: true,
              ),
              const Expanded(child: SizedBox()),
              const AppVersionWidget()
            ],
          ),
        ));
  }
}
