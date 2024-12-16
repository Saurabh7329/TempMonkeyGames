import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/domain/user/user.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/feature/account/repo/account_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'account_event.dart';
part 'account_state.dart';
part 'account_bloc.freezed.dart';

@singleton
@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc(this._accountRepo) : super(const AccountState.loading()) {
    on<_GetUser>(_mapGetUserEventToState);
    on<_LogOut>(_mapLogOutEventToState);
    on<_DeleteAccount>(_mapDeleteAccountEventToState);
  }

  final AccountRepo _accountRepo;
  Future<void> _mapGetUserEventToState(
    _GetUser event,
    Emitter<AccountState> emit,
  ) async {
    emit(const AccountState.loading());
    final user =
        User.fromJson(jsonDecode(LocalStorage.getString(Freeplay_User)!));
    emit(AccountState.idle(user: user));
  }

  Future<void> _mapLogOutEventToState(
    _LogOut event,
    Emitter<AccountState> emit,
  ) async {
    emit(const AccountState.loading());
    final failureOrSuccess = await _accountRepo.logOut();
    failureOrSuccess.fold((failure) {
      event.onFail();
    }, (success) async {
      event.onSuccess();
      await _accountRepo.cleanLocalStorage();
    });
  }

  Future<void> _mapDeleteAccountEventToState(
    _DeleteAccount event,
    Emitter<AccountState> emit,
  ) async {
    emit(const AccountState.loading());
    final failureOrSuccess =
        await _accountRepo.deleteAccount(password: event.password);
    failureOrSuccess.fold((failure) {
      event.onFail();
    }, (success) async {
      event.onSuccess();
      await _accountRepo.cleanLocalStorage();
    });
  }
}
