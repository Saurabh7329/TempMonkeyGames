import 'package:json_annotation/json_annotation.dart';
part 'notification_data.g.dart';

@JsonSerializable()
class NotificationData {
  String? type;
  String? title;
  String? message;
  String? cta;
  String? ctaType;

  NotificationData(
      {this.type, this.title, this.message, this.cta, this.ctaType});

       factory NotificationData.fromJson(Map<String, dynamic> json) => _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);

  @override
  String toString() {
    return 'NotificationData{type: $type, title: $title, message: $message, cta: $cta, ctaType: $ctaType}';
  }
}