// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'reset_password_params.g.dart';

@JsonSerializable()
class ResetPasswordParams {
  String? email;
  String? password;
  String? token;
  ResetPasswordParams({
    this.email,
    this.password,
    this.token
  });
  factory ResetPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordParamsToJson(this);
}
