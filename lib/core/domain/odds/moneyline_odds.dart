class Moneyline {
  final MoneylineOdds open;
  final MoneylineOdds current;
  Moneyline({
    required this.open,
    required this.current,
  });

  factory Moneyline.fromJson(Map<String, dynamic> map) {
    return Moneyline(
      open: MoneylineOdds.fromJson(map['open'] as Map<String, dynamic>),
      current: MoneylineOdds.fromJson(map['current'] as Map<String, dynamic>),
    );
  }
}

class MoneylineOdds {
  final double awayOdds;
  final double homeOdds;
  final double awayOddsPayout;
  final double awayOddsWin;
  final double homeOddsPayout;
  final double homeOddsWin;
  MoneylineOdds({
    required this.awayOdds,
    required this.homeOdds,
    required this.awayOddsPayout,
    required this.awayOddsWin,
    required this.homeOddsPayout,
    required this.homeOddsWin,
  });

  factory MoneylineOdds.fromJson(Map<String, dynamic> json) {
    final awayOdds = json['awayOdds'];
    final homeOdds = json['homeOdds'];
    final awayOddsPayout = json['awayOddsPayout'];
    final awayOddsWin = json['awayOddsWin'];
    return MoneylineOdds(
      awayOdds: awayOdds is int ? awayOdds.toDouble() : awayOdds as double,
      homeOdds: homeOdds is int ? homeOdds.toDouble() : homeOdds as double,
      awayOddsPayout: awayOddsPayout is int
          ? awayOddsPayout.toDouble()
          : awayOddsPayout as double,
      awayOddsWin:
          awayOddsWin is int ? awayOddsWin.toDouble() : awayOddsWin as double,
      homeOddsPayout: json['homeOddsPayout'].toDouble(),
      homeOddsWin: json['homeOddsWin'].toDouble(),
    );
  }
}
