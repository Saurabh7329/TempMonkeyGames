// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configuration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConfigurationEvent {
  Configuration? get league => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Configuration? league) getConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Configuration? league)? getConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Configuration? league)? getConfiguration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConfiguration value) getConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConfiguration value)? getConfiguration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConfiguration value)? getConfiguration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigurationEventCopyWith<ConfigurationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurationEventCopyWith<$Res> {
  factory $ConfigurationEventCopyWith(
          ConfigurationEvent value, $Res Function(ConfigurationEvent) then) =
      _$ConfigurationEventCopyWithImpl<$Res, ConfigurationEvent>;
  @useResult
  $Res call({Configuration? league});
}

/// @nodoc
class _$ConfigurationEventCopyWithImpl<$Res, $Val extends ConfigurationEvent>
    implements $ConfigurationEventCopyWith<$Res> {
  _$ConfigurationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = freezed,
  }) {
    return _then(_value.copyWith(
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as Configuration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetConfigurationImplCopyWith<$Res>
    implements $ConfigurationEventCopyWith<$Res> {
  factory _$$GetConfigurationImplCopyWith(_$GetConfigurationImpl value,
          $Res Function(_$GetConfigurationImpl) then) =
      __$$GetConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Configuration? league});
}

/// @nodoc
class __$$GetConfigurationImplCopyWithImpl<$Res>
    extends _$ConfigurationEventCopyWithImpl<$Res, _$GetConfigurationImpl>
    implements _$$GetConfigurationImplCopyWith<$Res> {
  __$$GetConfigurationImplCopyWithImpl(_$GetConfigurationImpl _value,
      $Res Function(_$GetConfigurationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = freezed,
  }) {
    return _then(_$GetConfigurationImpl(
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as Configuration?,
    ));
  }
}

/// @nodoc

class _$GetConfigurationImpl implements _GetConfiguration {
  const _$GetConfigurationImpl({this.league});

  @override
  final Configuration? league;

  @override
  String toString() {
    return 'ConfigurationEvent.getConfiguration(league: $league)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetConfigurationImpl &&
            (identical(other.league, league) || other.league == league));
  }

  @override
  int get hashCode => Object.hash(runtimeType, league);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetConfigurationImplCopyWith<_$GetConfigurationImpl> get copyWith =>
      __$$GetConfigurationImplCopyWithImpl<_$GetConfigurationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Configuration? league) getConfiguration,
  }) {
    return getConfiguration(league);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Configuration? league)? getConfiguration,
  }) {
    return getConfiguration?.call(league);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Configuration? league)? getConfiguration,
    required TResult orElse(),
  }) {
    if (getConfiguration != null) {
      return getConfiguration(league);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConfiguration value) getConfiguration,
  }) {
    return getConfiguration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConfiguration value)? getConfiguration,
  }) {
    return getConfiguration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConfiguration value)? getConfiguration,
    required TResult orElse(),
  }) {
    if (getConfiguration != null) {
      return getConfiguration(this);
    }
    return orElse();
  }
}

abstract class _GetConfiguration implements ConfigurationEvent {
  const factory _GetConfiguration({final Configuration? league}) =
      _$GetConfigurationImpl;

  @override
  Configuration? get league;
  @override
  @JsonKey(ignore: true)
  _$$GetConfigurationImplCopyWith<_$GetConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConfigurationState {
  bool get isLoading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Configuration configuration, bool isLoading)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Configuration configuration, bool isLoading)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Configuration configuration, bool isLoading)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigurationStateCopyWith<ConfigurationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurationStateCopyWith<$Res> {
  factory $ConfigurationStateCopyWith(
          ConfigurationState value, $Res Function(ConfigurationState) then) =
      _$ConfigurationStateCopyWithImpl<$Res, ConfigurationState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$ConfigurationStateCopyWithImpl<$Res, $Val extends ConfigurationState>
    implements $ConfigurationStateCopyWith<$Res> {
  _$ConfigurationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ConfigurationStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ConfigurationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$InitialImpl(
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.isLoading);

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ConfigurationState.initial(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Configuration configuration, bool isLoading)
        success,
  }) {
    return initial(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Configuration configuration, bool isLoading)? success,
  }) {
    return initial?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Configuration configuration, bool isLoading)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ConfigurationState {
  const factory _Initial(final bool isLoading) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $ConfigurationStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool isLoading});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ConfigurationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isLoading = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message, required this.isLoading});

  @override
  final String message;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ConfigurationState.error(message: $message, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Configuration configuration, bool isLoading)
        success,
  }) {
    return error(message, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Configuration configuration, bool isLoading)? success,
  }) {
    return error?.call(message, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Configuration configuration, bool isLoading)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ConfigurationState {
  const factory _Error(
      {required final String message,
      required final bool isLoading}) = _$ErrorImpl;

  String get message;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $ConfigurationStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Configuration configuration, bool isLoading});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ConfigurationStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configuration = null,
    Object? isLoading = null,
  }) {
    return _then(_$SuccessImpl(
      configuration: null == configuration
          ? _value.configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Configuration,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.configuration, required this.isLoading});

  @override
  final Configuration configuration;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ConfigurationState.success(configuration: $configuration, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.configuration, configuration) ||
                other.configuration == configuration) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, configuration, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Configuration configuration, bool isLoading)
        success,
  }) {
    return success(configuration, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Configuration configuration, bool isLoading)? success,
  }) {
    return success?.call(configuration, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Configuration configuration, bool isLoading)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(configuration, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ConfigurationState {
  const factory _Success(
      {required final Configuration configuration,
      required final bool isLoading}) = _$SuccessImpl;

  Configuration get configuration;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
