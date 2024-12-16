import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeplay/core/domain/sport/sport.dart';
import 'package:freeplay/core/enums.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/home/repo/main_free_play_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sports_event.dart';
part 'sports_state.dart';
part 'sports_bloc.freezed.dart';

@injectable
class SportsBloc extends Bloc<SportsEvent, SportsState> {
  SportsBloc(this._mainFreePlayRepo) : super(const SportsState()) {
    on<_GetSports>(_mapGetSportsEventToState);
    on<_OnSportSelected>(_mapOnSelectEventToState);
  }

  final MainFreePlayRepo _mainFreePlayRepo;

  Future<void> _mapGetSportsEventToState(
    _GetSports event,
    Emitter<SportsState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final failureOrSports = await _mainFreePlayRepo.getSports();
    failureOrSports.fold(
      (failure) => emit(
        state.copyWith(
          status: StateStatus.error,
          errorMessage: failure.message ?? failure.toMessage(),
        ),
      ),
      (sports) => emit(
        state.copyWith(
          status: StateStatus.success,
          sports: sports,
          selectedSport: sports.isNotEmpty ? sports[0] : null,
        ),
      ),
    );
  }

  void _mapOnSelectEventToState(
    _OnSportSelected event,
    Emitter<SportsState> emit,
  ) {
    emit(state.copyWith(selectedSport: event.sport));
  }
}
