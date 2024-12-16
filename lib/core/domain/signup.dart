// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

import 'dart:convert';

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
  String customerId;
  String redirectUrl;
  String message;

  SignUp({
    required this.customerId,
    required this.redirectUrl,
    required this.message,
  });

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
    customerId: json["CustomerId"],
    redirectUrl: json["RedirectUrl"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerId": customerId,
    "RedirectUrl": redirectUrl,
    "Message": message,
  };
}
