class Spread {
  final SpreadOdds open;
  final SpreadOdds current;
  Spread({
    required this.open,
    required this.current,
  });

  factory Spread.fromJson(Map<String, dynamic> json) {
    return Spread(
      open: SpreadOdds.fromJson(json['open'] as Map<String, dynamic>),
      current: SpreadOdds.fromJson(json['current'] as Map<String, dynamic>),
    );
  }
}

class SpreadOdds {
  final double away;
  final double home;
  final double awayOdds;
  final double homeOdds;
  final double awayOddsPayout;
  final double awayOddsWin;
  final double homeOddsPayout;
  final double homeOddsWin;
  SpreadOdds({
    required this.away,
    required this.home,
    required this.awayOdds,
    required this.homeOdds,
    required this.awayOddsPayout,
    required this.awayOddsWin,
    required this.homeOddsPayout,
    required this.homeOddsWin,
  });

  factory SpreadOdds.fromJson(Map<String, dynamic> json) {
    final away = json['away'];
    final home = json['home'];
    final awayOdds = json['awayOdds'];
    final homeOdds = json['homeOdds'];
    final awayOddsPayout = json['awayOddsPayout'];
    final awayOddsWin = json['awayOddsWin'];
    final homeOddsPayout = json['homeOddsPayout'];
    final homeOddsWin = json['homeOddsWin'];
    return SpreadOdds(
      away: away is int ? away.toDouble() : away as double,
      home: home is int ? home.toDouble() : home as double,
      awayOdds: awayOdds is int ? awayOdds.toDouble() : awayOdds as double,
      homeOdds: homeOdds is int ? homeOdds.toDouble() : homeOdds as double,
      awayOddsPayout: awayOddsPayout is int
          ? awayOddsPayout.toDouble()
          : awayOddsPayout as double,
      awayOddsWin:
          awayOddsWin is int ? awayOddsWin.toDouble() : awayOddsWin as double,
      homeOddsPayout: homeOddsPayout is int
          ? homeOddsPayout.toDouble()
          : homeOddsPayout as double,
      homeOddsWin:
          homeOddsWin is int ? homeOddsWin.toDouble() : homeOddsWin as double,
    );
  }
}
