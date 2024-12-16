part of 'sports_bloc.dart';

class SportsState extends Equatable {
  const SportsState({
    this.status = StateStatus.initial,
    this.errorMessage = '',
    this.sports = const [],
    this.selectedSport,
  });
  final StateStatus status;
  final String errorMessage;
  final List<Sport> sports;
  final Sport? selectedSport;

  SportsState copyWith({
    StateStatus? status,
    String? errorMessage,
    List<Sport>? sports,
    Sport? selectedSport,
  }) {
    return SportsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      sports: sports ?? this.sports,
      selectedSport: selectedSport ?? this.selectedSport,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        sports,
        selectedSport,
      ];
}
