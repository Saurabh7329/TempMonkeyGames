import 'package:freeplay/core/domain/odds/moneyline_odds.dart';
import 'package:freeplay/core/domain/odds/spread_odds.dart';
import 'package:freeplay/core/domain/odds/total_odds.dart';

export 'moneyline_odds.dart';
export 'spread_odds.dart';
export 'total_odds.dart';

class Odds {
  final Spread? spread;
  final Moneyline? moneyline;
  final Total? total;
  Odds({
    this.spread,
    this.moneyline,
    this.total,
  });

  factory Odds.fromJson(Map<String, dynamic> json) {
    final spread = json['spread'];
    final moneyline = json['moneyline'];
    final total = json['total'];
    return Odds(
      spread: spread != null ? Spread.fromJson(spread) : null,
      moneyline: moneyline != null ? Moneyline.fromJson(moneyline) : null,
      total: total != null ? Total.fromJson(total) : null,
    );
  }
}
