class CreateWagerParams {
  final int gameID;
  final String team;
  final String type;
  final int amount;
  CreateWagerParams({
    required this.gameID,
    required this.team,
    required this.type,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'game_id': gameID,
      'odds_team': team,
      'odds_type': type,
      'amount': amount,
    };
  }
}
