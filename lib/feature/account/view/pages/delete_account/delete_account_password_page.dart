import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/di/injections.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/account/bloc/account_bloc.dart';
import 'package:freeplay/feature/auth/view/widgets/auth_text_field.dart';
import 'package:freeplay/feature/common/app_loading.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/home/bloc/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';
import 'package:global_snack_bar/global_snack_bar.dart';

class DeleteAccountPasswordPage extends StatelessWidget {
  DeleteAccountPasswordPage({super.key});
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GlobalMsgWrapper(
      BlocBuilder<AccountBloc, AccountState>(
          bloc: getIt<AccountBloc>()..add(const AccountEvent.getUser()),
          builder: (context, state) {
            return state.map(
              idle: (value) {
                return Scaffold(
                    backgroundColor: AppColors.darkNaviBlue,
                    appBar: AppBar(
                      backgroundColor: AppColors.darkNaviBlue,
                      title: Text('Delete Account', style: AppTextStyle.titleS),
                      centerTitle: true,
                      elevation: 0.0,
                      leading: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            context.router.navigateBack();
                          },
                          icon: (SvgPicture.asset('assets/icons/back.svg'))),
                    ),
                    body: SafeArea(
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(child: SizedBox()),
                              Text(
                                'Enter your password',
                                style: AppTextStyle.subtitle.copyWith(
                                    color: AppColors.purpleLightColor),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 100.h,
                                ),
                              ),
                              AuthTextField(
                                obscureText: true,
                                hintText: 'Password',
                                textEditingController: password,
                                validator: (value) {
                                  if (password.text.length < 6
                                      // !RegExp(passwordValidation).hasMatch(password.text)
                                      ) {
                                    return "Password is not valid";
                                  }
                                  return null;
                                },
                              ),
                              const Expanded(child: SizedBox()),
                              AppElevatedButton(
                                  title: 'Delete',
                                  function: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<AccountBloc>()
                                          .add(AccountEvent.deleteAccount(
                                              password: password.text,
                                              onFail: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Cannot delete account. Please try again later',
                                                      style: AppTextStyle
                                                          .subtitle),
                                                  backgroundColor:
                                                      AppColors.red,
                                                ));

                                                context.router.navigateBack();
                                              },
                                              onSuccess: () {
                                                context.read<BottomNavBarBloc>().add(
                                              const BottomNavBarEvent.onTap(0));
                                                context.router.replace(
                                                    const AccountDeletedPageRoute());
                                              }));
                                    }
                                  })
                            ],
                          ),
                        ),
                      ),
                    ));
              },
              loading: (value) {
                return const AppLoading();
              },
            );
          }),
    );
  }
}
