import 'package:json_annotation/json_annotation.dart';
part 'leader.g.dart';

@JsonSerializable()
class Leader {
  int? id;
  int? contestId;
  String? username;
  int? userId;
  int? score;
  int? rank;

  Leader(
      {this.id,
      this.contestId,
      this.username,
      this.userId,
      this.score,
      this.rank});


      factory Leader.fromJson(Map<String, dynamic> json) => _$LeaderFromJson(json);

  Map<String, dynamic> toJson() => _$LeaderToJson(this);
      }