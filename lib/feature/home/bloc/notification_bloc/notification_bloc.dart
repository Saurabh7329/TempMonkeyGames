import 'package:bloc/bloc.dart';
import 'package:freeplay/core/domain/notification/notification.dart';
import 'package:freeplay/core/domain/notification_data/notification_data.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/home/repo/main_free_play_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(this._mainFreePlayRepo)
      : super(const NotificationState.loading()) {
    on<_GetNotifications>(_mapGetNotificationsEventToState);
  }

  final MainFreePlayRepo _mainFreePlayRepo;

  Future<void> _mapGetNotificationsEventToState(
    _GetNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.loading());
    final failureOrNotifications = await _mainFreePlayRepo.getNotifications(event.isRead);
    failureOrNotifications.fold(
      (failure) => emit(
        NotificationState.error(
          message: failure.message ?? failure.toMessage(),
        ),
      ),
      (notifications) {
        List<NotificationData> data = [];
        for (var element in notifications) {
            data.add(element.data!);
          }
         emit(
        NotificationState.success(
          notifications: data,
        ),
      );}
    );
  }
}
