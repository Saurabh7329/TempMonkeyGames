// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contest _$ContestFromJson(Map<String, dynamic> json) => Contest(
      id: json['id'] as int?,
      name: json['name'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      image: json['image'] as String?,
      prize: json['prize'] as String?,
      summary: json['summary'] as String?,
      type: json['type'] as String?,
      leader: json['leader'] == null
          ? null
          : Leader.fromJson(json['leader'] as Map<String, dynamic>),
      leaders: (json['leaders'] as List<dynamic>?)
          ?.map((e) => Leader.fromJson(e as Map<String, dynamic>))
          .toList(),
      leaderLabel: json['leaderLabel'] as String?,
    );

Map<String, dynamic> _$ContestToJson(Contest instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'from': instance.from,
      'to': instance.to,
      'image': instance.image,
      'prize': instance.prize,
      'summary': instance.summary,
      'type': instance.type,
      'leader': instance.leader,
      'leaders': instance.leaders,
      'leaderLabel': instance.leaderLabel,
    };
