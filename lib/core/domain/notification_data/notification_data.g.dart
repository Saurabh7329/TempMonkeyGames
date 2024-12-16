// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      type: json['type'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      cta: json['cta'] as String?,
      ctaType: json['ctaType'] as String?,
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'cta': instance.cta,
      'ctaType': instance.ctaType,
    };
