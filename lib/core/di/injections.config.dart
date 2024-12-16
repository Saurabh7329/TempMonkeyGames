// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:freeplay/core/dio/app_dio.dart' as _i3;
import 'package:freeplay/feature/account/bloc/account_bloc.dart' as _i23;
import 'package:freeplay/feature/account/repo/account_repo.dart' as _i17;
import 'package:freeplay/feature/auth/bloc/login_bloc.dart' as _i22;
import 'package:freeplay/feature/auth/repo/auth_repo.dart' as _i8;
import 'package:freeplay/feature/betslip/bloc/betslips_bloc/betslips_bloc.dart'
    as _i5;
import 'package:freeplay/feature/betslip/bloc/bloc/edit_wager_bloc.dart' as _i9;
import 'package:freeplay/feature/betslip/bloc/place_betslib_bloc/place_betslib_bloc.dart'
    as _i13;
import 'package:freeplay/feature/betslip/repo/betslip_repo.dart' as _i4;
import 'package:freeplay/feature/contests/bloc/contest_bloc.dart' as _i19;
import 'package:freeplay/feature/contests/repo/contests_repo.dart' as _i7;
import 'package:freeplay/feature/home/bloc/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart'
    as _i6;
import 'package:freeplay/feature/home/bloc/configuration_bloc/configuration_bloc.dart'
    as _i18;
import 'package:freeplay/feature/home/bloc/home_games_bloc/home_games_bloc.dart'
    as _i20;
import 'package:freeplay/feature/home/bloc/leagues_bloc/leagues_bloc.dart'
    as _i21;
import 'package:freeplay/feature/home/bloc/match_details_wager_bloc/match_details_wager_bloc.dart'
    as _i11;
import 'package:freeplay/feature/home/bloc/notification_bloc/notification_bloc.dart'
    as _i12;
import 'package:freeplay/feature/home/bloc/signup_bloc/signup_bloc.dart'
    as _i14;
import 'package:freeplay/feature/home/bloc/sports_bloc/sports_bloc.dart'
    as _i15;
import 'package:freeplay/feature/home/bloc/wager_bloc/wager_bloc.dart' as _i16;
import 'package:freeplay/feature/home/repo/main_free_play_repo.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AppDio>(() => _i3.AppDio());
  gh.factory<_i4.BetslipRepo>(() => _i4.BetslipRepo(get<_i3.AppDio>()));
  gh.factory<_i5.BetslipsBloc>(() => _i5.BetslipsBloc(get<_i4.BetslipRepo>()));
  gh.factory<_i6.BottomNavBarBloc>(() => _i6.BottomNavBarBloc());
  gh.factory<_i7.ContestsRepo>(() => _i7.ContestsRepo(get<_i3.AppDio>()));
  gh.factory<_i8.DevicePlugin>(() => _i8.DevicePlugin());
  gh.factory<_i9.EditWagerBloc>(
      () => _i9.EditWagerBloc(get<_i4.BetslipRepo>()));
  gh.factory<_i10.MainFreePlayRepo>(
      () => _i10.MainFreePlayRepo(get<_i3.AppDio>()));
  gh.factory<_i11.MatchDetailsWagerBloc>(
      () => _i11.MatchDetailsWagerBloc(get<_i10.MainFreePlayRepo>()));
  gh.factory<_i12.NotificationBloc>(
      () => _i12.NotificationBloc(get<_i10.MainFreePlayRepo>()));
  gh.factory<_i13.PlaceBetslibBloc>(
      () => _i13.PlaceBetslibBloc(get<_i4.BetslipRepo>()));
  gh.factory<_i14.SignUpBloc>(
      () => _i14.SignUpBloc(get<_i10.MainFreePlayRepo>()));
  gh.factory<_i15.SportsBloc>(
      () => _i15.SportsBloc(get<_i10.MainFreePlayRepo>()));
  gh.factory<_i16.WagerBloc>(
      () => _i16.WagerBloc(get<_i10.MainFreePlayRepo>()));
  gh.factory<_i17.AccountRepo>(() => _i17.AccountRepo(get<_i3.AppDio>()));
  gh.factory<_i8.AuthRepo>(() => _i8.AuthRepo(
        get<_i3.AppDio>(),
        deviceInfoPlugin: get<_i8.DevicePlugin>(),
      ));
  gh.factory<_i18.ConfigurationBloc>(
      () => _i18.ConfigurationBloc(get<_i10.MainFreePlayRepo>()));
  gh.factory<_i19.ContestBloc>(() => _i19.ContestBloc(get<_i7.ContestsRepo>()));
  gh.factory<_i20.HomeGamesBloc>(
      () => _i20.HomeGamesBloc(get<_i10.MainFreePlayRepo>()));
  gh.factory<_i21.LeaguesBloc>(
      () => _i21.LeaguesBloc(get<_i10.MainFreePlayRepo>()));
  gh.factory<_i22.LoginBloc>(() => _i22.LoginBloc(repo: get<_i8.AuthRepo>()));
  gh.singleton<_i23.AccountBloc>(_i23.AccountBloc(get<_i17.AccountRepo>()));
  return get;
}
