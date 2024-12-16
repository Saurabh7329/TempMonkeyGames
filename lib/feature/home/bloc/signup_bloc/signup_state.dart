part of 'signup_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial(bool isLoading) = _Initial;
  const factory SignUpState.error({
    required String message,
    required bool isLoading,
  }) = _Error;
  const factory SignUpState.success({
    required SignUp signUp,
    required bool isLoading,
  }) = _Success;
}