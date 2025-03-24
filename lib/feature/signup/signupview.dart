import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/constants/validation.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/feature/auth/view/widgets/auth_text_field.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/home/bloc/home_banner_bloc/home_banner_bloc.dart';
import 'package:freeplay/feature/home/bloc/home_banner_bloc/home_banner_event.dart';
import 'package:freeplay/feature/home/bloc/home_banner_bloc/home_banner_state.dart';
import 'package:freeplay/feature/home/bloc/signup_bloc/signup_bloc.dart';
import 'package:freeplay/feature/home/view/local_widgets/connection_a_dialog_box_widget.dart';
import 'package:freeplay/feature/home/view/local_widgets/dynamic_image_view.dart';
import 'package:freeplay/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';


import '../../core/constants/constants.dart';
import '../../core/domain/signup.dart';
import '../../core/local_storage/local_storage_service.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

enum Gender { Male, Female, Other }

class _SignUpViewState extends State<SignUpView> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final dateOfBirth = TextEditingController();
  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyyMMdd');
  Gender? _selectedGender;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context
        .read<HomeBannerBloc>()
        .add(const FetchDataEvent("account_banner")); //bol_signup
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1901),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        dateOfBirth.text =
            _dateFormat.format(pickedDate); // Set date in controller
      });
    }
  }

  Future<void> signUpAPI() async {
    print('signUpAPI url=============> ${dotenv.env['ENDPOINT']}auth/realplay');

    final geneder = _selectedGender == Gender.Male ? "Male" : _selectedGender == Gender.Female ? "Female" : "Other";
    final tokenr = LocalStorage.getString(SHARED_PREFS_ACCESS_TOKEN);
    final response = await http.post(
      Uri.parse('${dotenv.env['ENDPOINT']}auth/realplay'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenr',
        'app-api-key': dotenv.env['APP_API_KEY']!,
      },
      //body: body,
      body: jsonEncode(<String, String>{
        "FirstName": firstName.text,
        "LastName": lastName.text,
        "Username": userName.text,
        "Email": email.text,
        "Password": password.text,
        "Country": "US",
        "Currency": "USD",
        "DOB":_dateFormat.format(_selectedDate!),
        "Gender":geneder
      }),
    );
    print('signUpAPI Response code=============> ${response.statusCode}');
    print('signUpAPI Response body=============> ${response.body}');
    if (response.statusCode == 302) {
      setState(() {
        _isLoading = false; // Show loader when the API call starts
      });
      final redirectUrl = response.headers['location'];
      if (redirectUrl != null) {
        openBrowser(redirectUrl);
      } else {
        Fluttertoast.showToast(
          msg: "Unable to follow redirect URL",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
    else if (response.statusCode == 200) {
      setState(() {
        _isLoading = false; // Show loader when the API call starts
      });
      print('signUpAPI successfully');
      // Parse the response body to extract data
      final responseData = jsonDecode(response.body);

      // Check if there's a redirect URL
      if (responseData['redirect_url'] != null && responseData['redirect_url'].isNotEmpty) {
        print('signUpAPI ${responseData['redirect_url']}');
        // Redirect to external browser if URL is not null
        final urlRedirect = responseData['redirect_url'];
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showRoundedDialog(context);
        });
        int? timeout = int.parse(LocalStorage.getConfiguration(CONFIGURATION)!.data.style.transitionTimer);
        Future.delayed(Duration(seconds: timeout), () async {
          Navigator.pop(context);
          openBrowser(urlRedirect);
        });
      } else {
        // Show toast with message from response if no URL
        final message = responseData['message'] ?? 'Unknown error';
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
    else if (response.statusCode == 422) {

      setState(() {
        _isLoading = false; // Show loader when the API call starts
      });
      final responseData = jsonDecode(response.body);
      String msg = responseData["message"] ?? "";
      if (msg.isNotEmpty) {
      Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      );
      }
    }
    else {
      setState(() {
        _isLoading = false; // Show loader when the API call starts
      });
      throw Exception('Failed to signUpAPI');
    }
  }

  void showRoundedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const DialogBoxForConnectionA();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.darkNaviBlue,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        // Execute side effects based on the emitted state
        state.when(
            initial: (isLoading) {},
            error: (String message, bool isLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red, // Customize the color if needed
                ),
              );
            },
            success: (SignUp signUp, bool isLoading) {
              if (signUp.message.toLowerCase() == "success") {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showRoundedDialog(context);
                });
                //add 3 second delay
                Future.delayed(const Duration(seconds: 3), () async {
                  Navigator.pop(context);
                  final urlRedirect = signUp.redirectUrl;
                  openBrowser(urlRedirect);
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(signUp.message),
                    backgroundColor:
                        Colors.red, // Customize the color if needed
                  ),
                );
              }
            });
      },
      builder: (context, state) {
        // Build UI components based on the emitted state
        // return singUpView(context);
        return state.maybeWhen(
          initial: (isLoading) {
            return isLoading
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.red,
                      ),
                    ),
                  )
                : singUpView(context);
          },
          orElse: () => singUpView(context),
        );
      },
    );
  }

  Widget singUpView(BuildContext context) {
    return BasicAppWidget(
        title: 'Sign Up',
        backgroundColor: AppColors.signupBackgroundColor,
        appBarColor: AppColors.signupBackgroundColor,
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  BlocBuilder<HomeBannerBloc, HomeBannerState>(
                    builder: (context, state) {
                      if (state is HomeBannerInitial) {
                        return const SizedBox(); // Show loading indicator
                      } else if (state is HomeBannerLoading) {
                        return const SizedBox(); // Show loading text
                      } else if (state is HomeBannerLoaded) {
                        return DynamicImageView(
                          imageUrl: state.image,
                          actionLink: state.link,
                          launchMode: LaunchMode.externalApplication,
                        );
                      } else if (state is HomeBannerError) {
                        return const SizedBox();
                      } else {
                        return const SizedBox(); // Handle unexpected states (optional)
                      }
                    },
                    buildWhen: (previousState, currentState) =>
                        currentState !=
                        previousState, // Only rebuild on state change
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AuthTextField(
                    hintText: 'First Name',
                    textEditingController: firstName,
                    fillColor: AppColors.signupLightBackgroundColor,
                    validator: (value) {
                      if (firstName.text.isEmpty) {
                        return "First Name is not valid";
                      }
                      if (RegExp(r'\d').hasMatch(value!)) {
                        return 'First Name should not contain numbers.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AuthTextField(
                    hintText: 'Last Name',
                    textEditingController: lastName,
                    fillColor: AppColors.signupLightBackgroundColor,
                    validator: (value) {
                      if (lastName.text.isEmpty) {
                        return "Last Name is not valid";
                      }
                      if (RegExp(r'\d').hasMatch(value!)) {
                        return 'Last Name should not contain numbers.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AuthTextField(
                    hintText: 'User/Screen Name',
                    textEditingController: userName,
                    fillColor: AppColors.signupLightBackgroundColor,
                    validator: (value) {
                      if (userName.text.isEmpty) {
                        return "User name is not valid";
                      } else if (RegExp(r'\d').hasMatch(value!)) {
                        return 'User name should not contain numbers.';
                      }
                      else if (userName.text.length < 9) {
                        return "User name must be at least 9 characters.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AuthTextField(
                    hintText: 'Email',
                    textEditingController: email,
                    fillColor: AppColors.signupLightBackgroundColor,
                    validator: (value) {
                      if (!RegExp(emailValidation).hasMatch(email.text)) {
                        return "Email is not valid";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AuthTextField(
                    obscureText: true,
                    hintText: 'Password',
                    textEditingController: password,
                    fillColor: AppColors.signupLightBackgroundColor,
                    hasGradient: false,
                    validator: (value) {
                      if (password.text.length < 8) {
                        return "The password must be at least 8 characters.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Padding(
                      padding: const EdgeInsets.fromLTRB(23.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Gender:",
                        style: TextStyle(
                            color: AppColors.purpleLightColor, fontSize: 12.h),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                            width: 10.h,
                          ),
                          Radio<Gender>(
                            value: Gender.Male,
                            groupValue: _selectedGender,
                              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                if (states.contains(WidgetState.selected)) {
                                  return AppColors.signupRegisterColor; // Outer ring color when selected
                                }
                                return AppColors.signupRegisterColor.withAlpha(60); // Outer ring color when unselected
                              }),
                            onChanged: (Gender? value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                color: AppColors.purpleLightColor,
                                fontSize: 12.h),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<Gender>(
                            value: Gender.Female,
                            groupValue: _selectedGender,
                            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                              if (states.contains(WidgetState.selected)) {
                                return AppColors.signupRegisterColor; // Outer ring color when selected
                              }
                              return AppColors.signupRegisterColor.withAlpha(60); // Outer ring color when unselected
                            }),
                            onChanged: (Gender? value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text("Female",
                            style: TextStyle(
                                color: AppColors.purpleLightColor,
                                fontSize: 12.h),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<Gender>(
                            value: Gender.Other,
                            groupValue: _selectedGender,
                            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                              if (states.contains(WidgetState.selected)) {
                                return AppColors.signupRegisterColor; // Outer ring color when selected
                              }
                              return AppColors.signupRegisterColor.withAlpha(60); // Outer ring color when unselected
                            }),
                            onChanged: (Gender? value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text("Other",
                            style: TextStyle(
                                color: AppColors.purpleLightColor,
                                fontSize: 12.h),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (_selectedGender == null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(23.0, 0.0, 0.0, 0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Please select a gender",
                          style: TextStyle(color: Colors.red, fontSize: 10.h),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AuthTextField(
                    hintText: 'DOB',
                    textEditingController: dateOfBirth,
                    fillColor: AppColors.signupLightBackgroundColor,
                    validator: (value) {
                      if (dateOfBirth.text.isEmpty) {
                        return "Date of birth is not valid";
                      }
                      return null;
                    },
                    readOnly: true,
                    onTap: () => _selectDate(context),
                  ),
                  SizedBox(height: 30.h),
                  AppElevatedButton(
                    title: 'Register',
                    hasGradient: false,
                    function: () async {
                      if (_formKey.currentState!.validate() &&
                          _selectedGender != null) {
                        setState(() {
                          _isLoading = true; // Show loader when the API call starts
                        });
                        signUpAPI();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
