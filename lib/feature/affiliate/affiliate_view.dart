import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/dio/app_dio.dart';
import 'package:freeplay/core/domain/configuration.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/feature/common/app_loading.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';
import 'package:freeplay/feature/home/view/local_widgets/connection_a_dialog_box_widget.dart';
import 'package:global_snack_bar/global_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../core/route/router.dart';
import '../../main.dart';

class AffiliateView extends StatefulWidget {
  final List<Promotion> promotion; // Define a variable to hold the data

  const AffiliateView({Key? key, required this.promotion})
      : super(key: key);

  @override
  State<AffiliateView> createState() => _AffiliateViewState();
}

class _AffiliateViewState extends State<AffiliateView> {
  var isLoading = false;
  var displayMessage = "";



  void showRoundedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const DialogBoxForConnectionA();
      },
    );
  }

  void callLogApi(int index) async {
    var dio = AppDio();
    setState(() {
      isLoading = true;
    });
    final response =
        await dio.postRequest(path: "/record_partner_visit", data: {
      "partner_url": widget.promotion[index].link,
      "banner_key": widget.promotion[index].key
    });

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showRoundedDialog(context);
      });
      //add 5 second delay
      int? timeout = int.parse(LocalStorage.getConfiguration(CONFIGURATION)!.data.style.transitionTimer);
      Future.delayed(Duration(seconds: timeout), () async {
        Navigator.pop(context);
        final urlRedirect = widget.promotion[index].link;
        openBrowser(urlRedirect);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.statusMessage.toString()),
          backgroundColor: Colors.red, // Customize the color if needed
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return isLoading
        ? const AppLoading()
        : GlobalMsgWrapper(
            BasicAppWidget(
              showBack: false,
              title: 'Deals',
              appBarColor: AppColors.lightNaviBlue,
              content: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.promotion.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: CachedNetworkImage(
                                  imageUrl: widget.promotion[index].image == null
                                      ? ""
                                      : widget.promotion[index].image!,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  )),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  imageBuilder: (context, imageProvider) =>
                                      GestureDetector(
                                    onTap: () async {
                                      if (widget.promotion[index].link
                                              .toLowerCase() ==
                                          'signup') {
                                        //redirect to sign up screen
                                        context.router.push(SignUpViewRoute());
                                      } else {
                                        /*
                                        showRoundedDialog(context);
                                        //add 5 second delay
                                        int? timeout = int.parse(LocalStorage.getConfiguration(CONFIGURATION)!.data.style.transitionTimer);
                                        Future.delayed(Duration(seconds: timeout),
                                            () async {
                                          Navigator.pop(context);

                                          final urlRedirect = widget.promotion[index].link;
                                          openBrowser(urlRedirect);
                                        }); */
                                        callLogApi(index);
                                      }
                                    },
                                    child: Container(
                                      //height: 160.h,
                                      constraints: BoxConstraints(minHeight: 180.h),
                                      width: size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: imageProvider, fit: BoxFit.cover),
                                          color: AppColors.lightNaviBlue),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
