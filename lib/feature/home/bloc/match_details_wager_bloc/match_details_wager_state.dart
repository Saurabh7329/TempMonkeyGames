part of 'match_details_wager_bloc.dart';

class MatchDetailsWagerState extends Equatable {
  /// Is wager bottom sheet panel focused
  final bool isActive;
  final String wagerType;

  /// For total wager type there will be over or under
  final String team;
  final String? oddsOption;
  final StateStatus status;
  final String errorMessage;
  const MatchDetailsWagerState({
    this.oddsOption = '',
    this.isActive = false,
    this.wagerType = '',
    this.team = '',
    this.status = StateStatus.initial,
    this.errorMessage = '',
  });

  MatchDetailsWagerState copyWith({
    String? oddsOption,
    bool? isActive,
    String? wagerType,
    String? team,
    StateStatus? status,
    String? errorMessage,
  }) {
    return MatchDetailsWagerState(
      isActive: isActive ?? this.isActive,
      wagerType: wagerType ?? this.wagerType,
      team: team ?? this.team,
      oddsOption: oddsOption ?? this.oddsOption,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        isActive,
        wagerType,
        team,
        oddsOption,
        status,
        errorMessage,
      ];
}
