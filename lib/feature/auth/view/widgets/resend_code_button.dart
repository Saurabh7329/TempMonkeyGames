import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/feature/common/buttons/app_text_button.dart';

class ResendCodeButton extends StatefulWidget {
  final int endTime;
  final Function sendEmail;

  const ResendCodeButton(
      {super.key, required this.endTime, required this.sendEmail,});

  @override
  State<ResendCodeButton> createState() => _ResendCodeButtonState();
}

class _ResendCodeButtonState extends State<ResendCodeButton> {
  Timer? countdownTimer;
  late Duration duration;

  @override
  void initState() {
    super.initState();
    duration = Duration(seconds: widget.endTime);
    startTimer();
  }
void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }
void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = duration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  void resetTimer() {
    stopTimer();
    setState(() => duration = Duration(seconds: widget.endTime));
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(duration.inMinutes.remainder(60));
    final seconds = strDigits(duration.inSeconds.remainder(60));
        return duration.inSeconds != 0 ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'Resend after $minutes:$seconds',
            style: AppTextStyle.subtitle
                .copyWith(color: AppColors.purpleLightColor),
          ),
        ) : AppTextButton(
            function: () {
              resetTimer();
              widget.sendEmail();
            },
            text: 'Resend',
            style: AppTextStyle.bodyS.copyWith(
                foreground: Paint()..shader = AppColors().gradient,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.gardientLightColor),
          );
  }

  @override
  void dispose(){
    countdownTimer!.cancel();
    super.dispose();
  }
}
