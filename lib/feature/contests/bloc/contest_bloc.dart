import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/domain/contest/contest.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/contests/repo/contests_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:global_snack_bar/global_snack_bar.dart';
import 'package:injectable/injectable.dart';

part 'contest_event.dart';
part 'contest_state.dart';
part 'contest_bloc.freezed.dart';

@injectable
class ContestBloc extends Bloc<ContestEvent, ContestState> {
  ContestBloc(this._contestsRepo)
      : super(const ContestState.idle(isLoading: true)) {
    on<_GetContests>(_mapGetContestsEventToState);
    on<_JoinContest>(_mapJoinContestEventToState);
  }

  final ContestsRepo _contestsRepo;

  Future<void> _mapGetContestsEventToState(
    _GetContests event,
    Emitter<ContestState> emit,
  ) async {
    final failureOrContests = await _contestsRepo.getContests();
    failureOrContests.fold(
      (failure) => emit(
        ContestState.idle(
          errorMessage: failure.message ?? failure.toMessage(),
          isLoading: false,
        ),
      ),
      (contests) => emit(
        ContestState.success(
          contests: contests,
          isLoading: false,
        ),
      ),
    );
  }

  Future<void> _mapJoinContestEventToState(
    _JoinContest event,
    Emitter<ContestState> emit,
  ) async {
    emit(const ContestState.idle(isLoading: true));
    final failureOrResult =
        await _contestsRepo.joinContest(contestId: event.contestId);
    failureOrResult.fold((failure) {
      add(const ContestEvent.getContests());
      GlobalSnackBarBloc.showMessage(
        GlobalMsg("Cannot join this consent. Please try again later",
            bgColor: AppColors.red),
      );
    }, (result) {
      add(const ContestEvent.getContests());
      if (result == false) {
        GlobalSnackBarBloc.showMessage(
          GlobalMsg("Cannot join this consent. Please try again later",
              bgColor: AppColors.red),
        );
      }
    });
  }
}
