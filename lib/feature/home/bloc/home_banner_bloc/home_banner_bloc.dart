import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/local_storage/local_storage_service.dart';
import 'home_banner_event.dart';
import 'home_banner_state.dart';

class HomeBannerBloc extends Bloc<HomeBannerEvent, HomeBannerState> {
  HomeBannerBloc() : super(const HomeBannerInitial()) {
    on<FetchDataEvent>((event, emit) async {
      final query = event.query;
      emit(const HomeBannerLoading());

      try {
        final configuration = LocalStorage.getConfiguration(CONFIGURATION);

        if (configuration != null && configuration.promotions.isNotEmpty) {
          for (var item in configuration.promotions) {
            if (!item.geoFlagged && query == item.key) {
                emit(HomeBannerLoaded(item.image!, item.link));
                return;
            }
          }
        }
        emit(const HomeBannerError("Not Found"));
      } catch (error) {
        emit(HomeBannerError(error.toString()));
      }
    });
  }
}
