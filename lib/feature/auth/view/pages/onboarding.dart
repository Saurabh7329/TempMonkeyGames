import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/auth/view/widgets/onboardin_widget.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';
import 'package:freeplay/feature/common/buttons/app_text_button.dart';
import 'package:freeplay/feature/common/carousel/carousel.dart';
import 'package:auto_route/auto_route.dart';

class OnboardingBuilder extends StatefulWidget {
  const OnboardingBuilder({super.key});
  @override
  State<OnboardingBuilder> createState() => _OnboardingBuildaerState();
}

class _OnboardingBuildaerState extends State<OnboardingBuilder> {
  final onboardingOptions =
      List.generate(4, (index) => const OnboardingWidget());
  PageController pageController = PageController();
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);
  bool lastPage = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    pageController.addListener(() {
      ScrollPosition position = pageController.position;
      if (pageController.offset == position.maxScrollExtent) {
        context.router.replace(const AuthPageRoute());
        LocalStorage.setBool(ONBOARDING_DONE, true);
      }
    });
    super.initState();
  }

  void onPageChanged(int index) {
    if (index == onboardingOptions.length) {
      pageIndexNotifier.value = index - 1;
      setState(() {
        lastPage = true;
      });
    } else {
      pageIndexNotifier.value = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasicAppWidget(
        title: 'Introduction',
        showBack: false,
        content: Stack(
          children: [
            PageView.builder(
                controller: pageController,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (index) => onPageChanged(index),
                itemCount: onboardingOptions.length + 1,
                itemBuilder: (context, i) {
                  return i < onboardingOptions.length
                      ? onboardingOptions[i]
                      : const Center(child: CircularProgressIndicator(color: AppColors.red));
                }),
            !lastPage
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        AppTextButton(
                          function: () {
                            LocalStorage.setBool(ONBOARDING_DONE, true);
                            context.router.replace(const AuthPageRoute());
                          },
                          text: 'Skip'.toUpperCase(),
                          style: AppTextStyle.subtitle,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        AppPageViewIndicator(
                            pageIndexNotifier: pageIndexNotifier,
                            length: onboardingOptions.length),
                        SizedBox(
                          height: 40.h,
                        )
                      ],
                    ),
                  )
                : const Offstage()
          ],
        ));
  }
}
