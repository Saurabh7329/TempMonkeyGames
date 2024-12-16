part of 'wager_bloc.dart';

@freezed
class WagerEvent with _$WagerEvent {
  const factory WagerEvent.start({
    required Game game,
    required String wagerType,
    required String team,
  }) = _Start;
  const factory WagerEvent.stop() = _Stop;
  const factory WagerEvent.onAmountChanged(String? value) = _OnChanged;
  const factory WagerEvent.createWager() = _CreateWager;
}
