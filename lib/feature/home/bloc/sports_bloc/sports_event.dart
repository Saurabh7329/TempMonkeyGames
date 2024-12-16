part of 'sports_bloc.dart';

@freezed
class SportsEvent with _$SportsEvent {
  const factory SportsEvent.getSports() = _GetSports;
  const factory SportsEvent.onSportSelected(Sport sport) = _OnSportSelected;
}
