import 'package:freeplay/core/enums.dart';
import 'package:freeplay/core/error/error_type.dart';
import 'package:freeplay/core/error/failure.dart';

extension FailureX on Failure {
  String toMessage() {
    switch (error) {
      case ErrorType.cache_error:
        // TODO: Handle this case.
        return '';
      case ErrorType.internet:
        // TODO: Handle this case.
        return '';
      case ErrorType.unauthorized:
        // TODO: Handle this case.
        return '';
      case ErrorType.unmodified:
        // TODO: Handle this case.
        return '';
      case ErrorType.dio_cancel:
        // TODO: Handle this case.
        return '';
      case ErrorType.dio_connect_timeout:
        // TODO: Handle this case.
        return '';
      case ErrorType.dio_other:
        // TODO: Handle this case.
        return '';
      case ErrorType.dio_receive_timeout:
        // TODO: Handle this case.
        return '';
      case ErrorType.dio_response:
        // TODO: Handle this case.
        return '';
      case ErrorType.dio_send_timeout:
        // TODO: Handle this case.
        return '';
      case ErrorType.dio_400:
        // TODO: Handle this case.
        return '';
    }
  }
}

extension StateStatusX on StateStatus {
  bool get isInitial => this == StateStatus.initial;
  bool get isLoading => this == StateStatus.loading;
  bool get isError => this == StateStatus.error;
  bool get isSuccess => this == StateStatus.success;
  bool get isSaveStateLoading => this == StateStatus.save_state_loading;
  bool get isSaveStateError => this == StateStatus.save_state_error;
  bool get isSaveStateSuccess => this == StateStatus.save_state_success;
}

extension StringX on String {
  bool get isMoneyline => this == 'moneyline';
  bool get isSpread => this == 'spread';
  bool get isTotal => this == 'total';
  bool get isHome => this == 'home';
  bool get isAway => this == 'away';
  bool get isOver => this == 'over';
  bool get isUnder => this == 'under';
  String formatTime() {
    final temp = split(' ');
    final date = temp[0].replaceAll(RegExp(r'-'), '.');
    final time = temp[1].substring(0, 5);
    return '$date $time';
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
