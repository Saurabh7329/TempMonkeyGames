part of 'betslips_bloc.dart';

@freezed
class BetslipsEvent with _$BetslipsEvent {
  const factory BetslipsEvent.fetchBetslips() = _FetchBetslips;
  const factory BetslipsEvent.refreshBetslips() = _RefreshBetslips;
  const factory BetslipsEvent.deleteWager(int id) = _DeleteWager;
  const factory BetslipsEvent.changeTypeToParlay({
    required int id,
    required String type,
  }) = _ChangeType;

  const factory BetslipsEvent.clearData() = _ClearData;
}
