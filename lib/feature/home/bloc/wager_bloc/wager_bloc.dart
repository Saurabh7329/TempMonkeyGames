import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/enums.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/home/repo/main_free_play_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'wager_event.dart';
part 'wager_state.dart';
part 'wager_bloc.freezed.dart';

@injectable
class WagerBloc extends Bloc<WagerEvent, WagerState> {
  WagerBloc(this._mainFreePlayRepo) : super(const WagerState()) {
    on<_Start>(_mapStartEventToState);
    on<_Stop>(_mapStopEventToState);
    on<_OnChanged>(_mapOnAmountChanged);
    on<_CreateWager>(_mapCreateEventToState);
  }

  final MainFreePlayRepo _mainFreePlayRepo;

  void _mapStartEventToState(_Start event, Emitter<WagerState> emit) {
    return emit(state.copyWith(
      isActive: true,
      game: event.game,
      wagerType: event.wagerType,
      team: event.team,
    ));
  }

  void _mapStopEventToState(_Stop event, Emitter<WagerState> emit) {
    emit(state.copyWith(isActive: false, amount: ''));
  }

  void _mapOnAmountChanged(_OnChanged event, Emitter<WagerState> emit) {
    emit(state.copyWith(amount: event.value));
  }

  Future<void> _mapCreateEventToState(
    _CreateWager event,
    Emitter<WagerState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final params = CreateWagerParams(
      gameID: state.game!.id,
      team: state.team,
      type: state.wagerType,
      amount: double.parse(state.amount).toInt(),
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
