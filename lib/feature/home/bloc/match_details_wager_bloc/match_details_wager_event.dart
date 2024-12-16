part of 'match_details_wager_bloc.dart';

@freezed
class MatchDetailsWagerEvent with _$MatchDetailsWagerEvent {
  const factory MatchDetailsWagerEvent.start({
    required String wagerType,
    required String team,
  }) = _Start;
  const factory MatchDetailsWagerEvent.stop() = _Stop;
  const factory MatchDetailsWagerEvent.createWager({
    required int gameID,
    required double amount,
  }) = _CreateWager;
}
