part of 'place_betslib_bloc.dart';

@freezed
class PlaceBetslibEvent with _$PlaceBetslibEvent {
  const factory PlaceBetslibEvent.place({required int betslibID}) = _Place;
}
