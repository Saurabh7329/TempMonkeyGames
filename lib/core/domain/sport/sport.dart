import 'package:json_annotation/json_annotation.dart';

part 'sport.g.dart';

@JsonSerializable()
class Sport {
  final int id;
  final String name;
  @JsonKey(name: 'short_name')
  final String shortName;
  Sport({
    required this.id,
    required this.name,
    required this.shortName,
  });

  factory Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);

  Map<String, dynamic> toJson() => _$SportToJson(this);
}
