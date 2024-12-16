part of 'betslips_bloc.dart';

class BetslipsState extends Equatable {
  final StateStatus status;
  final StateStatus deletingStatus;
  final StateStatus refreshStatus;
  final StateStatus changeTypeStatus;
  final String errorMessage;
  final List<Betslip> straightBetslips;
  final List<Betslip> parlayBetslips;
  final int betId;

  const BetslipsState(
      {this.status = StateStatus.initial,
      this.deletingStatus = StateStatus.initial,
      this.refreshStatus = StateStatus.initial,
      this.changeTypeStatus = StateStatus.initial,
      this.errorMessage = '',
      this.straightBetslips = const [],
      this.parlayBetslips = const [],
      this.betId = 0});


  BetslipsState copyWith({
    StateStatus? status,
    StateStatus? deletingStatus,
    StateStatus? refreshStatus,
    StateStatus? changeTypeStatus,
    String? errorMessage,
    List<Betslip>? straightBetslips,
    List<Betslip>? parlayBetslips,
    int? betId,
  }) {
    return BetslipsState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        straightBetslips: straightBetslips ?? this.straightBetslips,
        parlayBetslips: parlayBetslips ?? this.parlayBetslips,
        deletingStatus: deletingStatus ?? this.deletingStatus,
        refreshStatus: refreshStatus ?? this.refreshStatus,
        changeTypeStatus: changeTypeStatus ?? this.changeTypeStatus,
        betId: betId ?? this.betId);
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
        straightBetslips,
        parlayBetslips,
        deletingStatus,
        refreshStatus,
        changeTypeStatus,
        betId
      ];
}
