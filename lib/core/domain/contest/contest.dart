import 'package:freeplay/core/domain/leader/leader.dart';
import 'package:json_annotation/json_annotation.dart';
part 'contest.g.dart';

@JsonSerializable()
class Contest {
  int? id;
  String? name;
  String? from;
  String? to;
  String? image;
  String? prize;
  String? summary;
  String? type;
  Leader? leader;
  List<Leader>? leaders;
  String? leaderLabel;

  Contest(
      {this.id,
      this.name,
      this.from,
      this.to,
      this.image,
      this.prize,
      this.summary,
      this.type,
      this.leader,
      this.leaders,
      this.leaderLabel});

  factory Contest.fromJson(Map<String, dynamic> json) => _$ContestFromJson(json);

  Map<String, dynamic> toJson() => _$ContestToJson(this);
      
      }