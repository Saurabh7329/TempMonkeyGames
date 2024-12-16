part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.idle(
      {required bool isLoading, @Default(false) bool error, @Default(false) bool logged}) = Idle;
}
