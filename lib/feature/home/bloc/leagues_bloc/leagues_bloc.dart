import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeplay/core/domain/league/league.dart';
import 'package:freeplay/core/enums.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/home/repo/main_free_play_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'leagues_event.dart';
part 'leagues_state.dart';
part 'leagues_bloc.freezed.dart';

@injectable
class LeaguesBloc extends Bloc<LeaguesEvent, LeaguesState> {
  LeaguesBloc(this._mainFreePlayRepo) : super(const LeaguesState()) {
    on<_GetLeagues>(_mapGetLeaguesEventToState);
    on<_OnLeagueSelected>(_mapOnSelectEventToState);
  }

  final MainFreePlayRepo _mainFreePlayRepo;

  Future<void> _mapGetLeaguesEventToState(
    _GetLeagues event,
    Emitter<LeaguesState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final failureOrLeagues = await _mainFreePlayRepo.getLeagues();
    failureOrLeagues.fold(
      (failure) => emit(
        state.copyWith(
          status: StateStatus.error,
          errorMessage: failure.message ?? failure.toMessage(),
        ),
      ),
      (leagues) => emit(
        state.copyWith(
          status: StateStatus.success,
          leagues: leagues,
        ),
      ),
    );
  }

  void _mapOnSelectEventToState(
    _OnLeagueSelected event,
    Emitter<LeaguesState> emit,
  ) {
    emit(state.copyWith(selectedLeague: event.sport));
  }
}
