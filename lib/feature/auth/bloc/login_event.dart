part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.login({required LoginParams params}) = _Login;
  const factory LoginEvent.loginAsGuest() = _LoginAsGuest;
  const factory LoginEvent.register({required RegisterParams params, required bool isGuest}) =
      _Register;
  const factory LoginEvent.forgot({required String email}) =
      _Forgot;
   const factory LoginEvent.resetPassword({required ResetPasswordParams params}) =
      _ResetPassword;
}
