part of 'contest_bloc.dart';

@freezed
class ContestEvent with _$ContestEvent {
  const factory ContestEvent.getContests() = _GetContests;
  const factory ContestEvent.joinContest({required String contestId}) = _JoinContest;
}