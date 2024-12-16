import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeplay/core/domain/betslip_change_type_params.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/enums.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/betslip/repo/betslip_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'betslips_event.dart';
part 'betslips_state.dart';
part 'betslips_bloc.freezed.dart';

@injectable
class BetslipsBloc extends Bloc<BetslipsEvent, BetslipsState> {
  BetslipsBloc(this._betslipRepo) : super(const BetslipsState()) {
    on<_FetchBetslips>(_mapFetchEventToState);
    on<_RefreshBetslips>(_mapRefreshEventToState);
    on<_DeleteWager>(_mapDeleteEventToState);
    on<_ChangeType>(_mapChangeTypeEventToState);
    on<_ClearData>(_mapClearDataEventToState);
  }

  final BetslipRepo _betslipRepo;

  Future<void> _mapFetchEventToState(
    _FetchBetslips event,
    Emitter<BetslipsState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final failureOrBetslips = await _betslipRepo.getBetslips();
    failureOrBetslips.fold(
      (failure) => emit(state.copyWith(
        status: StateStatus.error,
        errorMessage: failure.message ?? failure.toMessage(),
      )),
      (betslips) => emit(state.copyWith(
        status: StateStatus.success,
        straightBetslips: betslips.where((e) => e.type == 'straight').toList(),
        parlayBetslips: betslips.where((e) => e.type == 'parlay').toList(),
        betId: betslips.isNotEmpty ? betslips[0].id : 0
      )),
    );
  }

  Future<void> _mapRefreshEventToState(
    _RefreshBetslips event,
    Emitter<BetslipsState> emit,
  ) async {
    emit(state.copyWith(refreshStatus: StateStatus.loading));
    final failureOrBetslips = await _betslipRepo.getBetslips();
    failureOrBetslips.fold(
      (failure) {
        emit(state.copyWith(
          refreshStatus: StateStatus.error,
          errorMessage: failure.message ?? failure.toMessage(),
        ));
        emit(state.copyWith(refreshStatus: StateStatus.initial));
      },
      (betslips) {
        emit(state.copyWith(
          refreshStatus: StateStatus.success,
          straightBetslips:
              betslips.where((e) => e.type == 'straight').toList(),
          parlayBetslips: betslips.where((e) => e.type == 'parlay').toList(),
          betId: betslips.isNotEmpty ? betslips[0].id : 0
        ));
        emit(state.copyWith(refreshStatus: StateStatus.initial));
      },
    );
  }

  Future<void> _mapDeleteEventToState(
    _DeleteWager event,
    Emitter<BetslipsState> emit,
  ) async {
    final failureOrSuccess = await _betslipRepo.deleteWager(event.id);
    return failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
          deletingStatus: StateStatus.error,
          errorMessage: failure.message ?? failure.toMessage(),
        ));
        emit(state.copyWith(deletingStatus: StateStatus.initial));
      },
      (_) async {
        emit(state.copyWith(refreshStatus: StateStatus.loading));
        final failureOrBetslips = await _betslipRepo.getBetslips();
        return failureOrBetslips.fold(
          (failure) {
            emit(state.copyWith(
              refreshStatus: StateStatus.error,
              deletingStatus: StateStatus.success,
              errorMessage: failure.message ?? failure.toMessage(),
            ));
            emit(state.copyWith(
              refreshStatus: StateStatus.initial,
              deletingStatus: StateStatus.initial,
            ));
          },
          (betslips) {
            emit(state.copyWith(
              refreshStatus: StateStatus.success,
              deletingStatus: StateStatus.success,
              straightBetslips:
                  betslips.where((e) => e.type == 'straight').toList(),
              parlayBetslips:
                  betslips.where((e) => e.type == 'parlay').toList(),
            ));
            emit(state.copyWith(
              refreshStatus: StateStatus.initial,
              deletingStatus: StateStatus.initial,
            ));
          },
        );
      },
    );
  }

  Future<void> _mapChangeTypeEventToState(
    _ChangeType event,
    Emitter<BetslipsState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final params = BetslipChangeTypeParams(
      id: event.id,
      type: event.type,
    );
    final failureOrBetslip = await _betslipRepo.betslipChangeType(params);
    failureOrBetslip.fold(
      (failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          errorMessage: failure.message ?? failure.toMessage(),
        ));
        emit(state.copyWith(status: StateStatus.initial));
      },
      (betlsip) {
        emit(state.copyWith(
          status: StateStatus.success,
          straightBetslips:
              [betlsip].where((e) => e.type == 'straight').toList(),
          parlayBetslips: [betlsip].where((e) => e.type == 'parlay').toList(),
        ));
      },
    );
  }

  void _mapClearDataEventToState(
    _ClearData event,
    Emitter<BetslipsState> emit,
  ) =>
      emit(state.copyWith(straightBetslips: [], parlayBetslips: []));
}
