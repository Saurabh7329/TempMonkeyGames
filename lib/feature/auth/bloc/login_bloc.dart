import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/domain/login_params/login_params.dart';
import 'package:freeplay/core/domain/register_params/register_params.dart';
import 'package:freeplay/core/domain/reset_password_params/reset_password_params.dart';
import 'package:freeplay/feature/auth/repo/auth_repo.dart';
import 'package:global_snack_bar/global_snack_bar.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.repo})
      : super(const LoginState.idle(isLoading: false)) {
    on<LoginEvent>((event, emit) async {
      await event.map(
          login: (event) => _login(event, emit),
          register: (event) => _register(event, emit),
          forgot: (event) => _forgot(event, emit),
          resetPassword: (event) => _reset(event, emit),
          loginAsGuest: (event) => _loginAsGuest(event, emit));
    });
  }

  final AuthRepo repo;

  Future _login(_Login event, Emitter<LoginState> emit) async {
    emit(const LoginState.idle(isLoading: true));

    final failureOrSuccess = await repo.login(params: event.params);
    failureOrSuccess.fold((failure) {
      emit(const LoginState.idle(isLoading: false, error: true));
      GlobalSnackBarBloc.showMessage(
        GlobalMsg("Cannot log in", bgColor: AppColors.red),
      );
    },
        (success) => emit(const LoginState.idle(
            isLoading: false, error: false, logged: true)));
  }

  Future _loginAsGuest(_LoginAsGuest event, Emitter<LoginState> emit) async {
    emit(const LoginState.idle(isLoading: true));

    final failureOrSuccess = await repo.loginAsGuest();
    failureOrSuccess.fold((failure) {
      emit(const LoginState.idle(isLoading: false, error: true));
      GlobalSnackBarBloc.showMessage(
        GlobalMsg("Cannot log in as a guest", bgColor: AppColors.red),
      );
    },
        (success) => emit(const LoginState.idle(
            isLoading: true, error: false, logged: true)));
  }

  Future _register(_Register event, Emitter<LoginState> emit) async {
    emit(const LoginState.idle(isLoading: true));
    final failureOrSuccess =
        await repo.register(params: event.params, isGuest: event.isGuest);
    failureOrSuccess.fold((failure) {
      emit(const LoginState.idle(isLoading: false, error: true));
      GlobalSnackBarBloc.showMessage(
        GlobalMsg(
            event.isGuest
                ? "Can't convert your guest account"
                : "Can't register",
            bgColor: AppColors.red),
      );
    }, (success) {
      emit(const LoginState.idle(
          isLoading: false,
          error: false,
          logged: true));
    });
  }

  Future _forgot(_Forgot event, Emitter<LoginState> emit) async {
    emit(const LoginState.idle(isLoading: true));

    final failureOrSuccess = await repo.forgot(email: event.email);
    failureOrSuccess.fold(
        (failure) => emit(const LoginState.idle(isLoading: false, error: true)),
        (success) => emit(const LoginState.idle(
            isLoading: false, error: false, logged: true)));
  }

  Future _reset(_ResetPassword event, Emitter<LoginState> emit) async {
    emit(const LoginState.idle(isLoading: true));

    final failureOrSuccess = await repo.resetPassword(params: event.params);
    failureOrSuccess.fold(
        (failure) => emit(const LoginState.idle(isLoading: false, error: true)),
        (success) => emit(const LoginState.idle(
            isLoading: false, error: false, logged: true)));
  }
}
