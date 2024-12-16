import 'package:freeplay/core/domain/notification_data/notification_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification.g.dart';

@JsonSerializable()
class Notification {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  NotificationData? data;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  Notification(
      {this.id,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.readAt,
      this.createdAt,
      this.updatedAt});

       factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}