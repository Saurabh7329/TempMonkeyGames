part of 'place_betslib_bloc.dart';

@freezed
class PlaceBetslibState with _$PlaceBetslibState {
  const factory PlaceBetslibState.initial() = _Initial;
  const factory PlaceBetslibState.loading() = _Loading;
  const factory PlaceBetslibState.error({required String message}) = _Error;
  const factory PlaceBetslibState.success() = _Success;
}
