import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/constants/validation.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/login_params/login_params.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/auth/bloc/login_bloc.dart';
import 'package:freeplay/feature/auth/view/widgets/auth_text_field.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/common/buttons/app_text_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BasicAppWidget(
      backRoute: () {
        context.router.push(const AuthPageRoute());
      },
      content: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(child: SizedBox()),
              Text(
                'Log In',
                textAlign: TextAlign.center,
                style: AppTextStyle.titleL,
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: 20.h,
                ),
              ),
              Text(
                'People all over the world are fond of sports and sport games.',
                textAlign: TextAlign.center,
                style: AppTextStyle.subtitle.copyWith(
                  color: AppColors.purpleLightColor,
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: 20.h,
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
                height: 6.h,
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
              AppTextButton(
                  function: () {
                    context.router.push(const RecoveryPageBuilderRoute());
                  },
                  text: 'Forgot Password?'),
              const Expanded(child: SizedBox()),
              AppElevatedButton(
                title: 'Log In',
                function: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginEvent.login(
                        params: LoginParams(
                            email: email.text, password: password.text)));
                  }
                },
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
      title: 'Log In',
    );
  }
}
