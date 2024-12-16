import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/feature/common/buttons/gradient_text_button.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  final String? topError;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final Color? fillColor;
  final bool hasGradient;

  const AuthTextField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.validator,
    this.obscureText,
    this.topError,
    this.readOnly,
    this.onTap,
    this.fillColor,
    this.hasGradient = true,
  }) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _passwordVisible = true;
  String _passwordVisibleTitle = 'Show';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.topError != null)
          Column(
            children: [
              Text(
                widget.topError!,
                textAlign: TextAlign.center,
                style: AppTextStyle.subtitle.copyWith(
                  color: AppColors.purpleLightColor,
                ),
              ),
              SizedBox(
                height: 24.h,
              )
            ],
          ),
        SizedBox(
          child: TextFormField(
            enabled: true,
            obscureText: widget.obscureText != null ? _passwordVisible : false,
            autocorrect: false,
            validator: widget.validator,
            style: AppTextStyle.subtitle.copyWith(
              color: AppColors.purpleLightColor,
              height: 1.4.sp,
            ),
            readOnly: widget.readOnly == null ? false : widget.readOnly!,
            onTap: widget.onTap,
            cursorColor: AppColors.whiteColor,
            controller: widget.textEditingController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: widget.obscureText != null
                  ? widget.hasGradient ? GradientTextButton(
                function: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                    if (!_passwordVisible) {
                      _passwordVisibleTitle = 'Hide';
                    } else {
                      _passwordVisibleTitle = 'Show';
                    }
                  });
                },
                title: _passwordVisibleTitle,
              ) :
              GradientSignupTextButton(
                function: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                    if (!_passwordVisible) {
                      _passwordVisibleTitle = 'Hide';
                    } else {
                      _passwordVisibleTitle = 'Show';
                    }
                  });
                },
                title: _passwordVisibleTitle,
              )  : null,
              errorStyle: AppTextStyle.subtitle
                  .copyWith(color: AppColors.purpleLightColor, fontSize: 10.h),
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 20, minWidth: 20),
              contentPadding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.r)),
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.purpleDarkColor)),
              isCollapsed: false,
              // errorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(40.r)),
              //     borderSide:
              //         const BorderSide(width: 1, color: AppColors.purpleLightColor)),
              // focusedErrorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(40.r)),
              //     borderSide:
              //         const BorderSide(width: 1, color: AppColors.purpleLightColor)),
              fillColor: widget.fillColor ?? AppColors.lightNaviBlue,
              hintStyle: AppTextStyle.subtitle
                  .copyWith(color: AppColors.purpleLightColor),
              hintText: widget.hintText,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
