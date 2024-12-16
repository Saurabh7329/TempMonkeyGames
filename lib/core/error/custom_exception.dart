import 'package:freeplay/core/error/error_type.dart';

class CustomException implements Exception {
  final ErrorType errorType;
  final String? message;
  CustomException(this.errorType, {this.message});
}
