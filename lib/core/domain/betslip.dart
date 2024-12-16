import 'package:freeplay/core/domain/domain.dart';

class Betslip {
  final int id;
  final int userID;
  final String status;
  final double amount;
  final double toWin;
  final double payout;
  final dynamic outcome;
  final String type;
  final int isPrimary;
  final List<Wager> wagers;
  Betslip({
    required this.id,
    required this.userID,
    required this.status,
    required this.amount,
    required this.toWin,
    required this.payout,
    required this.outcome,
    required this.type,
    required this.isPrimary,
    required this.wagers,
  });

  factory Betslip.fromJson(Map<String, dynamic> json) {
    return Betslip(
      id: json['id'],
      userID: json['user_id'],
      status: json['status'],
      amount: json['amount'].toDouble(),
      toWin: json['to_win'].toDouble(),
      payout: json['payout'].toDouble(),
      outcome: json['outcome'],
      type: json['type'],
      isPrimary: json['is_primary'],
      wagers: (json['wagers'] as List).map((e) => Wager.fromJson(e)).toList(),
    );
  }
}
