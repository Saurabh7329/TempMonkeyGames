
import 'package:flutter/material.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/feature/common/carousel/page_view_indicator.dart';

class AppPageViewIndicator extends StatelessWidget {
  const AppPageViewIndicator({
    Key? key,
    required this.pageIndexNotifier,
    required this.length,
    this.activeColor = AppColors.whiteColor, this.color = AppColors.purpleLightColor
  }) : super(key: key);

  final ValueNotifier<int> pageIndexNotifier;
  final int length;
  final Color activeColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      indicatorPadding: const EdgeInsets.all(0.0),
      normalBuilder: (animationController, index) => PageViewDot(
        isActive: false,
        activeColor: activeColor, color: color,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController!,
          curve: Curves.ease,
        ),
        child: PageViewDot(
          isActive: true,
          activeColor: activeColor,
          color: color
        ),
      ),
    );
  }
}

class PageViewDot extends StatelessWidget{
  final bool isActive;
  final Color activeColor;
  final Color color;

  const PageViewDot({Key? key, required this.isActive, required this.activeColor, required this.color }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 6,
        height: 6,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: isActive ? activeColor : color,
        ),
      ),
    );
  }

}