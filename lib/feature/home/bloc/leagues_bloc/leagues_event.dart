part of 'leagues_bloc.dart';

@freezed
class LeaguesEvent with _$LeaguesEvent {
  const factory LeaguesEvent.getLeagues() = _GetLeagues;
  const factory LeaguesEvent.onLeagueSelected(League sport) = _OnLeagueSelected;
}
