import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/constants/validation.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/register_params/register_params.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/auth/auth.dart';
import 'package:freeplay/feature/auth/bloc/login_bloc.dart';
import 'package:freeplay/feature/auth/view/widgets/auth_text_field.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/common/buttons/app_text_button.dart';

class RegisterPage extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool isGuest;
  RegisterPage({Key? key, required this.isGuest}) : super(key: key);

  bool isValidPassword(String password) {
    final passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$',
    );
    return passwordRegExp.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return BasicAppWidget(
      backgroundColor: AppColors.darkNaviBlue,
      content: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            /*image: DecorationImage(
                image: AssetImage("assets/images/auth/login_bg.png"), fit: BoxFit.cover),*/
            color: AppColors.darkNaviBlue
          ),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(child: SizedBox()),
              Text(
                'Register',
                textAlign: TextAlign.center,
                style: basycStyle.copyWith(
                  color: AppColors.whities,
                  fontWeight: FontWeight.w600,
                  fontSize: 32.sp,
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 16.h,
                ),
              ),
              Text(
                'People all over the world are fond of sports and sport games.',
                textAlign: TextAlign.center,
                style: AppTextStyle.subtitle.copyWith(
                  color: AppColors.whities,
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 16.h,
                ),
              ),
              AuthTextField(
                hintText: 'Email',
                textEditingController: email,
                validator: (value) {
                  if (!RegExp(emailValidation).hasMatch(email.text)) {
                    return "Email is not valid";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              AuthTextField(
                obscureText: true,
                hintText: 'Password',
                textEditingController: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (!isValidPassword(value)) {
                    return 'Password must be at least 8 characters. \ninclude a letter, a number, and \na special character';
                  }
                  return null;
                  },
              ),
              SizedBox(
                height: 4.h,
              ),
              AuthTextField(
                hintText: 'Nick Name',
                textEditingController: name,
                validator: (value) {
                  if (name.text.isEmpty) {
                    return "Nick Name is not valid";
                  }
                  return null;
                },
              ),
              const Expanded(child: SizedBox()),
              AppElevatedButton(
                title: 'Register',
                function: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginEvent.register(
                          params: RegisterParams(
                              email: email.text,
                              password: password.text,
                              username: name.text),
                          isGuest: isGuest,
                        ));
                  }
                },
              ),
              if (!isGuest)
                Flexible(
                    child: AppTextButton(
                        function: () {
                          context.router.replace(
                              AuthBuilderRoute(authStatus: Auth.login));
                        },
                        text: 'Have an account?')),
            ],
          ),
        ),
      ),
      // title: 'Register',
    );
  }
}
