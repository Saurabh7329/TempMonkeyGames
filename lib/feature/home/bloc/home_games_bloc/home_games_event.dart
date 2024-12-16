part of 'home_games_bloc.dart';

@freezed
class HomeGamesEvent with _$HomeGamesEvent {
  const factory HomeGamesEvent.getGames({League? league}) = _GetGames;
}
