import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:auto_route/auto_route.dart';

class BasicAppWidget extends StatelessWidget {
  final Widget content;
  final String? title;
  final bool showBack;
  final Function? backRoute;
  final bool resize;
  final bool hasTitle;

  final Color? appBarColor;
  final bool hasAppBar;

  final Color? backgroundColor;

  final double? customHeight;
   final GlobalKey<ScaffoldState>? scaffoldKey;
  const BasicAppWidget(
      {Key? key,
      required this.content,
      this.title,
      this.showBack = true,
      this.resize = true,
      this.hasTitle = true,
      this.backRoute, this.backgroundColor,
      this.appBarColor, this.hasAppBar = true, this.customHeight, this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
          resizeToAvoidBottomInset: resize,
          appBar: hasAppBar ? AppBar(
            backgroundColor: appBarColor ?? AppColors.darkNaviBlue,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            title:
                hasTitle ? Text(title ?? '', style: AppTextStyle.titleS) : null,
            centerTitle: true,
            elevation: 0.0,
            leading: showBack
                ? IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      backRoute != null ? backRoute!() : context.router.navigateBack();
                    },
                    icon: (SvgPicture.asset('assets/icons/back.svg')))
                : null,
          ) : null,
          backgroundColor: backgroundColor ?? AppColors.whities,
          body: resize
              ? SafeArea(
                  child: height < 720
                      ? SingleChildScrollView(
                          child:
                              SizedBox(height: customHeight ?? height * 0.87, child: content),
                        )
                      : content)
              : SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: width,
                        minHeight: height,
                      ),
                      child: IntrinsicHeight(child: SafeArea(child: content))),
                ),

      ),
    );
  }
}
