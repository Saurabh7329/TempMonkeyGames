import 'package:freeplay/core/domain/domain.dart';

class Wager {
  final int id;
  final int betslipID;
  final String type;
  final String status;
  final int amount;
  final double toWin;
  final double payout;
  final dynamic outcome;
  final int userID;
  final int gameID;
  final ShortedGame game;
  final int teamID;
  final Team team;
  final dynamic awardedOn;
  final String oddsType;
  final String oddsTeam;
  final String oddsOption;
  final int oddsSelection;
  final dynamic odds;
  Wager({
    required this.id,
    required this.betslipID,
    required this.type,
    required this.status,
    required this.amount,
    required this.toWin,
    required this.payout,
    required this.outcome,
    required this.userID,
    required this.gameID,
    required this.game,
    required this.teamID,
    required this.team,
    required this.awardedOn,
    required this.oddsType,
    required this.oddsTeam,
    required this.oddsOption,
    required this.oddsSelection,
    required this.odds,
  });

  factory Wager.fromJson(Map<String, dynamic> json) {
    final oddsType = json['odds_type'] as String;
    final odds = json['odds'];
    return Wager(
      id: json['id'],
      betslipID: json['bet_slip_id'],
      type: json['type'],
      status: json['status'],
      amount: json['amount'] ?? 0,
      toWin: (json['to_win'] ?? 0).toDouble(),
      payout: (json['payout'] ?? 0).toDouble(),
      outcome: json['outcome'],
      userID: json['user_id'],
      gameID: json['game_id'],
      game: ShortedGame.fromJson(json['game']),
      teamID: json['team_id'],
      team: Team.fromJson(json['team']),
      awardedOn: json['awarded_on'],
      oddsType: oddsType,
      oddsTeam: json['odds_team'],
      oddsOption: json['odds_option'],
      oddsSelection: json['odds_selection'],
      odds: oddsType == 'spread'
          ? SpreadOdds.fromJson(odds)
          : oddsType == 'moneyline'
              ? MoneylineOdds.fromJson(odds)
              : TotalOdds.fromJson(odds),
    );
  }
}
