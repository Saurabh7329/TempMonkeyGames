import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/di/injections.dart';
import 'package:freeplay/core/domain/configuration.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/account/bloc/account_bloc.dart';
import 'package:freeplay/feature/account/view/widgets/account_page_item.dart';
import 'package:freeplay/feature/account/view/widgets/account_page_lead_item.dart';
import 'package:freeplay/feature/account/view/widgets/app_version_widget.dart';
import 'package:freeplay/feature/auth/auth.dart';
import 'package:freeplay/feature/common/app_loading.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';
import 'package:freeplay/feature/common/dialog/app_dialog.dart';
import 'package:freeplay/feature/home/bloc/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';
import 'package:global_snack_bar/global_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/local_storage/local_storage_service.dart';
import '../../../common/buttons/app_text_button2.dart';
import '../../../home/bloc/home_banner_bloc/home_banner_bloc.dart';
import '../../../home/bloc/home_banner_bloc/home_banner_event.dart';

enum UserType { player, guest }

class AccountBuilder extends StatefulWidget {
  AccountBuilder({Key? key}) : super(key: key);

  @override
  State<AccountBuilder> createState() => _AccountBuilderState();
}

class _AccountBuilderState extends State<AccountBuilder> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Promotion _promotion;

  @override
  void initState() {
    context.read<HomeBannerBloc>().add(const FetchDataEvent("account_banner"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalMsgWrapper(BasicAppWidget(
      showBack: false,
      hasAppBar: true,
      title: 'My Account',
      scaffoldKey: _scaffoldKey,
      customHeight: MediaQuery.of(context).size.height * 0.95,
      content: BlocBuilder<AccountBloc, AccountState>(
          bloc: getIt<AccountBloc>()..add(const AccountEvent.getUser()),
          builder: (context, state) {
            return state.map(idle: (value) {
              final isGuest = value.user.type == UserType.guest.name;
              print(value.user.type);

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      AccountPageLeadItem(
                        balance: value.user.wallet.toString(),
                        name: isGuest
                            ? 'Guest'
                            : value.user.username ?? 'User Name',
                      ),
                      /*BlocBuilder<HomeBannerBloc, HomeBannerState>(
                        builder: (context, state) {
                          if (state is HomeBannerInitial) {
                            return const SizedBox(); // Show loading indicator
                          } else if (state is HomeBannerLoading) {
                            return const SizedBox(); // Show loading text
                          } else if (state is HomeBannerLoaded) {
                            return DynamicImageView(
                              imageUrl: state.image,
                              actionLink: state.link,
                            );
                          } else if (state is HomeBannerError) {
                            return const SizedBox();
                          } else {
                            return const SizedBox(); // Handle unexpected states (optional)
                          }
                        },
                        buildWhen: (previousState, currentState) =>
                            currentState !=
                            previousState, // Only rebuild on state change
                      ),
                      SizedBox(
                        height: 16.h,
                      ),*/
                      AccountPageItem(
                        isTop: true,
                        title: 'FAQ',
                        onTap: () {
                          var terms =
                              LocalStorage.getConfiguration(CONFIGURATION);
                          if (terms != null) {
                            _launchInWebView(terms.data.faq);
                          }
                        },
                      ),
                      // if (!isGuest)
                      //   AccountPageItem(
                      //     title: 'Settings',
                      //     onTap: () {
                      //       context.router.push(const SettingsPageRoute());
                      //     },
                      //   ),
                      isGuest
                          ? AccountPageItem(
                              title: 'Register',
                              onTap: () {
                                context.router.push(AuthBuilderRoute(
                                    authStatus: Auth.register,
                                    isGuest: isGuest));
                              },
                              subTitle: 'Free',
                            )
                          : AccountPageItem(
                              title: 'Support',
                              onTap: () {
                                var terms = LocalStorage.getConfiguration(
                                    CONFIGURATION);
                                if (terms != null) {
                                  _launchInWebView(terms.data.support);
                                }
                              },
                            ),

                      AccountPageItem(
                        isTop: true,
                        title: 'Term & Conditions',
                        onTap: () {
                          var terms =
                              LocalStorage.getConfiguration(CONFIGURATION);
                          if (terms != null) {
                            _launchInWebView(terms.data.termConditions);
                          }
                        },
                      ),
                      AccountPageItem(
                        isTop: true,
                        title: 'Privacy Policy',
                        onTap: () {
                          var terms =
                              LocalStorage.getConfiguration(CONFIGURATION);
                          if (terms != null) {
                            _launchInWebView(terms.data.privacyPolicy);
                          }
                        },
                      ),
                      AccountPageItem(
                        title: 'Log Out',
                        onTap: () {
                          /*showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  logoutDialogue(context,"Log out", "Log out", 1));*/
                          showDialog(
                              useSafeArea: false,
                              context: _scaffoldKey.currentContext!,
                              builder: (dialogContext) {
                                return Container(
                                  color: Colors.transparent,
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1.5, sigmaY: 1.5),
                                      child: //logoutDialogue(context,"Log out", "Log out", 1);
                                 // ),
                                 AppDialog(
                                        dialogContext: dialogContext,
                                        title: 'Log out',
                                        action: 'Log out',
                                        confirm: () {
                                          context.read<AccountBloc>().add(
                                                  AccountEvent.logOut(
                                                      onFail: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Cannot log out. Please try again later',
                                                      style: AppTextStyle
                                                          .subtitle),
                                                  backgroundColor:
                                                      AppColors.red,
                                                ));
                                              }, onSuccess: () {
                                                context
                                                    .read<BottomNavBarBloc>()
                                                    .add(const BottomNavBarEvent
                                                        .onTap(0));
                                                context.router.replace(
                                                    const AuthPageRoute());
                                              }));
                                        },
                                      )
                                ));
                              });
                        },
                        isBottom: true,
                      ),

                      SizedBox(
                        height: 4.h,
                      ),
                      if (!isGuest)
                        AccountPageItem(
                          title: 'Delete account',
                          onTap: () {
                            /*showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    logoutDialogue(context,"Delete account", "Delete", 2));*/
                            showDialog(
                                useSafeArea: false,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 190.r,
                                    color: Colors.transparent,
                                    child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 1.5, sigmaY: 1.5),
                                        child: AppDialog(
                                          dialogContext: context,
                                          title: 'Delete account',
                                          action: 'Delete',
                                          confirm: () {
                                            context.router.push(
                                                DeleteAccountPasswordPageRoute());
                                          },
                                        )),
                                  );
                                });
                          },
                          isBottom: true,
                          isTop: true,
                        ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const AppVersionWidget()
                    ],
                  ),
                ),
              );
            }, loading: (value) {
              return const AppLoading();
            });
          }),
    ));
  }

  Future<void> _launchInWebView(String Urls) async {
    //  print('Urls===========>$Urls');
    var url = Uri.parse(Urls);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      await launchUrl(url);
    }
  }

  logoutDialogue(BuildContext context,String title, String action, int value) {
    return AlertDialog(
        backgroundColor: AppColors.whiteColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        content: SizedBox(
          height: 95,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              )),
          Text("Are you sure?",
                  style: basycStyle.copyWith(
                    color: AppColors.whities,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  )),
          const SizedBox(
            height: 2,
          ),
          Container(
            height: .5,          // Thickness of the line
            color: Colors.grey, // Color of the line
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: Text(
                    "Cancel",
                    style: basycStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.whities
                    ),
                ),
              )),
              Container(
                width: .5,
                height: 40,          // Thickness of the line
                color: Colors.grey, // Color of the line
              ),
              Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.darkNaviBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    child: Text(
                      action,
                      style: basycStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColors.whities
                      ),
                    ),
                  )),
             /* AppTextButton2(
                  text: action,
                  function: () {
                    if (value == 1) {
                      context
                          .read<AccountBloc>()
                          .add(AccountEvent.logOut(onFail: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                              'Cannot log out. Please try again later',
                              style: AppTextStyle.subtitle),
                          backgroundColor: AppColors.red,
                        ));
                      }, onSuccess: () {
                        context
                            .read<BottomNavBarBloc>()
                            .add(const BottomNavBarEvent.onTap(0));
                        context.router.replace(const AuthPageRoute());
                      }));
                    }
                    if (value == 2) {
                      context.router.push(DeleteAccountPasswordPageRoute());
                    }
                  }),*/
            ],
          )
        ]),));
  }
}
