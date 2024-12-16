import 'package:bloc/bloc.dart';
import 'package:freeplay/core/extensions.dart';
import 'package:freeplay/feature/home/repo/main_free_play_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/configuration.dart';
import '../../../../core/domain/signup.dart';

part 'signup_bloc.freezed.dart';

part 'signup_event.dart';

part 'signup_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._mainFreePlayRepo)
      : super(const SignUpState.initial(false)) {
    on<_SignUp>(_mapSignToState);
  }

  final MainFreePlayRepo _mainFreePlayRepo;

  Future<void> _mapSignToState(
      _SignUp event,
    Emitter<SignUpState> emit,
  ) async {
    emit(const SignUpState.initial(true));
    final failureSignUp = await _mainFreePlayRepo.signUp(event.data);
    failureSignUp.fold(
      (failure) => emit(
        SignUpState.error(
          message: failure.message ?? failure.toMessage(),
          isLoading: false,
        ),
      ),
      (signup) => emit(
        SignUpState.success(
          isLoading: false,
          signUp: signup,
        ),
      ),
    );
  }
}
