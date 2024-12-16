import 'package:flutter/widgets.dart';

import '../../../../core/design/colors.dart';
import '../../../../core/design/text_style/text_styles.dart';

class BalanceTextWidget extends StatefulWidget {
  final String prefix;
  final String amount;

  const BalanceTextWidget({required this.prefix, required this.amount});

  @override
  State<BalanceTextWidget> createState() => _BalanceTextWidgetState();
}

class _BalanceTextWidgetState extends State<BalanceTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Row(
        children: [
          widget.prefix.isNotEmpty ? Text(
            "${widget.prefix} ",  // Add your desired text here
            style: AppTextStyle.semibold12.copyWith(color: AppColors.black),
          )
              : Container(),
          Image.asset(
            'assets/icons/coin.webp',
            // Background image
            fit: BoxFit.cover,
            width: 20,
            height: 20,

          ),
          Text(
            " " + widget.amount,  // Add your desired text here
            style: AppTextStyle.semibold12.copyWith(color: AppColors.whities),
          ),
        ],
      )
    ],);
  }
}
