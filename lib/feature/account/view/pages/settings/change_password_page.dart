import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/account/view/widgets/app_version_widget.dart';
import 'package:freeplay/feature/auth/view/widgets/auth_text_field.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/common/buttons/app_text_button.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});
  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BasicAppWidget(
        title: 'Change Password',
        appBarColor: AppColors.lightNaviBlue,
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                height: 16.h,
              ),
                AuthTextField(
                    hintText: 'Current Password',
                    textEditingController: oldPassword),
                AppTextButton(
                    function: () {
                      context.router.push(const RecoveryPageBuilderRoute());
                    },
                    text: 'Forgot password?'),
                AuthTextField(
                    hintText: 'New Password',
                    textEditingController: newPassword),
                    SizedBox(
                height: 8.h,
              ),
                AuthTextField(
                    hintText: 'Repeat New Password',
                    textEditingController: confirmPassword),
                    SizedBox(
                height: 16.h,
              ),
                AppElevatedButton(title: 'Confirm', function: () {}),
                const Expanded(child: SizedBox()),
                const AppVersionWidget()
              ],
            ),
          ),
        ));
  }
}
