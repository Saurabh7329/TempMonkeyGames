// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'register_params.g.dart';

@JsonSerializable()
class RegisterParams {
  String? email;
  String? password;
  String? device_name;
  String? username;
  RegisterParams({
    this.email,
    this.password,
    this.device_name,
    this.username
  });
  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}
