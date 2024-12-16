// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sport _$SportFromJson(Map<String, dynamic> json) => Sport(
      id: json['id'] as int,
      name: json['name'] as String,
      shortName: json['short_name'] as String,
    );

Map<String, dynamic> _$SportToJson(Sport instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_name': instance.shortName,
    };
