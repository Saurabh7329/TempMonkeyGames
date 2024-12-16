// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      id: json['id'] as int,
      name: json['name'] as String,
      abbreviation: json['abbreviation'] as String,
      sportID: json['sport_id'] as int,
      sport: Sport.fromJson(json['sport'] as Map<String, dynamic>),
      gameCount: json['game_count'] as int,
      inSeason: json['in_season'] as bool,
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abbreviation': instance.abbreviation,
      'sport_id': instance.sportID,
      'sport': instance.sport,
      'game_count': instance.gameCount,
      'in_season': instance.inSeason,
    };
