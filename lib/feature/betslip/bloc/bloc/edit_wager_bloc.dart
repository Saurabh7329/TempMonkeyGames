import 'package:bloc/bloc.dart';
import 'package:freeplay/core/domain/change_wager_params.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/betslip/repo/betslip_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'edit_wager_event.dart';
part 'edit_wager_state.dart';
part 'edit_wager_bloc.freezed.dart';

@injectable
class EditWagerBloc extends Bloc<EditWagerEvent, EditWagerState> {
  EditWagerBloc(this._betslipRepo)
      : super(const EditWagerState.initial(value: '')) {
    on<_Edit>(_mapEditEventToState);
    on<_OnChange>(_mapOnChangeEventToState);
    on<_Start>(_mapStartEventToState);
  }

  final BetslipRepo _betslipRepo;

  Future<void> _mapEditEventToState(
    _Edit event,
    Emitter<EditWagerState> emit,
  ) async {
    emit(const EditWagerState.loading());
    final params = ChangeWagerParams(
      id: event.wagerID,
      amount: event.amount,
    );
    final failureOrSuccess = await _betslipRepo.changeWager(params);
    failureOrSuccess.fold(
      (failure) {
        emit(EditWagerState.error(
          message: failure.message ?? failure.toMessage(),
        ));
        emit(const EditWagerState.initial(value: ''));
      },
      (_) {
        emit(const EditWagerState.success());
      },
    );
  }

  void _mapOnChangeEventToState(
    _OnChange event,
    Emitter<EditWagerState> emit,
  ) =>
      emit(EditWagerState.initial(value: event.value));

  void _mapStartEventToState(
    _Start event,
    Emitter<EditWagerState> emit,
  ) =>
      emit(const EditWagerState.initial(value: ''));
}
