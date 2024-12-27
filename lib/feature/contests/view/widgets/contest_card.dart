import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/contest/contest.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';

class ContestCard extends StatelessWidget {
  final Function? showDetails;
  final bool isFull;
  final Contest contest;
  const ContestCard(
      {super.key,
      this.showDetails,
      required this.isFull,
      required this.contest});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: contest.image ?? '',
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: AppColors.red,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: (context, imageProvider) => GestureDetector(
        onTap: (){
          if(!isFull)showDetails!();
        },
        child: Container(
          //height: 160.h,
          constraints: BoxConstraints(minHeight: 180.h),
          width: isFull ? size.width : size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              color: AppColors.lightNaviBlue),

        ),
      ),
    );
  }
}
