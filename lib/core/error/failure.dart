import 'package:freeplay/core/error/error_type.dart';

class Failure {
  final ErrorType error;
  final String? message;
  final dynamic data;
  Failure(this.error, {this.data, this.message});
}
