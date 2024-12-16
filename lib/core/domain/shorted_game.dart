import 'package:freeplay/core/domain/local_details.dart';
import 'package:freeplay/core/domain/odds/odds.dart';
import 'package:freeplay/core/domain/team_ids.dart';

class ShortedGame {
  final int id;
  final String remoteID;
  final String summary;
  final String status;
  final String gameDate;
  final String localGameDate;
  final LocalDetails localDetails;
  final int sportID;
  final int leagueID;
  final TeamIDs? teamIDs;
  final Odds? odds;
  ShortedGame({
    required this.id,
    required this.remoteID,
    required this.summary,
    required this.status,
    required this.gameDate,
    required this.localGameDate,
    required this.localDetails,
    required this.sportID,
    required this.leagueID,
    this.teamIDs,
    this.odds,
  });

  factory ShortedGame.fromJson(Map<String, dynamic> json) {
    final teamIDs = json['team_ids'];
    return ShortedGame(
      id: json['id'],
      remoteID: json['remote_id'],
      summary: json['summary'],
      status: json['status'],
      gameDate: json['game_date'],
      sportID: json['sport_id'],
      leagueID: json['league_id'],
      localGameDate: json['local_game_date'],
      teamIDs: teamIDs != null ? TeamIDs.fromJson(teamIDs) : null,
      localDetails: LocalDetails.fromJson(json['local_details']),
    );
  }
}
