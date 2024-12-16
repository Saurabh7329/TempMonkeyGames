import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/dio/app_dio.dart';
import 'package:freeplay/core/domain/app_tab.dart';
import 'package:freeplay/core/domain/betslip.dart';
import 'package:freeplay/core/domain/user/user.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/feature/account/bloc/account_bloc.dart';
import 'package:freeplay/feature/betslip/bloc/betslips_bloc/betslips_bloc.dart';
import 'package:freeplay/feature/affiliate/affiliate_view.dart';
import 'package:freeplay/feature/betslip/view/pages/betslip_view.dart';
import 'package:freeplay/feature/betslip/view/pages/picks_view.dart';
import 'package:freeplay/feature/contests/bloc/contest_bloc.dart';
import 'package:freeplay/feature/home/bloc/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';
import 'package:freeplay/feature/home/bloc/configuration_bloc/configuration_bloc.dart';
import 'package:freeplay/feature/home/view/pages/account_view.dart';
import 'package:freeplay/feature/home/view/pages/contest_view.dart';
import 'package:freeplay/feature/home/view/pages/home_view/home_view.dart';
import 'package:freeplay/feature/betslip/bloc/betslips_bloc/betslips_bloc.dart';
import 'package:freeplay/main.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/domain/configuration.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final tabs = [
    AppTab(title: 'Home', image: 'assets/icons/home/home.svg'),
    AppTab(title: 'Contest', image: 'assets/icons/home/contest.svg'),
    AppTab(title: 'Deals', image: 'assets/icons/home/affiliate.svg'),
    AppTab(title: 'Betslip', image: 'assets/icons/home/betslip.svg'),
    AppTab(title: 'Picks', image: 'assets/icons/home/picks-bullseye.svg'),
    AppTab(title: 'Account', image: 'assets/icons/home/account.svg')
  ];

  static List<Widget> screens = [];

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late PageController _pageController;
  late Promotion? _promotion;
  List<Promotion> list = [];

  int _selectedIndex = 0;

  int betslipCount = 0;

  @override
  void initState() {
    super.initState();
    context.read<ContestBloc>().add(const ContestEvent.getContests());
    context.read<AccountBloc>().add(const AccountEvent.getUser());
    context.read<ConfigurationBloc>().add(const ConfigurationEvent.getConfiguration());

    final tokenr = LocalStorage.getString(SHARED_PREFS_ACCESS_TOKEN);
    if (tokenr != null) {
      callAuthApi(tokenr!);
    }
    getBetslipsData();

    if (LocalStorage.getInt(BETSLIPCOUNT) != null){
      betslipCount = LocalStorage.getInt(BETSLIPCOUNT)!;
    }

    _pageController = PageController();
  }


  Future<void> callAuthApi(String loginToken) async {
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
      final user = User.fromJson(jsonDecode(LocalStorage.getString(Freeplay_User)!));
      user.wallet = wallet.toString();
      await LocalStorage.setString(
          Freeplay_User, jsonEncode(user));
      print('callAuthApi successfully');
    } else {
      //throw Exception('Failed to callAuthApi');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void programmaticallyClick(int index) {
    _pageController.jumpToPage(index);
    context.read<BottomNavBarBloc>().add(BottomNavBarEvent.onTap(index));
  }

  void navigateAndSetPicksTab()
  {
    setState(() {
      if(HomePage.tabs.length == 6) {
        _selectedIndex = 4; // Assuming Picks is at index 4
      }
      else{
        _selectedIndex = 3; // Assuming Picks is at index 3
      }
      _pageController.jumpToPage(_selectedIndex);
      context.read<BottomNavBarBloc>().add(BottomNavBarEvent.onTap(_selectedIndex));

    });
  }

  void _navigateAndSetTab()
  {
    setState(() {
      if(HomePage.tabs.length == 6) {
        _selectedIndex = 3; // Assuming Betslip is at index 3
      }
      else{
        _selectedIndex = 2; // Assuming Betslip is at index 2
      }
      _pageController.jumpToPage(_selectedIndex);
      context.read<BottomNavBarBloc>().add(BottomNavBarEvent.onTap(_selectedIndex));

    });
  }

  void _onFloatingBtnItemTapped() {

    setState(){
      _selectedIndex = 2;
      _pageController.jumpToPage(2);
      context.read<BottomNavBarBloc>().add(BottomNavBarEvent.onTap(2));
    };
  }

  _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
          if (LocalStorage.getInt(BETSLIPCOUNT) != null){
            betslipCount = LocalStorage.getInt(BETSLIPCOUNT)!;
          }
      }
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void getBetslipsData() async {
    try {
      final response = await AppDio().getRequest(
        path: '/betslips',
        queryParameters: {
          'primary': 1,
          'timezone': timezone,
          'fields_basic': 'odds,teams',
        },
      );
      if (response.statusCode == 200) {
        var jsonList = response.data['data'] as List;
        if (jsonList.length > 0) {
          var betID = jsonList[0]["id"] as int;
          getBetslipDatabyID(betID);
        }
        else {
          setState(() {
            betslipCount = 0;
            LocalStorage.setInt(BETSLIPCOUNT, 0);
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void getBetslipDatabyID(int betID) async {
    try {
      final response = await AppDio().patchRequest(
        path: '/betslips/${betID}',
        data: {'type': 'straight'},
        queryParameters: {
          'fields': 'teams',
          'timezone': timezone,
        },
      );
      if (response.statusCode == 200) {
        var jsonList = Betslip.fromJson(response.data['data']);
        setState(() {
          betslipCount = jsonList.wagers.length;
          LocalStorage.setInt(BETSLIPCOUNT, betslipCount);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (LocalStorage.getInt(BETSLIPCOUNT) != null){
      betslipCount = LocalStorage.getInt(BETSLIPCOUNT)!;
    }
    return WillPopScope(
      onWillPop: () async => false,
      child:
      BlocBuilder<ConfigurationBloc, ConfigurationState>(
          builder: (context, configStat) {
        return configStat.when(initial: (isLoading) {
          return isLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.red,
                    ),
                  ),
                )
              : const SizedBox();
        }, error: (message, _) {


          LocalStorage.clear(blacklist: [CONFIGURATION, PROMOTION]);
          HomePage.tabs.removeWhere((tab) => tab.title == 'Deals');
          HomePage.screens = [
            HomeView(callback: programmaticallyClick),
            const ContestView(),
            const BetslibView(),
            const PicksViewPage(),
            const AccountView(),
          ];
          return _buildBottomNavigationBar(context);
        }, success: (res, _) {
          _promotion = null;
          bool isRealPlayEnable = false;
          LocalStorage.setConfiguration(CONFIGURATION, res);
          LocalStorage.clear(blacklist: [PROMOTION]);
          for (var element in res.promotions) {
            if (element.key == "realplay_popup_1" &&
                element.geoFlagged == false) {
              isRealPlayEnable = true;
               _promotion = element;
              LocalStorage.setBannerPromotion(PROMOTION, element);
              break;
            }
          }
          HomePage.screens = [
            HomeView(callback: programmaticallyClick),
            const ContestView(),
            AffiliateView(promotion: list),
            const BetslibView(),
            const PicksViewPage(),
            const AccountView(),
          ];

          list.clear();
          for (var element in res.promotions) {
            if (element.key
                .contains("affiliate-after-realplay-selection-banner")) {
              list.add(element);
            }
          }

          // if (_promotion?.link.toLowerCase() != "affiliatescreen") {
          if (!isRealPlayEnable) {
            HomePage.tabs.removeWhere((tab) => tab.title == 'Deals');
            HomePage.screens.removeWhere((tab) => tab is AffiliateView);
          }
          if (list.isEmpty) {
            HomePage.tabs.removeWhere((tab) => tab.title == 'Deals');
            HomePage.screens.removeWhere((tab) => tab is AffiliateView);
          }
          return _buildBottomNavigationBar(context);
        });
      }),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    /*if (LocalStorage.getInt(BETSLIPCOUNT) != null){
      betslipCount = LocalStorage.getInt(BETSLIPCOUNT)!;
    }*/
    if (LocalStorage.getInt(BETSLIPCOUNT) != null) {
      betslipCount = LocalStorage.getInt(BETSLIPCOUNT)!;
      int index = 2;
      if(HomePage.tabs.length == 6){
        index = 3;
      }
      HomePage.tabs[index] = AppTab(
        title: 'Betslip',
        image: 'assets/icons/home/betslip.svg',
        badgeCount: betslipCount,
      );
         // Update the badge count on the Betslip tab
    }
return Scaffold(
  backgroundColor: AppColors.darkNaviBlue,
  extendBody: true,
  bottomNavigationBar: Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(bottom: 0, left: 10.w, right: 10.w),
    decoration: const BoxDecoration(
      color: AppColors.darkNaviBlue,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 6),
          blurRadius: 8,
          spreadRadius: 10,
          color: Color.fromRGBO(0, 0, 0, 0.16),
        ),
      ],
    ),
    child: Material(
        elevation: 0,
        color: AppColors.darkNaviBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        child:BlocBuilder<BottomNavBarBloc, int>(
        builder: (context, _selectedIndex) {
          return BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.transparent,
            showUnselectedLabels: true,
            unselectedLabelStyle: AppTextStyle.menu.copyWith(
              color: AppColors.purpleGreyDarkColor,
            ),
            selectedLabelStyle: AppTextStyle.menu.copyWith(
              color: AppColors.red,
            ),
            unselectedItemColor: AppColors.purpleGreyDarkColor,
            selectedItemColor: AppColors.red,
            items: HomePage.tabs.map((e) {
              return BottomNavigationBarItem(
                icon: Stack(
        clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(
                        e.image,
                        height: 30,
                        width: 30,
                        color: AppColors.purpleGreyDarkColor,
                      ),
                      if (e.badgeCount != null && e.badgeCount! > 0)
                        Positioned(
                          right: -6, // Adjust this value to position the badge
                          top: -6,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 15,
                              minHeight: 15,
                            ),
                            child: Text(
                              '${e.badgeCount}',
                              style: AppTextStyle.bodyXXS
                                  .copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
              activeIcon: Stack(
        clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    e.image,
                    height: 30,
                    width: 30,
                    color: AppColors.red,
                  ),
                  if (e.badgeCount != null && e.badgeCount! > 0)
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 15,
                              minHeight: 15,
                            ),
                            child: Text(
                              '${e.badgeCount}',
                              style: AppTextStyle.bodyXXS
                                  .copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                label: e.title,
              );
            }).toList(),
          );
        })
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => context.read<BottomNavBarBloc>().add(BottomNavBarEvent.onTap(index)),
        children: HomePage.screens,
      ),
      // key point, fab will show in Tab 0, and will hide in others.
      floatingActionButton: _selectedIndex == 0 && this.betslipCount > 0 ?
      Container(
        width: 66, // Increase container width as needed
        height: 66, // Increase container height as needed
        child: Stack(
          alignment: Alignment.center, // Center the button within the container
          children: [
            FloatingActionButton(
              onPressed: _navigateAndSetTab,
              child: SvgPicture.asset(
                'assets/icons/home/betslip.svg',
                height: 24.w,
                width: 24.h,
                color: AppColors.red,
              ),
              backgroundColor: AppColors.darkNaviBlue,
              elevation: 5,
              splashColor: AppColors.red,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.red, // Border color
                  width: 2.0,         // Border width
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Positioned(
              top: -6, // Adjust position as needed to align with top corner
              right: 0, // Adjust position as needed to align with right corner
              child: badges.Badge(
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: AppColors.red,
                ),
                badgeContent: Text(
                  betslipCount.toString(),
                  style: AppTextStyle.bodyXXS.copyWith(color: Colors.white),
                  textAlign: TextAlign.center, // Ensure the text itself is centered
                ),
              ),
            ),
          ],
        ),
      ):SizedBox(),);
  }

}
