part of 'betslip_view.dart';

class _Parlay extends StatelessWidget {
  const _Parlay();

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
                if (state.parlayBetslips.isNotEmpty) {
                  return const _ParlayContent();
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

class _ParlayContent extends StatefulWidget {
  const _ParlayContent({Key? key}) : super(key: key);

  @override
  State<_ParlayContent> createState() => _ParlayContentState();
}

class _ParlayContentState extends State<_ParlayContent> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  final _currencyFormatter = CurrencyTextInputFormatter(
    decimalDigits: 0,
    symbol: '\$',

  );/*CurrencyTextInputFormatter(
    symbol: '\$',
    decimalDigits: 0,
  );*/

  late final Betslip betslib;

  final PanelController _panelController =
  PanelController(); // Add PanelController

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();

    // Open the panel when the screen is loaded and close it after 1 second
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _panelController.open();
      Future.delayed(const Duration(seconds: 1), () {
        if(_panelController.isPanelAnimating) {
          _panelController.close();
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
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
          var homePageState = context.findAncestorStateOfType<HomePageState>();
          if (homePageState != null) {
            homePageState.setState(() {
              var betCount = LocalStorage.getInt(BETSLIPCOUNT)! - 1;
              if (betCount > 0) {
                LocalStorage.setInt(BETSLIPCOUNT, betCount);
              } else {
                LocalStorage.setInt(BETSLIPCOUNT, 0);
              }
            });;
          }
          else {
            print('HomePageState not found');
          }
        }
      },
      builder: (context, state) {
        final betslib = state.parlayBetslips[0];
        var maxHeight = _focusNode.hasFocus ? 150.h : 200.h;
        if (Platform.isIOS) {
          maxHeight = _focusNode.hasFocus ? 150.h : 220.h;
        }

        return GestureDetector(
          onTap: () => (_panelController.isPanelOpen) ? _panelController.close() : _panelController.open(),
          child: SlidingUpPanel(
            controller: _panelController,
            // Attach PanelController to SlidingUpPanel
            defaultPanelState: PanelState.CLOSED,
            padding: EdgeInsets.zero,
            isDraggable: true,
            minHeight: Platform.isIOS ? 110.h : 90.h,
            maxHeight: maxHeight,
            color: AppColors.lightNaviBlue,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            onPanelClosed: () {
              _textEditingController.clear();
              FocusScope.of(context).unfocus();
            },
            body: RefreshIndicator(
              onRefresh: () async {
                context
                    .read<BetslipsBloc>()
                    .add(const BetslipsEvent.refreshBetslips());
                await Future.delayed(const Duration(seconds: 2));
              },
              backgroundColor: AppColors.lightNaviBlue,
              color: AppColors.whities,
              child: ListView.separated(
                physics: state.parlayBetslips[0].wagers.length < 3
                    ? const AlwaysScrollableScrollPhysics()
                    : const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 16.w,
                  right: 12.w,
                  left: 20.w,
                  bottom: state.parlayBetslips[0].wagers.length < 3
                      ? 0
                      : MediaQuery.of(context).size.height * .5,
                ),
                itemCount: state.parlayBetslips[0].wagers.length,
                separatorBuilder: (_, __) => ColumnSpacer(8.w),
                itemBuilder: (context, index) {
                  final wager = state.parlayBetslips[0].wagers[index];
                  return ParlayWagerCardWidget(
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                boxShadow: const [
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
                          .showSnackBar(
                          SnackBar(content: Text(state.errorMessage))),
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
                                  'Number of Legs',
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
                            ColumnSpacer(12.h),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _textEditingController,
                                    focusNode: _focusNode,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.veryBold14.copyWith(
                                      color: AppColors.greyMediumColor,
                                    ),
                                    // onChanged: (value) {
                                    //   final value =
                                    //       '${_currencyFormatter.getUnformattedValue()}';
                                    //   context
                                    //       .read<WagerBloc>()
                                    //       .add(WagerEvent.onAmountChanged(value));
                                    // },
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    inputFormatters: [_currencyFormatter],
                                    decoration: InputDecoration(
                                      hintText: '🟡${betslib.amount.round()}',
                                      // hintText: BalanceTextWidget(prefix: "", amount: ""${betslib.amount.round().toString()}),
                                      //
                                      hintStyle:
                                      AppTextStyle.veryBold14.copyWith(
                                        color: AppColors.greyMediumColor,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(left: 16.w),
                                        child: Center(
                                          widthFactor: 0,
                                          child: Text(
                                            'Risk',
                                            style: AppTextStyle.bodyXS.copyWith(
                                              color: AppColors.purpleLightColor,
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
                                ),
                                RowSpacer(10.w),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    padding: EdgeInsets.only(
                                      top: 12.h,
                                      bottom: 12.h,
                                      right: 16.w,
                                      left: 16.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: AppColors.lightNaviBlue,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Win',
                                            style: AppTextStyle.bodyXS.copyWith(
                                              color: AppColors.purpleLightColor,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: BalanceTextWidget(prefix: "", amount: "${betslib.toWin.round()}"),
                                            /*Text(
                                            '🟡${betslib.toWin.round()}' ,
                                            // calcPayout(
                                            //   value: amount,
                                            //   valueForHundred: payoutForHundred ?? 0,
                                            // ),
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle.veryBold14
                                                .copyWith(
                                              color: AppColors.greyMediumColor,
                                            ),
                                          ),*/
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ColumnSpacer(8.h),
                            AppElevatedButton(
                              // isDisabled: betslib.wagers.length <= 1 ? true : false,
                              title: 'Place Wager(s)',
                              function: () {
                                if (betslib.wagers.length == 1) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Oops, parlay requires at least 2 matchups.")));
                                }
                                else {
                                _focusNode.unfocus();
                                context.read<PlaceBetslibBloc>().add(
                                    PlaceBetslibEvent.place(
                                        betslibID: betslib.id));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<void> showLoader(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.red,
        ),
      );
    },
  );
}