part of 'signup_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.signup(Map<String,String> data) = _SignUp;
}
