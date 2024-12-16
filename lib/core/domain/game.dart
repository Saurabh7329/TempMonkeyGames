import 'package:freeplay/core/domain/local_details.dart';
import 'package:freeplay/core/domain/odds/odds.dart';
import 'package:freeplay/core/domain/teams.dart';

class Game {
  final int id;
  final String remoteID;
  final String summary;
  final String status;
  final String gameDate;
  final String localGameDate;
  final LocalDetails localDetails;
  final int sportID;
  final int leagueID;
  final Teams teams;
  final Odds? odds;
  Game({
    required this.id,
    required this.remoteID,
    required this.summary,
    required this.status,
    required this.gameDate,
    required this.localGameDate,
    required this.localDetails,
    required this.sportID,
    required this.leagueID,
    required this.teams,
    this.odds,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    final odds = json['odds'];
    return Game(
      id: json['id'],
      remoteID: json['remote_id'],
      summary: json['summary'],
      status: json['status'],
      gameDate: json['game_date'],
      localGameDate: json['local_game_date'],
      localDetails: LocalDetails.fromJson(json['local_details']),
      sportID: json['sport_id'],
      leagueID: json['league_id'],
      teams: Teams.fromJson(json['teams']),
      odds: odds is List ? null : Odds.fromJson(odds['sports_page']['data']),
    );
  }
}
