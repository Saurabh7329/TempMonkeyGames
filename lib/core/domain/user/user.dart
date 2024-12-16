import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? username;
  String? mobile;
  String? email;
  String? type;
  String? info;
  String? emailVerifiedAt;
  String? emailVerificationSentAt;
  String? currentTeamId;
  String? profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  dynamic wallet;

  User(
      {this.id,
      this.name,
      this.username,
      this.mobile,
      this.email,
      this.type,
      this.info,
      this.emailVerifiedAt,
      this.emailVerificationSentAt,
      this.currentTeamId,
      this.profilePhotoPath,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.wallet});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
