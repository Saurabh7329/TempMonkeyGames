part of 'match_details_page.dart';

class _Panel extends StatefulWidget {
  const _Panel({
    Key? key,
    required this.gameID,
  }) : super(key: key);
  final int gameID;

  @override
  State<_Panel> createState() => _PanelState();
}

class _PanelState extends State<_Panel> {
  late ValueNotifier<double> amount;
  @override
  void initState() {
    super.initState();
    amount = ValueNotifier<double>(25);
  }

  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        color: AppColors.lightNaviBlue,
      ),
      child: BlocConsumer<MatchDetailsWagerBloc, MatchDetailsWagerState>(
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
            }
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              top: 16.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Opacity(
              opacity: state.status.isLoading ? 0.4 : 1,
              child: AbsorbPointer(
                absorbing: state.status.isLoading,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: amount,
                      builder: (context, double v, _) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 21),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                      color: AppColors.lightNaviBlue,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (amount.value >= 30) {
                                              amount.value -= 5;
                                            } else if (amount.value > 25 &&
                                                amount.value < 30) {
                                              amount.value = 25;
                                            } else {}
                                          },
                                          icon: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors
                                                  .lightNaviBlue,
                                            ),
                                            alignment: Alignment.center,
                                            child: const Icon(
                                              Icons.remove,
                                              color: AppColors.red,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        BalanceTextWidget(prefix: " ", amount: "${amount.value}"),
                                        /*Text(
                                          '$coinSymbol ${amount.value}',
                                          style: AppTextStyle.bold14.copyWith(
                                            color: AppColors.whiteColor,
                                          ),
                                        ),*/
                                        IconButton(
                                          onPressed: () {
                                            if (amount.value <= 495) {
                                              amount.value += 5;
                                            } else if (amount.value > 495 &&
                                                amount.value < 500) {
                                              amount.value = 500;
                                            } else {}
                                          },
                                          icon: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors
                                                  .lightNaviBlue,
                                            ),
                                            alignment: Alignment.center,
                                            child: const Icon(
                                              Icons.add,
                                              color: AppColors.red,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 70,
                                    child: Divider(
                                      color: AppColors.red,
                                      height: 1,
                                      thickness: 6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 40,
                              left: 40,
                              child: Slider(
                                divisions: 95,
                                activeColor: AppColors.red,
                                inactiveColor: Colors.transparent,
                                thumbColor: AppColors.red,
                                value: v,
                                min: 25,
                                max: 500,
                                onChanged: (v) => amount.value = v,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    AppElevatedButton(
                      title: 'Add to Wagers',
                      function: () {
                        context.read<MatchDetailsWagerBloc>().add(
                            MatchDetailsWagerEvent.createWager(
                                gameID: widget.gameID, amount: amount.value));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
