import 'package:bloc/bloc.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/betslip/repo/betslip_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'place_betslib_event.dart';
part 'place_betslib_state.dart';
part 'place_betslib_bloc.freezed.dart';

@injectable
class PlaceBetslibBloc extends Bloc<PlaceBetslibEvent, PlaceBetslibState> {
  PlaceBetslibBloc(this._betslipRepo) : super(const _Initial()) {
    on<_Place>(_mapPlaceEventToState);
  }

  final BetslipRepo _betslipRepo;

  Future<void> _mapPlaceEventToState(
    _Place event,
    Emitter<PlaceBetslibState> emit,
  ) async {
    emit(const PlaceBetslibState.loading());
    final failureOrSuccess = await _betslipRepo.closeBetslip(event.betslibID);
    failureOrSuccess.fold(
      (failure) => emit(PlaceBetslibState.error(
        message: failure.message ?? failure.toMessage(),
      )),
      (_) => emit(const PlaceBetslibState.success()),
    );
  }
}
