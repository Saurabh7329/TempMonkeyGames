part of 'home_view.dart';


class _Header extends StatelessWidget {
  final bool isNotificationAvailable;
  var walletBalance;

  _Header({required this.isNotificationAvailable, this.walletBalance});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 191.h,
      padding: EdgeInsets.only(bottom: 18.h),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        color: AppColors.lightNaviBlue,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 12),
            blurRadius: 12,
            spreadRadius: -6,
            color: Color.fromRGBO(0, 0, 0, 0.16),
          ),
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 1,
            color: Color.fromRGBO(0, 0, 0, 0.4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Leagues',
                  style: AppTextStyle.titleM,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Balance',  // Add your desired text here
                          style: AppTextStyle.semibold12.copyWith(color: AppColors.whiteColor),
                        ),
                        BalanceTextWidget(prefix: "", amount: walletBalance),
                      ],
                    ),
                    /*Text(
                      'Balance \n🟡$walletBalance',  // Add your desired text here
                      style: AppTextStyle.semibold12.copyWith(color: AppColors.whiteColor),
                    ),*/
                    SizedBox(width: 8.w),  // Add some space between text and icon
                    GestureDetector(
                      onTap: () {
                        context.router.push(NotificationPageRoute());
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 40.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.darkNaviBlue,
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/icons/bell.svg',
                              height: 32.w,
                              width: 32.w,
                            ),
                          ),
                          isNotificationAvailable ? Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 10.w, // Adjust the size of the dot as needed
                              height: 10.w, // Adjust the size of the dot as needed
                              decoration: const BoxDecoration(
                                color: AppColors.red, // Color of the dot
                                shape: BoxShape.circle,
                              ),
                            ),
                          ) : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          BlocConsumer<LeaguesBloc, LeaguesState>(
            listener: (context, state) {
              if (state.status.isSuccess && state.selectedLeague == null) {
                if (state.leagues.isNotEmpty) {
                  // Automatically select the first league if no league is selected
                  final firstLeague = state.leagues.first;
                  context.read<LeaguesBloc>().add(
                      LeaguesEvent.onLeagueSelected(firstLeague));
                  context.read<HomeGamesBloc>().add(
                      HomeGamesEvent.getGames(league: firstLeague));
                } else {
                  context.read<HomeGamesBloc>().add(const HomeGamesEvent.getGames());
                }
              }
            },
            builder: (context, state) {
              final leagues = state.leagues;
              final selectedLeague = state.selectedLeague;
              HomeView.currentLeague = state.selectedLeague;
              return state.status.isSuccess
                  ? SizedBox(
                height: 66.w,
                child: ShaderMask(
                  blendMode: BlendMode.dstOut,
                  shaderCallback: (Rect rect) {
                    return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.lightNaviBlue,
                          Colors.transparent,
                          Colors.transparent,
                          AppColors.lightNaviBlue,
                        ],
                        stops: [
                          0,
                          0,
                          0.85,
                          0.98
                        ]).createShader(rect);
                  },
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: leagues.length,
                    separatorBuilder: (_, __) => SizedBox(width: 8.w),
                    itemBuilder: (context, index) {
                      final league = leagues[index];
                      return LeagueTabWidget(
                        league: league,
                        onTap: () => context
                          ..read<LeaguesBloc>()
                              .add(LeaguesEvent.onLeagueSelected(league))
                          ..read<HomeGamesBloc>().add(
                              HomeGamesEvent.getGames(league: league)),
                        isActive: league == selectedLeague,
                      );
                    },
                  ),
                ),
              )
                  : SizedBox(
                height: 66.w,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.red,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
