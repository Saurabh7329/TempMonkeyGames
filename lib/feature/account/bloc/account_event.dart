part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.getUser() = _GetUser;
  const factory AccountEvent.logOut({required Function onSuccess, required Function onFail}) = _LogOut;
  const factory AccountEvent.deleteAccount({required String password, required Function onSuccess, required Function onFail}) = _DeleteAccount;
}