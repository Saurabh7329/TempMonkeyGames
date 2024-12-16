
import 'package:flutter/material.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/configuration.dart';
import '../../../../core/local_storage/local_storage_service.dart';

class DialogBoxForConnectionA extends StatefulWidget {
  const DialogBoxForConnectionA({super.key});

  @override
  State<DialogBoxForConnectionA> createState() => _CustomDialogBoxViewState();
}

class _CustomDialogBoxViewState extends State<DialogBoxForConnectionA> {
  @override
  Widget build(BuildContext context) {
    var terms = LocalStorage.getConfiguration(CONFIGURATION);
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
            //   'assets/images/dialog_images/connection_a.png',
            //   // Background image
            //   fit: BoxFit.cover,
            // ),
            // SizedBox(height: 20), // Margin between image and first button
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(terms?.data
                  .info
                  .transition
                  .header ?? "",
                      style: AppTextStyle.bold14
                          .copyWith(color: Colors.white, fontSize: 30)),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      terms?.data
                          .info
                          .transition
                          .text ?? "",
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
