import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freeplay/core/constants/validation.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/di/injections.dart';
import 'package:freeplay/core/domain/reset_password_params/reset_password_params.dart';
import 'package:freeplay/feature/auth/bloc/login_bloc.dart';
import 'package:freeplay/feature/auth/view/widgets/auth_text_field.dart';
import 'package:freeplay/feature/auth/view/widgets/recovery_password_widget.dart';
import 'package:freeplay/feature/auth/view/widgets/resend_code_button.dart';
import 'package:freeplay/feature/common/app_loading.dart';

enum RecoveryPassword { email, code, password }

class RecoveryPageBuilder extends StatefulWidget {
  const RecoveryPageBuilder({super.key});

  @override
  State<RecoveryPageBuilder> createState() => _RecoveryPageBuilderState();
}

bool isValidPassword(String password) {
  final passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$',
  );
  return passwordRegExp.hasMatch(password);
}

class _RecoveryPageBuilderState extends State<RecoveryPageBuilder> {
  final email = TextEditingController();
  final code = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? error;
  late int endTime;
  RecoveryPassword recoveryPassword = RecoveryPassword.email;
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: Builder(builder: (context) {
        return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
          if (state.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Something went wrong. Please try again later',
                  style: AppTextStyle.subtitle),
              backgroundColor: AppColors.red,
            ));
            context.router.navigateBack();
          }
        }, builder: (context, state) {
          return state.map(idle: (state) {
            if (state.isLoading) {
              return const AppLoading(
                title: 'Recovery Password',
              );
            }
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                backgroundColor: AppColors.whities,
                appBar: AppBar(
                  backgroundColor: AppColors.lightNaviBlue,
                  title: Text('Recovery Password', style: AppTextStyle.titleS),
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
                    child: Builder(builder: (context) {
                      switch (recoveryPassword) {
                        case RecoveryPassword.email:
                          return RecoveryPasswordWidget(
                              title: 'Enter Your Email',
                              textField: AuthTextField(
                                hintText: 'Email',
                                topError: error,
                                textEditingController: email,
                                validator: (value) {
                                  if (!RegExp(emailValidation)
                                      .hasMatch(email.text)) {
                                    setState(() {
                                      error = "Email is not valid";
                                    });
                                    return "";
                                  }
                                },
                              ),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginBloc>().add(
                                      LoginEvent.forgot(email: email.text));
                                  if (!state.error) {
                                    setState(() {
                                      recoveryPassword = RecoveryPassword.code;
                                      error = '';
                                    });
                                  }

                                  endTime = 90;
                                }
                              });

                        case RecoveryPassword.code:
                          return RecoveryPasswordWidget(
                              title: 'Enter Code',
                              textField: Column(
                                children: [
                                  AuthTextField(
                                    hintText: 'Code',
                                    topError: error,
                                    textEditingController: code,
                                    validator: (value) {
                                      if (code.text.isEmpty) {
                                        setState(() {
                                          error = "Code cannot be empty";
                                        });
                                        return "";
                                      }
                                    },
                                  ),
                                  ResendCodeButton(
                                    endTime: endTime,
                                    sendEmail: () => context
                                        .read<LoginBloc>()
                                        .add(LoginEvent.forgot(
                                            email: email.text)),
                                  )
                                ],
                              ),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    recoveryPassword =
                                        RecoveryPassword.password;
                                    error = '';
                                  });
                                }
                              });

                        case RecoveryPassword.password:
                          return RecoveryPasswordWidget(
                            title: 'Recovery Password',
                            textField: Column(
                              children: [
                                AuthTextField(
                                  obscureText: true,
                                  topError: error,
                                  hintText: 'Password',
                                  textEditingController: password,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is not valid';
                                    } else if (!isValidPassword(value)) {
                                      return 'Password must be at least 8 characters. \ninclude a letter, a number, and \na special character';
                                    }
                                    return null;
                                  },
                                ),
                                ResendCodeButton(
                                  endTime: endTime,
                                  sendEmail: () => context
                                      .read<LoginBloc>()
                                      .add(
                                          LoginEvent.forgot(email: email.text)),
                                )
                              ],
                            ),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                      LoginEvent.resetPassword(
                                        params: ResetPasswordParams(
                                            email: email.text,
                                            token: code.text,
                                            password: password.text),
                                      ),
                                    );
                                context.router.navigateBack();
                              }
                            },
                          );
                      }
                    }),
                  ),
                ),
              ),
            );
          });
        });
      }),
    );
  }
}
