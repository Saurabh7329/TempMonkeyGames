import 'package:auto_route/auto_route.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/di/injections.dart';
import 'package:freeplay/core/domain/configuration.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/betslip/view/pages/betslip_view.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/common/spacers/column_spacer.dart';
import 'package:freeplay/feature/common/spacers/row_spacer.dart';
import 'package:freeplay/feature/home/bloc/home_games_bloc/home_games_bloc.dart';
import 'package:freeplay/feature/home/bloc/leagues_bloc/leagues_bloc.dart';
import 'package:freeplay/feature/home/bloc/wager_bloc/wager_bloc.dart';
import 'package:freeplay/feature/home/view/local_widgets/game_card_widget.dart';
import 'package:freeplay/feature/home/view/local_widgets/league_tab_widget.dart';
import 'package:freeplay/feature/home/view/pages/home_page.dart';
import 'package:global_snack_bar/global_snack_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/domain/league/league.dart';
import '../../../../account/bloc/account_bloc.dart';
import '../../../../common/app_loading.dart';
import '../../../../common/basic_app_widget.dart';
import '../../../bloc/home_banner_bloc/home_banner_bloc.dart';
import '../../../bloc/home_banner_bloc/home_banner_event.dart';
import '../../../bloc/home_banner_bloc/home_banner_state.dart';
import '../../../bloc/notification_bloc/notification_bloc.dart';
import '../../local_widgets/balance_text_widget.dart';
import '../../local_widgets/dynamic_image_view.dart';

part 'header.dart';

class HomeView extends StatefulWidget {
  static League? currentLeague;

  final Function(int) callback;

  const HomeView({Key? key, required this.callback}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Promotion? promotion;
  late PanelController _panelController;
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var walletBalance = "";
  final _currencyFormatter = CurrencyTextInputFormatter.currency(
    locale: 'en',
    decimalDigits: 0,
    symbol: '',

  );
  static bool _dialogShow = false;

  @override
  void initState() {
    super.initState();
    _panelController = PanelController();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    registerController();
    checkAffiliateDialog();
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.getNotifications(false));
    context.read<HomeBannerBloc>().add(const FetchDataEvent("home_banner"));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> registerController() async {
    if (getIt.isRegistered<PanelController>()) {
      await getIt.unregister<PanelController>();
    }
    getIt.registerSingleton<PanelController>(_panelController);
  }

  Future<void> _refreshGames() async {
    context
        .read<HomeGamesBloc>()
        .add(HomeGamesEvent.getGames(league: HomeView.currentLeague));
  }

  String calcPayout({required double value, required double valueForHundred}) {
    final temp = ((value * valueForHundred) / 100).round();
    return _currencyFormatter.format.format(temp);
  }

  void checkAffiliateDialog() {
    if (_dialogShow == false) {
      _dialogShow = true;
      int type = 0;
      promotion = LocalStorage.getBannerPromotion(PROMOTION);
      if (promotion?.link.toLowerCase() == "affiliatescreen") {
        type = 1;
      } else if (promotion?.link.toLowerCase() == "signup") {
        type = 2;
      }
      if (type != 0) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showRoundedDialog(context, type);
        });
      }
    }
  }

  void showRoundedDialog(BuildContext context, int type) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return buildRoundedDialog(context, type);
      },
    );
  }

  Widget buildRoundedDialog(BuildContext context, int type) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        backgroundColor: AppColors.darkNaviBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
                child: Image.asset(
                  'assets/images/dialog_images/game_mode_image.png',
                  // Background image
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 0), // Margin between image and first button
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          if (type == 1) {
                            widget.callback(2);
                          } else if (type == 2) {
                            context.router.push(SignUpViewRoute());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the value as needed
                            ),
                            backgroundColor: AppColors.red),
                        child: Text(
                          'Checkout Deals',
                          style: AppTextStyle.semibold12
                              .copyWith(color: AppColors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the value as needed
                            ),
                            backgroundColor: AppColors.darkNaviBlue),
                        child: Text(
                          'Continue Playing',
                          style: AppTextStyle.semibold12
                              .copyWith(color: AppColors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GlobalMsgWrapper(
        BasicAppWidget(
          showBack: false,
          hasAppBar: false,
          scaffoldKey: _scaffoldKey,
          customHeight: MediaQuery.of(context).size.height * 0.95,
          content: BlocBuilder<AccountBloc, AccountState>(
            bloc: getIt<AccountBloc>()..add(const AccountEvent.getUser()),
            builder: (context, state) {
              return state.map(idle: (value) {
                walletBalance = value.user.wallet.toString();
                return
                  GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SlidingUpPanel(
                    minHeight: 0,
                    maxHeight: _focusNode.hasFocus ? 220.h : 270.h,
                    color: AppColors.darkNaviBlue,
                    controller: _panelController,
                    onPanelClosed: () {
                      context.read<WagerBloc>().add(const WagerEvent.stop());
                      _textEditingController.clear();
                      FocusScope.of(context).unfocus();
                    },
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    padding: EdgeInsets.zero,
                    body: Column(
                      children: [
                        BlocBuilder<NotificationBloc, NotificationState>(
                            builder: (context, state) {
                          return state.map(loading: (value) {
                            return _Header(
                                isNotificationAvailable: false,
                                walletBalance: walletBalance);
                          }, error: (value) {
                            return _Header(
                                isNotificationAvailable: false,
                                walletBalance: walletBalance);
                          }, success: (value) {
                            if (value.notifications.isNotEmpty) {
                              return _Header(
                                  isNotificationAvailable: true,
                                  walletBalance: walletBalance);
                            } else {
                              return _Header(
                                  isNotificationAvailable: false,
                                  walletBalance: walletBalance);
                            }
                          });
                        }),
                        BlocBuilder<HomeBannerBloc, HomeBannerState>(
                          builder: (context, state) {
                            if (state is HomeBannerInitial) {
                              return const SizedBox(); // Show loading indicator
                            } else if (state is HomeBannerLoading) {
                              return const SizedBox(); // Show loading text
                            } else if (state is HomeBannerLoaded) {
                              return DynamicImageView(
                                imageUrl: state.image,
                                actionLink: state.link,
                                launchMode: LaunchMode.externalApplication,
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
                        BlocBuilder<HomeGamesBloc, HomeGamesState>(
                          builder: (context, state) {
                            return state.when(
                              initial: (isLoading) {
                                return isLoading
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.red,
                                          ),
                                        ),
                                      )
                                    : const SizedBox();
                              },
                              error: (message, _) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Center(
                                    child: Text(message),
                                  ),
                                );
                              },
                              success: (games, _) {
                                return Expanded(
                                  child: RefreshIndicator(
                                    onRefresh: _refreshGames,
                                    // Define this method in your state
                                    child: games.isEmpty
                                        ? ListView(
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            // Always allow scrolling
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 16.h),
                                                  child: Text(
                                                    'Off season',
                                                    style: AppTextStyle.titleM
                                                        .copyWith(
                                                      color:
                                                          AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : ListView(
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            // Always allow scrolling
                                            padding: EdgeInsets.only(
                                              top: 16.h,
                                              left: 20,
                                              right: 20,
                                              bottom: kToolbarHeight,
                                            ),
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Featured Games',
                                                    style: AppTextStyle.titleM
                                                        .copyWith(
                                                      color:
                                                          AppColors.black,
                                                    ),
                                                  ),
                                                  /*Text(
                                                    'View all',
                                                    style: AppTextStyle
                                                        .semibold12
                                                        .copyWith(
                                                      color: AppColors
                                                          .red,
                                                    ),
                                                  ),*/
                                                ],
                                              ),
                                              ColumnSpacer(4.h),
                                              ...games.map((e) {
                                                return GameCardWidget(
                                                  e,
                                                  margin: EdgeInsets.only(
                                                    top: 8.h,
                                                    bottom: 8.h,
                                                  ),
                                                );
                                              }).toList(),
                                            ],
                                          ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    panel: _panel(),
                  ),
                );
              }, loading: (value) {
                return const AppLoading();
              });

            },
          ),
        ),
      ),
    );
  }


  Widget _panel() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -12),
            blurRadius: 12,
            spreadRadius: -6,
            color: Color.fromRGBO(0, 0, 0, 0.16),
          ),
        ],
        color: AppColors.darkNaviBlue,
      ),
      child: BlocConsumer<WagerBloc, WagerState>(
        listener: (context, state) {
          if (state.status.isError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Success!!!')));

            GlobalState.instance.isSwitchedOn = false;
            if (LocalStorage.getInt(BETSLIPCOUNT) != null) {
              var betCount = LocalStorage.getInt(BETSLIPCOUNT)! + 1;
              LocalStorage.setInt(BETSLIPCOUNT, betCount);

              var homePageState = context.findAncestorStateOfType<
                  HomePageState>();
              if (homePageState != null) {
                homePageState.setState(() {
                  homePageState.betslipCount = betCount;
                });
              } else {
                print('HomePageState not found');
              }
            }
          }
        },
        builder: (context, state) {
          final team = state.team == 'home'
              ? state.game?.teams.home.name
              : state.game?.teams.away.name;
          final value = state.team == 'home'
              ? state.game?.odds?.moneyline?.current.homeOdds
              : state.game?.odds?.moneyline?.current.awayOdds;
          final payoutForHundred = state.team == 'home'
              ? state.game?.odds?.moneyline?.current.homeOddsPayout
              : state.game?.odds?.moneyline?.current.awayOddsPayout;
          final amount = double.parse(state.amount == '' ? '0' : state.amount);
          return Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        _panelController.close();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      team ?? '',
                      style: AppTextStyle.body.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      (value ?? 0).isNegative ? '$value' : '+$value',
                      style: AppTextStyle.body.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Winner',
                  style: AppTextStyle.body.copyWith(
                    color: AppColors.purpleLightColor,
                  ),
                ),
                ColumnSpacer(10.h),
                Opacity(
                  opacity: state.status.isLoading ? 0.4 : 1,
                  child: AbsorbPointer(
                    absorbing: state.status.isLoading,
                    child: Column(
                      children: [
                        TextField(
                          controller: _textEditingController,
                          focusNode: _focusNode,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.veryBold14.copyWith(
                            color: AppColors.greyMediumColor,
                          ),
                          onChanged: (value) {
                            // TODO Change C to coin image
                            final value =
                                '${_currencyFormatter.getUnformattedValue()}';
                            context
                                .read<WagerBloc>()
                                .add(WagerEvent.onAmountChanged(value));
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [_currencyFormatter],
                          decoration: InputDecoration(
                            hintText: '0.00',
                            hintStyle: AppTextStyle.veryBold14.copyWith(
                              color: AppColors.greyMediumColor,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.w),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Center(
                                widthFactor: 0,
                                child: Text(
                                  'Wager',
                                  style: AppTextStyle.body.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                            fillColor: AppColors.lightNaviBlue,
                            filled: true,
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none,
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        ColumnSpacer(8.w),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 10.h,
                                  right: 16.w,
                                  left: 16.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: AppColors.lightNaviBlue,
                                ),
                                child: BalanceTextWidget(prefix: " ", amount: " ${_currencyFormatter.format}"),
                                /*Text(
                                  'C ${_currencyFormatter.format(state.amount)}',
                                  style: AppTextStyle.veryBold14.copyWith(
                                    color: AppColors.greyMediumColor,
                                  ),
                                ),*/
                              ),
                            ),
                            RowSpacer(2.w),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 10.h,
                                  right: 16.w,
                                  left: 16.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: AppColors.lightNaviBlue,
                                ),
                                child:
                                BalanceTextWidget(prefix: " ", amount:
                                  calcPayout(
                                    value: amount,
                                    valueForHundred: payoutForHundred ?? 0,
                                  ),
                                ),
                                // Text(
                                //   calcPayout(
                                //     value: amount,
                                //     valueForHundred: payoutForHundred ?? 0,
                                //   ),
                                //   style: AppTextStyle.veryBold14.copyWith(
                                //     color: AppColors.greyMediumColor,
                                //   ),
                                // ),
                              ),
                            ),
                          ],
                        ),
                        ColumnSpacer(8.w),
                        AppElevatedButton(
                          title: 'Add to Wagers',
                          function: () {
                            _panelController.close();
                            context
                                .read<WagerBloc>()
                                .add(const WagerEvent.createWager());
                            _focusNode.unfocus();
                          },
                          isDisabled: state.amount == '',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
