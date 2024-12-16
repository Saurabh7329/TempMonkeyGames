import 'package:bloc/bloc.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/home/repo/main_free_play_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/configuration.dart';

part 'configuration_bloc.freezed.dart';

part 'configuration_event.dart';

part 'configuration_state.dart';

@injectable
class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  ConfigurationBloc(this._mainFreePlayRepo)
      : super(const ConfigurationState.initial(false)) {
    on<_GetConfiguration>(_mapGetGamesEventToState);
  }

  final MainFreePlayRepo _mainFreePlayRepo;

  Future<void> _mapGetGamesEventToState(
    _GetConfiguration event,
    Emitter<ConfigurationState> emit,
  ) async {
    emit(const ConfigurationState.initial(true));
    final failureOrGames = await _mainFreePlayRepo.getConfiguration();
    failureOrGames.fold(
      (failure) => emit(
        ConfigurationState.error(
          message: failure.message ?? failure.toMessage(),
          isLoading: false,
        ),
      ),
      (config) => emit(
        ConfigurationState.success(
          isLoading: false,
          configuration: config,
        ),
      ),
    );
  }
}
