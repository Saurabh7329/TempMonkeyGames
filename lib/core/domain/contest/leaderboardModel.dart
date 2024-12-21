class LeaderBoardModel {
  int id;
  int contestId;
  String username;
  int userId;
  int score;
  int rank;

  LeaderBoardModel({
    required this.id,
    required this.contestId,
    required this.username,
    required this.userId,
    required this.score,
    required this.rank,
  });

  factory LeaderBoardModel.fromJson(Map<String, dynamic> json) => LeaderBoardModel(
    id: json["id"],
    contestId: json["contest_id"],
    username: json["username"],
    userId: json["user_id"],
    score: json["score"],
    rank: json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "contest_id": contestId,
    "username": username,
    "user_id": userId,
    "score": score,
    "rank": rank,
  };
}