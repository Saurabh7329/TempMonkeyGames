class Total {
  final TotalOdds open;
  final TotalOdds current;
  Total({
    required this.open,
    required this.current,
  });

  factory Total.fromJson(Map<String, dynamic> json) {
    return Total(
      open: TotalOdds.fromJson(json['open'] as Map<String, dynamic>),
      current: TotalOdds.fromJson(json['current'] as Map<String, dynamic>),
    );
  }
}

class TotalOdds {
  final double total;
  final double overOdds;
  final double underOdds;
  final double overOddsPayout;
  final double overOddsWin;
  final double underOddsPayout;
  final double underOddsWin;
  TotalOdds({
    required this.total,
    required this.overOdds,
    required this.underOdds,
    required this.overOddsPayout,
    required this.overOddsWin,
    required this.underOddsPayout,
    required this.underOddsWin,
  });

  factory TotalOdds.fromJson(Map<String, dynamic> json) {
    final total = json['total'];
    final overOdds = json['overOdds'];
    final underOdds = json['underOdds'];
    final overOddsPayout = json['overOddsPayout'];
    final overOddsWin = json['overOddsWin'];
    final underOddsPayout = json['underOddsPayout'];
    final underOddsWin = json['underOddsWin'];
    return TotalOdds(
      total: total is int ? total.toDouble() : total,
      overOdds: overOdds is int ? overOdds.toDouble() : overOdds,
      underOdds: underOdds is int ? underOdds.toDouble() : underOdds,
      overOddsPayout: overOddsPayout is int
          ? overOddsPayout.toDouble()
          : overOddsPayout as double,
      overOddsWin:
          overOddsWin is int ? overOddsWin.toDouble() : overOddsWin as double,
      underOddsPayout: underOddsPayout is int
          ? underOddsPayout.toDouble()
          : underOddsPayout as double,
      underOddsWin: underOddsWin is int
          ? underOddsWin.toDouble()
          : underOddsWin as double,
    );
  }
}
