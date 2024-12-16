part of 'notification_bloc.dart';


@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.error({
    required String message,
  }) = _Error;
  const factory NotificationState.success({
    required List<NotificationData> notifications,
  }) = _Success;
}
