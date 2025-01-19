import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/enums.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/home/repo/main_free_play_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'match_details_wager_event.dart';
part 'match_details_wager_state.dart';
part 'match_details_wager_bloc.freezed.dart';

@injectable
class MatchDetailsWagerBloc
    extends Bloc<MatchDetailsWagerEvent, MatchDetailsWagerState> {
  MatchDetailsWagerBloc(this._mainFreePlayRepo)
      : super(const MatchDetailsWagerState()) {
    on<_Start>(_mapStartEventToState);
    on<_Stop>(_mapStopEventToState);
    on<_CreateWager>(_mapCreateEventToState);
  }

  final MainFreePlayRepo _mainFreePlayRepo;

  void _mapStartEventToState(
      _Start event, Emitter<MatchDetailsWagerState> emit) {
    return emit(state.copyWith(
      isActive: true,
      wagerType: event.wagerType,
      team: event.team,
      oddsOption: event.oddsOption,
    ));
  }

  void _mapStopEventToState(_Stop event, Emitter<MatchDetailsWagerState> emit) {
    emit(state.copyWith(isActive: false));
  }

  Future<void> _mapCreateEventToState(
    _CreateWager event,
    Emitter<MatchDetailsWagerState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final params = CreateWagerParams(
      gameID: event.gameID,
      team: state.team,
      type: state.wagerType,
      oddsOption: state.oddsOption,
      amount: event.amount.toInt(),
    );
    final failureOrWager = await _mainFreePlayRepo.createWager(params);
    failureOrWager.fold(
      (failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          errorMessage: failure.message ?? failure.toMessage(),
        ));
        emit(state.copyWith(status: StateStatus.initial));
      },
      (wager) {
        emit(state.copyWith(status: StateStatus.success));
        emit(state.copyWith(status: StateStatus.initial));
      },
    );
  }
}
