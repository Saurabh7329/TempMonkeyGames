part of 'leagues_bloc.dart';

class LeaguesState extends Equatable {
  const LeaguesState({
    this.status = StateStatus.initial,
    this.errorMessage = '',
    this.leagues = const [],
    this.selectedLeague,
  });
  final StateStatus status;
  final String errorMessage;
  final List<League> leagues;
  final League? selectedLeague;

  LeaguesState copyWith({
    StateStatus? status,
    String? errorMessage,
    List<League>? leagues,
    League? selectedLeague,
  }) {
    return LeaguesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      leagues: leagues ?? this.leagues,
      selectedLeague: selectedLeague ?? this.selectedLeague,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        leagues,
        selectedLeague,
      ];
}
