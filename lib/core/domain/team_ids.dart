class TeamIDs {
  final int home;
  final int away;
  TeamIDs({
    required this.home,
    required this.away,
  });

  factory TeamIDs.fromJson(Map<String, dynamic> json) {
    return TeamIDs(
      home: json['home'],
      away: json['away'],
    );
  }
}
