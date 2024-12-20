import 'dart:convert';
import 'dart:ffi';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/betslip/bloc/betslips_bloc/betslips_bloc.dart';
import 'package:freeplay/feature/betslip/bloc/place_betslib_bloc/place_betslib_bloc.dart';
import 'package:freeplay/feature/betslip/view/local_widgets/parlay_wager_card_widget.dart';
import 'package:freeplay/feature/betslip/view/local_widgets/straight_wager_card_widget.dart';
import 'package:freeplay/feature/betslip/view/pages/picks_view.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/common/spacers/column_spacer.dart';
import 'package:freeplay/feature/common/spacers/row_spacer.dart';
import 'package:freeplay/feature/home/view/local_widgets/dynamic_image_view.dart';
import 'package:freeplay/feature/home/view/pages/home_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;


import '../../../../core/constants/constants.dart';
import '../../../../core/local_storage/local_storage_service.dart';
import '../../../home/bloc/home_banner_bloc/home_banner_bloc.dart';
import '../../../home/bloc/home_banner_bloc/home_banner_event.dart';
import '../../../home/bloc/home_banner_bloc/home_banner_state.dart';
import '../../../home/view/local_widgets/balance_text_widget.dart';

part 'parlay.dart';

part 'straight.dart';

class BetslibView extends StatefulWidget {
  const BetslibView({Key? key}) : super(key: key);

  @override
  State<BetslibView> createState() => _BetslibViewState();
}

class _BetslibViewState extends State<BetslibView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ValueNotifier<int> _tabState;
  static bool _isBetIdFetched = false;
  int betId = 0;

  void navigateToPicks() {
    var homePageState = context.findAncestorStateOfType<HomePageState>();
    if (homePageState != null) {
      homePageState.navigateAndSetPicksTab();
    } else {
      print('HomePageState not found');
    }
  }

  @override
  void initState() {
    super.initState();
    _isBetIdFetched = false;
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabState = ValueNotifier<int>(0);
    _tabController.addListener(() async {
      if (betId != 0) {
        _isBetIdFetched = true;
      _tabState.value = _tabController.index;
      context.read<BetslipsBloc>().add(
        BetslipsEvent.changeTypeToParlay(
          id: betId,
          type: _tabController.index == 0 ? "straight" : "parlay",
        ),
      );
      } else {
        context.read<BetslipsBloc>().add(
          BetslipsEvent.refreshBetslips()
        );
        await Future.delayed(const Duration(seconds: 2));
      }
    });
    context.read<HomeBannerBloc>().add(const FetchDataEvent("betslip_banner"));
  }


  Future<void> callAuthApi() async {
    final loginToken = LocalStorage.getString(SHARED_PREFS_ACCESS_TOKEN);
    if (loginToken != null) {
      print('AuthBuilder callAuthApi=============> $loginToken');
      final response = await http.get(
        Uri.parse('${dotenv.env['ENDPOINT']}auth'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $loginToken',
          'app-api-key': dotenv.env['APP_API_KEY']!,
        },
        /*body: jsonEncode(<String, String>{
        'device_token': token,
      }),*/
      );
      print('AuthBuilder callAuthApi=============> ${response.statusCode}');
      print('AuthBuilder callAuthApi=============> ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final wallet = data['data']['wallet'];
        final user = User.fromJson(
            jsonDecode(LocalStorage.getString(Freeplay_User)!));
        user.wallet = wallet.toString();
        await LocalStorage.setString(
            Freeplay_User, jsonEncode(user));
        print('callAuthApi successfully');
      } else {
        //throw Exception('Failed to callAuthApi');
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BetslipsBloc, BetslipsState>(
      listener: (context, state) {
        if (state.deletingStatus.isSuccess || state.deletingStatus.isError) {
          Navigator.pop(context);
          if (state.deletingStatus.isError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        }
        if (state.refreshStatus.isError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state.refreshStatus.isSuccess) {
          if (Navigator.canPop(context)) {
            Navigator.popUntil(context, ModalRoute.withName('HomePageRoute'));
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.whities,
        appBar: AppBar(

          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Bet slip',
            style: AppTextStyle.titleS.copyWith(
              color: AppColors.whities,
            ),
          ),
          actions: [
            BlocBuilder<BetslipsBloc, BetslipsState>(
              builder: (context, state) {
                final straightBetslips = state.straightBetslips;
                final parlayBetslips = state.parlayBetslips;
                final isEmpty =
                    straightBetslips.isEmpty && parlayBetslips.isEmpty;
                betId = state.betId;

                if (betId != 0 && _isBetIdFetched == false) {
                  _isBetIdFetched = true;
                  context.read<BetslipsBloc>().add(
                    BetslipsEvent.changeTypeToParlay(
                      id: betId,
                      type: _tabController.index == 0 ? "straight" : "parlay",
                    ),
                  );
                }

                return ValueListenableBuilder(
                  valueListenable: _tabState,
                  builder: (context, int value, _) {
                    return  const SizedBox();
                  },
                );
              },
            ),
          ],
          backgroundColor: AppColors.lightNaviBlue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
              currentState != previousState, // Only rebuild on state change
            ),
            _tabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  _Straight(),
                  _Parlay(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 49.h,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: AppColors.lightNaviBlue,
                    ),
                    right: BorderSide(
                      width: 0.5,
                      color: AppColors.lightNaviBlue,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 49.h,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: AppColors.lightNaviBlue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        TabBar(
          controller: _tabController,
          indicatorColor: AppColors.black,
          padding: EdgeInsets.zero,
          labelStyle: AppTextStyle.veryBold14.copyWith(),
          labelColor: AppColors.black,
          unselectedLabelStyle: AppTextStyle.bodyS.copyWith(),
          unselectedLabelColor: AppColors.greyMediumColor,
          tabs: [
            Tab(
              height: 48.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('STRAIGHT'),
                  GestureDetector(
                    onTap: () {
                      String? straight =
                          LocalStorage.getConfiguration(CONFIGURATION)
                              ?.data
                              .info
                              .straight
                              .text;
                      if (straight != null) {
                        _showBottomSheet(context, straight);
                        // PopOverWidge t(contentText: straight);
                      }
                    },
                    child: const Row(
                      children: [
                        SizedBox(width: 8),
                        Icon(Icons.info_outline_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Tab(
              height: 48.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('PARLAY'),
                  GestureDetector(
                    onTap: () {
                      String? parlay =
                          LocalStorage.getConfiguration(CONFIGURATION)
                              ?.data
                              .info
                              .parlay
                              .text;
                      if (parlay != null) {
                        _showBottomSheet(context, parlay);
                        // PopOverWidget(contentText: parlay);
                      }
                    },
                    child: const Row(
                      children: [
                        SizedBox(width: 8),
                        Icon(Icons.info_outline_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context, String note) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 8),
                child: Text(
                  note,
                  style: AppTextStyle.bold14.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(64, 0, 64, 48),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            4.0), // Adjust the value as needed
                      ),
                      backgroundColor: AppColors.red),
                  child: Text(
                    'Close',
                    style: AppTextStyle.semibold12
                        .copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}