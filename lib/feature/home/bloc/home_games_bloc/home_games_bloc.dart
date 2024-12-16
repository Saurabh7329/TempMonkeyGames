import 'package:bloc/bloc.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/home/repo/main_free_play_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_games_event.dart';
part 'home_games_state.dart';
part 'home_games_bloc.freezed.dart';

@injectable
class HomeGamesBloc extends Bloc<HomeGamesEvent, HomeGamesState> {
  HomeGamesBloc(this._mainFreePlayRepo)
      : super(const HomeGamesState.initial(false)) {
    on<_GetGames>(_mapGetGamesEventToState);
  }

  final MainFreePlayRepo _mainFreePlayRepo;

  Future<void> _mapGetGamesEventToState(
    _GetGames event,
    Emitter<HomeGamesState> emit,
  ) async {
    emit(const HomeGamesState.initial(true));
    final failureOrGames =
        await _mainFreePlayRepo.getFeaturedGames(legue: event.league);
    failureOrGames.fold(
      (failure) => emit(
        HomeGamesState.error(
          message: failure.message ?? failure.toMessage(),
          isLoading: false,
        ),
      ),
      (games) => emit(
        HomeGamesState.success(
          games: games,
          isLoading: false,
        ),
      ),
    );
  }
}
