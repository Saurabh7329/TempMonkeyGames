// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: json['id'] as String?,
      type: json['type'] as String?,
      notifiableType: json['notifiableType'] as String?,
      notifiableId: json['notifiableId'] as int?,
      data: json['data'] == null
          ? null
          : NotificationData.fromJson(json['data'] as Map<String, dynamic>),
      readAt: json['readAt'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'notifiableType': instance.notifiableType,
      'notifiableId': instance.notifiableId,
      'data': instance.data,
      'readAt': instance.readAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
