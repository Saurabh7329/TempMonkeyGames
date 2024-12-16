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
import 'package:freeplay/feature/auth/bloc/login_bloc.dart';
import 'package:freeplay/feature/common/app_loading.dart';
import 'package:freeplay/feature/common/basic_app_widget.dart';
import 'package:freeplay/feature/common/dialog/app_dialog.dart';
import 'package:freeplay/feature/home/bloc/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';
import 'package:freeplay/feature/home/view/local_widgets/dynamic_image_view.dart';
import 'package:global_snack_bar/global_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/local_storage/local_storage_service.dart';
import '../../../home/bloc/home_banner_bloc/home_banner_bloc.dart';
import '../../../home/bloc/home_banner_bloc/home_banner_event.dart';
import '../../../home/bloc/home_banner_bloc/home_banner_state.dart';

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
      hasAppBar: false,
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
                        name:
                            isGuest ? 'Guest' : value.user.username ?? 'User Name',
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
                          var terms = LocalStorage.getConfiguration(CONFIGURATION);
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
                                var terms = LocalStorage.getConfiguration(CONFIGURATION);
                                if (terms != null) {
                                  _launchInWebView(terms.data.support);
                                }
                              },
                            ),

                      AccountPageItem(
                        isTop: true,
                        title: 'Term & Conditions',
                        onTap: () {
                          var terms = LocalStorage.getConfiguration(CONFIGURATION);
                          if (terms != null) {
                            _launchInWebView(terms.data.termConditions);
                          }
                        },
                      ),
                      AccountPageItem(
                        isTop: true,
                        title: 'Privacy Policy',
                        onTap: () {
                          var terms = LocalStorage.getConfiguration(CONFIGURATION);
                          if (terms != null) {
                            _launchInWebView(terms.data.privacyPolicy);
                          }
                        },
                      ),
                      AccountPageItem(
                        title: 'Log Out',
                        onTap: () {
                          showDialog(
                              useSafeArea: false,
                              context: _scaffoldKey.currentContext!,
                              builder: (dialogContext) {
                                return Container(
                                  height: 190.r,
                                  color: Colors.transparent,
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1.5, sigmaY: 1.5),
                                      child: AppDialog(
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
                                      )),
                                );
                              });
                        },
                        isBottom: true,
                      ),
                      // SizedBox(
                      //   height: 8.h,
                      // ),
                      // AccountPageItem(
                      //   isTop: true,
                      //   title: 'About Brand Name',
                      //   onTap: () {},
                      // ),
                      // AccountPageItem(
                      //   title: 'Terms & Conditions',
                      //   onTap: () {},
                      // ),
                      // AccountPageItem(
                      //   title: 'Privacy Policy',
                      //   onTap: () {},
                      // ),
                      // AccountPageItem(
                      //   title: 'Responsible Gambling',
                      //   onTap: () {},
                      //   isBottom: true,
                      // ),
                      SizedBox(
                        height: 4.h,
                      ),
                      if (!isGuest)
                        AccountPageItem(
                          title: 'Delete account',
                          onTap: () {
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
}
