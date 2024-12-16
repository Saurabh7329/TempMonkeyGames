
import 'package:flutter/material.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';

class DialogBoxForConnectionB extends StatefulWidget {
  const DialogBoxForConnectionB({super.key});

  @override
  State<DialogBoxForConnectionB> createState() => _CustomDialogBoxViewState();
}

class _CustomDialogBoxViewState extends State<DialogBoxForConnectionB> {
  @override
  Widget build(BuildContext context) {

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      backgroundColor: AppColors.lightNaviBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset(
            //   'assets/images/dialog_images/connecting_b.png',
            //   // Background image
            //   fit: BoxFit.cover,
            // ),
            SizedBox(height: 20), // Margin between image and first button
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('You are all set to bet.',
                      style: AppTextStyle.bold14
                          .copyWith(color: Colors.white, fontSize: 30)),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'We are sending your information to your favourite sportsbook, you will be shortly on their website and can start betting on winning teams.',
                      style: AppTextStyle.semiBold16.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the value as needed
                          ),
                          backgroundColor: AppColors.darkNaviBlue),
                      child: Image.asset(
                        'assets/images/dialog_images/three_dot_animation.gif',
                        height: 50, // Adjust the height as needed
                        width: 50, // Adjust the width as needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
