part of 'wager_bloc.dart';

class WagerState extends Equatable {
  /// Is wager bottom sheet panel focused
  final bool isActive;
  final Game? game;
  final String wagerType;
  final String team;
  final String amount;
  final StateStatus status;
  final String errorMessage;
  const WagerState({
    this.isActive = false,
    this.game,
    this.wagerType = '',
    this.team = '',
    this.amount = '',
    this.status = StateStatus.initial,
    this.errorMessage = '',
  });

  WagerState copyWith({
    bool? isActive,
    Game? game,
    String? wagerType,
    String? team,
    String? amount,
    StateStatus? status,
    String? errorMessage,
  }) {
    return WagerState(
      isActive: isActive ?? this.isActive,
      game: game ?? this.game,
      wagerType: wagerType ?? this.wagerType,
      team: team ?? this.team,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        isActive,
        game,
        wagerType,
        team,
        amount,
        status,
        errorMessage,
      ];
}
