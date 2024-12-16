part of 'contest_bloc.dart';

@freezed
class ContestState with _$ContestState {
  const factory ContestState.idle(
      {required bool isLoading,
      @Default(false) bool error,
      @Default('') String errorMessage,
      }) = _Idle;
  const factory ContestState.success({
    required List<Contest> contests,
    required bool isLoading,
  }) = _Success;
}
