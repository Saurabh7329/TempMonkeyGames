import 'package:json_annotation/json_annotation.dart';

import 'package:freeplay/core/domain/sport/sport.dart';

part 'league.g.dart';

@JsonSerializable()
class League {
  final int id;
  final String name;
  final String abbreviation;
  @JsonKey(name: 'sport_id')
  final int sportID;
  final Sport sport;
  @JsonKey(name: 'game_count')
  final int gameCount;
  @JsonKey(name: 'in_season')
  final bool inSeason;
  League({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.sportID,
    required this.sport,
    required this.gameCount,
    required this.inSeason,
  });

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}
