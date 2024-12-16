part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.idle(
      {
      required User user
      }) = _Idle;
 const factory AccountState.loading(
      ) = _Loading;
}