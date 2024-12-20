part of 'betslip_view.dart';

class _Straight extends StatelessWidget {
  const _Straight();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BetslipsBloc, BetslipsState>(
      builder: (context, state) {
        if (state.status.isInitial) {
          return const SizedBox();
        } else {
          if (state.status.isLoading) {
            return const Center(
          child: CircularProgressIndicator(
            color: AppColors.red,
          ),
        );
          } else {
            if (state.status.isError) {
              return Center(
          child: Text(state.errorMessage),
        );
            } else {
              if (GlobalState.instance.isSwitchedOn) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SizedBox(
                    height: 80.0,
                    child: AppElevatedButton(
                      title: 'Continue',
                      function: () {
                          GlobalState.instance.isSwitchedOn = false;
                          context
                              .read<BetslipsBloc>()
                              .add(const BetslipsEvent.refreshBetslips());
                          // Add navigation logic to Home screen
                        },
                      ),
                    ),
                      SizedBox(height: 40.h),
                    SizedBox(
                      height: 80.0,
                      child: AppElevatedButton(
                        title: 'My Picks',
                        function: () {
                          // GlobalState.instance.isSwitchedOn = false;
                          var betslibViewState = context.findAncestorStateOfType<_BetslibViewState>();
                          if (betslibViewState != null) {
                            betslibViewState.navigateToPicks();
                          } else {
                            print('HomePageState not found');
                          }
                        },
                      ),
                    ),
                    ],
                  ),
                  ),
                );
              } else {
                if (state.straightBetslips.isNotEmpty) {
                  return const _StraightContent();
                } else {
                  return Center(
                    child: Text(
                      "Betslip is empty",
                      style: AppTextStyle.noDataBetSlip,
                    ),
                  );
                }
              }
            }
          }
        }
      },
    );
  }
}

class _StraightContent extends StatefulWidget {
  const _StraightContent({Key? key}) : super(key: key);

  @override
  State<_StraightContent> createState() => _StraightContentState();
}

class _StraightContentState extends State<_StraightContent> {

  final PanelController _panelController =
  PanelController(); // Add PanelController

  @override
  void initState() {
    super.initState();
    // Open the panel when the screen is loaded and close it after 1 second
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _panelController.open();
      Future.delayed(const Duration(seconds: 1), () {
        _panelController.close();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BetslipsBloc, BetslipsState>(
      listener: (context, state) {
        if (state.refreshStatus.isError || state.deletingStatus.isError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state.deletingStatus.isSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Success!!!')));
        }
      },
      builder: (context, state) {
        final betslib = state.straightBetslips[0];
        LocalStorage.setInt(BETSLIPCOUNT, betslib.wagers.length);
        return GestureDetector(onTap: (){
          if (_panelController.isPanelOpen) {
            _panelController.close();
          } else {
          _panelController.open();
          }
        },
        child: SlidingUpPanel(
          controller: _panelController,
          defaultPanelState: PanelState.CLOSED,
          isDraggable: true,
          minHeight: 105.h,
          maxHeight: 240.h,
          color: AppColors.lightNaviBlue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context
                  .read<BetslipsBloc>()
                  .add(const BetslipsEvent.refreshBetslips());
              await Future.delayed(const Duration(seconds: 2));
            },
            backgroundColor: AppColors.lightNaviBlue,
            color: AppColors.red,
            child: ListView.separated(
              physics: state.straightBetslips[0].wagers.length < 2
                  ? const AlwaysScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: 16.w,
                right: 12.w,
                left: 20.w,
                bottom: state.straightBetslips[0].wagers.length < 2
                    ? 0
                    : MediaQuery.of(context).size.height * .5,
              ),
              itemCount: state.straightBetslips[0].wagers.length,
              separatorBuilder: (_, __) => ColumnSpacer(8.w),
              itemBuilder: (context, index) {
                final wager = state.straightBetslips[0].wagers[index];
                return StraightWagerCardWidget(
                  wager: wager,
                  onDelete: () {
                    showLoader(context);
                    context
                        .read<BetslipsBloc>()
                        .add(BetslipsEvent.deleteWager(wager.id));
                  },
                );
              },
            ),
          ),
          panel: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
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
              color: AppColors.lightNaviBlue,
              border: Border.all(
                color: AppColors.red, // Your desired border color
                width: 2.0,        // Border width
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 8.h,
                left: 20.w,
                right: 20.w,
              ),
              child: BlocConsumer<PlaceBetslibBloc, PlaceBetslibState>(
                listener: (context, placeState) {
                  placeState.whenOrNull(
                    error: (message) => ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message))),
                    success: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Success!!!')));
                      GlobalState.instance.isSwitchedOn = true;
                      LocalStorage.setInt(BETSLIPCOUNT, 0);
                      var betslibViewState = context.findAncestorStateOfType<_BetslibViewState>();
                      if (betslibViewState != null) {
                        betslibViewState.callAuthApi();
                      } else {
                        print('HomePageState not found');
                      }
                      context
                          .read<BetslipsBloc>()
                          .add(const BetslipsEvent.refreshBetslips());
                    },
                  );
                },
                builder: (context, placeState) {
                  return Opacity(
                    opacity: placeState == const PlaceBetslibState.loading()
                        ? 0.4
                        : 1,
                    child: AbsorbPointer(
                      absorbing:
                      placeState == const PlaceBetslibState.loading(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Number of Bets',
                                style: AppTextStyle.bodyS.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Text(
                                '${betslib.wagers.length}',
                                style: AppTextStyle.bodyS.copyWith(
                                  color: AppColors.purpleLightColor,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: const Divider(
                              height: 1,
                              color: AppColors.darkNaviBlue,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Risk',
                                style: AppTextStyle.bodyS.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              BalanceTextWidget(prefix: "", amount: "${betslib.amount.round()}"),
                              /*Text(
                                '🟡${betslib.amount.round()}',
                                style: AppTextStyle.bodyS.copyWith(
                                  color: AppColors.purpleLightColor,
                                ),
                              ),*/
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: const Divider(
                              height: 1,
                              color: AppColors.darkNaviBlue,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Win',
                                style: AppTextStyle.bodyS.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              BalanceTextWidget(prefix: "", amount: "${betslib.toWin.round()}"),
                              /*Text(
                                '🟡${betslib.toWin.round()}',
                                style: AppTextStyle.bodyS.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),*/
                            ],
                          ),
                          ColumnSpacer(12.h),
                          AbsorbPointer(
                            absorbing: state.status.isLoading,
                            child: AppElevatedButton(
                              title: 'Place Wager(s)',
                              function: () {
                                context.read<PlaceBetslibBloc>().add(
                                    PlaceBetslibEvent.place(
                                        betslibID: betslib.id));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),);
      },
    );
  }
}



class GlobalState {
  // Private constructor
  GlobalState._privateConstructor();

  // Singleton instance
  static final GlobalState instance = GlobalState._privateConstructor();

  // Global boolean variable
  bool isSwitchedOn = false;
}