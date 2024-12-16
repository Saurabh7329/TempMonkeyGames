part of 'home_games_bloc.dart';

@freezed
class HomeGamesState with _$HomeGamesState {
  const factory HomeGamesState.initial(bool isLoading) = _Initial;
  const factory HomeGamesState.error({
    required String message,
    required bool isLoading,
  }) = _Error;
  const factory HomeGamesState.success({
    required List<Game> games,
    required bool isLoading,
  }) = _Success;
}
