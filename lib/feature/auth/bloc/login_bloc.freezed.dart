// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginParams params) login,
    required TResult Function() loginAsGuest,
    required TResult Function(RegisterParams params, bool isGuest) register,
    required TResult Function(String email) forgot,
    required TResult Function(ResetPasswordParams params) resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginParams params)? login,
    TResult? Function()? loginAsGuest,
    TResult? Function(RegisterParams params, bool isGuest)? register,
    TResult? Function(String email)? forgot,
    TResult? Function(ResetPasswordParams params)? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginParams params)? login,
    TResult Function()? loginAsGuest,
    TResult Function(RegisterParams params, bool isGuest)? register,
    TResult Function(String email)? forgot,
    TResult Function(ResetPasswordParams params)? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_Forgot value) forgot,
    required TResult Function(_ResetPassword value) resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_Forgot value)? forgot,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_Forgot value)? forgot,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginParams params});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$LoginImpl(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as LoginParams,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl({required this.params});

  @override
  final LoginParams params;

  @override
  String toString() {
    return 'LoginEvent.login(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginParams params) login,
    required TResult Function() loginAsGuest,
    required TResult Function(RegisterParams params, bool isGuest) register,
    required TResult Function(String email) forgot,
    required TResult Function(ResetPasswordParams params) resetPassword,
  }) {
    return login(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginParams params)? login,
    TResult? Function()? loginAsGuest,
    TResult? Function(RegisterParams params, bool isGuest)? register,
    TResult? Function(String email)? forgot,
    TResult? Function(ResetPasswordParams params)? resetPassword,
  }) {
    return login?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginParams params)? login,
    TResult Function()? loginAsGuest,
    TResult Function(RegisterParams params, bool isGuest)? register,
    TResult Function(String email)? forgot,
    TResult Function(ResetPasswordParams params)? resetPassword,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_Forgot value) forgot,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_Forgot value)? forgot,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_Forgot value)? forgot,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements LoginEvent {
  const factory _Login({required final LoginParams params}) = _$LoginImpl;

  LoginParams get params;
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginAsGuestImplCopyWith<$Res> {
  factory _$$LoginAsGuestImplCopyWith(
          _$LoginAsGuestImpl value, $Res Function(_$LoginAsGuestImpl) then) =
      __$$LoginAsGuestImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginAsGuestImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginAsGuestImpl>
    implements _$$LoginAsGuestImplCopyWith<$Res> {
  __$$LoginAsGuestImplCopyWithImpl(
      _$LoginAsGuestImpl _value, $Res Function(_$LoginAsGuestImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginAsGuestImpl implements _LoginAsGuest {
  const _$LoginAsGuestImpl();

  @override
  String toString() {
    return 'LoginEvent.loginAsGuest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginAsGuestImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginParams params) login,
    required TResult Function() loginAsGuest,
    required TResult Function(RegisterParams params, bool isGuest) register,
    required TResult Function(String email) forgot,
    required TResult Function(ResetPasswordParams params) resetPassword,
  }) {
    return loginAsGuest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginParams params)? login,
    TResult? Function()? loginAsGuest,
    TResult? Function(RegisterParams params, bool isGuest)? register,
    TResult? Function(String email)? forgot,
    TResult? Function(ResetPasswordParams params)? resetPassword,
  }) {
    return loginAsGuest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginParams params)? login,
    TResult Function()? loginAsGuest,
    TResult Function(RegisterParams params, bool isGuest)? register,
    TResult Function(String email)? forgot,
    TResult Function(ResetPasswordParams params)? resetPassword,
    required TResult orElse(),
  }) {
    if (loginAsGuest != null) {
      return loginAsGuest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_Forgot value) forgot,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return loginAsGuest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_Forgot value)? forgot,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return loginAsGuest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_Forgot value)? forgot,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (loginAsGuest != null) {
      return loginAsGuest(this);
    }
    return orElse();
  }
}

abstract class _LoginAsGuest implements LoginEvent {
  const factory _LoginAsGuest() = _$LoginAsGuestImpl;
}

/// @nodoc
abstract class _$$RegisterImplCopyWith<$Res> {
  factory _$$RegisterImplCopyWith(
          _$RegisterImpl value, $Res Function(_$RegisterImpl) then) =
      __$$RegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterParams params, bool isGuest});
}

/// @nodoc
class __$$RegisterImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$RegisterImpl>
    implements _$$RegisterImplCopyWith<$Res> {
  __$$RegisterImplCopyWithImpl(
      _$RegisterImpl _value, $Res Function(_$RegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
    Object? isGuest = null,
  }) {
    return _then(_$RegisterImpl(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as RegisterParams,
      isGuest: null == isGuest
          ? _value.isGuest
          : isGuest // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterImpl implements _Register {
  const _$RegisterImpl({required this.params, required this.isGuest});

  @override
  final RegisterParams params;
  @override
  final bool isGuest;

  @override
  String toString() {
    return 'LoginEvent.register(params: $params, isGuest: $isGuest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterImpl &&
            (identical(other.params, params) || other.params == params) &&
            (identical(other.isGuest, isGuest) || other.isGuest == isGuest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params, isGuest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      __$$RegisterImplCopyWithImpl<_$RegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginParams params) login,
    required TResult Function() loginAsGuest,
    required TResult Function(RegisterParams params, bool isGuest) register,
    required TResult Function(String email) forgot,
    required TResult Function(ResetPasswordParams params) resetPassword,
  }) {
    return register(params, isGuest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginParams params)? login,
    TResult? Function()? loginAsGuest,
    TResult? Function(RegisterParams params, bool isGuest)? register,
    TResult? Function(String email)? forgot,
    TResult? Function(ResetPasswordParams params)? resetPassword,
  }) {
    return register?.call(params, isGuest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginParams params)? login,
    TResult Function()? loginAsGuest,
    TResult Function(RegisterParams params, bool isGuest)? register,
    TResult Function(String email)? forgot,
    TResult Function(ResetPasswordParams params)? resetPassword,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(params, isGuest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_Forgot value) forgot,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_Forgot value)? forgot,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_Forgot value)? forgot,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements LoginEvent {
  const factory _Register(
      {required final RegisterParams params,
      required final bool isGuest}) = _$RegisterImpl;

  RegisterParams get params;
  bool get isGuest;
  @JsonKey(ignore: true)
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgotImplCopyWith<$Res> {
  factory _$$ForgotImplCopyWith(
          _$ForgotImpl value, $Res Function(_$ForgotImpl) then) =
      __$$ForgotImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$ForgotImpl>
    implements _$$ForgotImplCopyWith<$Res> {
  __$$ForgotImplCopyWithImpl(
      _$ForgotImpl _value, $Res Function(_$ForgotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotImpl implements _Forgot {
  const _$ForgotImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'LoginEvent.forgot(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotImplCopyWith<_$ForgotImpl> get copyWith =>
      __$$ForgotImplCopyWithImpl<_$ForgotImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginParams params) login,
    required TResult Function() loginAsGuest,
    required TResult Function(RegisterParams params, bool isGuest) register,
    required TResult Function(String email) forgot,
    required TResult Function(ResetPasswordParams params) resetPassword,
  }) {
    return forgot(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginParams params)? login,
    TResult? Function()? loginAsGuest,
    TResult? Function(RegisterParams params, bool isGuest)? register,
    TResult? Function(String email)? forgot,
    TResult? Function(ResetPasswordParams params)? resetPassword,
  }) {
    return forgot?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginParams params)? login,
    TResult Function()? loginAsGuest,
    TResult Function(RegisterParams params, bool isGuest)? register,
    TResult Function(String email)? forgot,
    TResult Function(ResetPasswordParams params)? resetPassword,
    required TResult orElse(),
  }) {
    if (forgot != null) {
      return forgot(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_Forgot value) forgot,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return forgot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_Forgot value)? forgot,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return forgot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_Forgot value)? forgot,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (forgot != null) {
      return forgot(this);
    }
    return orElse();
  }
}

abstract class _Forgot implements LoginEvent {
  const factory _Forgot({required final String email}) = _$ForgotImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$ForgotImplCopyWith<_$ForgotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordImplCopyWith<$Res> {
  factory _$$ResetPasswordImplCopyWith(
          _$ResetPasswordImpl value, $Res Function(_$ResetPasswordImpl) then) =
      __$$ResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ResetPasswordParams params});
}

/// @nodoc
class __$$ResetPasswordImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$ResetPasswordImpl>
    implements _$$ResetPasswordImplCopyWith<$Res> {
  __$$ResetPasswordImplCopyWithImpl(
      _$ResetPasswordImpl _value, $Res Function(_$ResetPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$ResetPasswordImpl(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as ResetPasswordParams,
    ));
  }
}

/// @nodoc

class _$ResetPasswordImpl implements _ResetPassword {
  const _$ResetPasswordImpl({required this.params});

  @override
  final ResetPasswordParams params;

  @override
  String toString() {
    return 'LoginEvent.resetPassword(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      __$$ResetPasswordImplCopyWithImpl<_$ResetPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginParams params) login,
    required TResult Function() loginAsGuest,
    required TResult Function(RegisterParams params, bool isGuest) register,
    required TResult Function(String email) forgot,
    required TResult Function(ResetPasswordParams params) resetPassword,
  }) {
    return resetPassword(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginParams params)? login,
    TResult? Function()? loginAsGuest,
    TResult? Function(RegisterParams params, bool isGuest)? register,
    TResult? Function(String email)? forgot,
    TResult? Function(ResetPasswordParams params)? resetPassword,
  }) {
    return resetPassword?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginParams params)? login,
    TResult Function()? loginAsGuest,
    TResult Function(RegisterParams params, bool isGuest)? register,
    TResult Function(String email)? forgot,
    TResult Function(ResetPasswordParams params)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_Forgot value) forgot,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_Forgot value)? forgot,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_Forgot value)? forgot,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements LoginEvent {
  const factory _ResetPassword({required final ResetPasswordParams params}) =
      _$ResetPasswordImpl;

  ResetPasswordParams get params;
  @JsonKey(ignore: true)
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  bool get logged => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, bool error, bool logged) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, bool error, bool logged)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool error, bool logged)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({bool isLoading, bool error, bool logged});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? logged = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      logged: null == logged
          ? _value.logged
          : logged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool error, bool logged});
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? logged = null,
  }) {
    return _then(_$IdleImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      logged: null == logged
          ? _value.logged
          : logged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IdleImpl implements Idle {
  const _$IdleImpl(
      {required this.isLoading, this.error = false, this.logged = false});

  @override
  final bool isLoading;
  @override
  @JsonKey()
  final bool error;
  @override
  @JsonKey()
  final bool logged;

  @override
  String toString() {
    return 'LoginState.idle(isLoading: $isLoading, error: $error, logged: $logged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.logged, logged) || other.logged == logged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, logged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleImplCopyWith<_$IdleImpl> get copyWith =>
      __$$IdleImplCopyWithImpl<_$IdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, bool error, bool logged) idle,
  }) {
    return idle(isLoading, error, logged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, bool error, bool logged)? idle,
  }) {
    return idle?.call(isLoading, error, logged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool error, bool logged)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(isLoading, error, logged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements LoginState {
  const factory Idle(
      {required final bool isLoading,
      final bool error,
      final bool logged}) = _$IdleImpl;

  @override
  bool get isLoading;
  @override
  bool get error;
  @override
  bool get logged;
  @override
  @JsonKey(ignore: true)
  _$$IdleImplCopyWith<_$IdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
