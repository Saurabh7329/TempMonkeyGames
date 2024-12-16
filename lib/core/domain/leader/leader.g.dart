// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leader _$LeaderFromJson(Map<String, dynamic> json) => Leader(
      id: json['id'] as int?,
      contestId: json['contestId'] as int?,
      username: json['username'] as String?,
      userId: json['userId'] as int?,
      score: json['score'] as int?,
      rank: json['rank'] as int?,
    );

Map<String, dynamic> _$LeaderToJson(Leader instance) => <String, dynamic>{
      'id': instance.id,
      'contestId': instance.contestId,
      'username': instance.username,
      'userId': instance.userId,
      'score': instance.score,
      'rank': instance.rank,
    };
