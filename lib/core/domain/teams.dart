class Teams {
  final Team home;
  final Team away;
  Teams({
    required this.home,
    required this.away,
  });
  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
      home: Team.fromJson(json['home']),
      away: Team.fromJson(json['away']),
    );
  }
}

class Team {
  final int id;
  final String name;
  final String short;
  final String abbreviation;
  final String conference;
  Team({
    required this.id,
    required this.name,
    required this.short,
    required this.abbreviation,
    required this.conference,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] as int,
      name: json['name'] as String,
      short: json['short'] as String,
      abbreviation: json['abbreviation'] as String,
      conference: json['conference'] ?? "",
    );
  }
}
