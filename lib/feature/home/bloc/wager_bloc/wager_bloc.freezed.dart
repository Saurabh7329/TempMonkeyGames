// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wager_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WagerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Game game, String wagerType, String team) start,
    required TResult Function() stop,
    required TResult Function(String? value) onAmountChanged,
    required TResult Function() createWager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Game game, String wagerType, String team)? start,
    TResult? Function()? stop,
    TResult? Function(String? value)? onAmountChanged,
    TResult? Function()? createWager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Game game, String wagerType, String team)? start,
    TResult Function()? stop,
    TResult Function(String? value)? onAmountChanged,
    TResult Function()? createWager,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
    required TResult Function(_OnChanged value) onAmountChanged,
    required TResult Function(_CreateWager value) createWager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_OnChanged value)? onAmountChanged,
    TResult? Function(_CreateWager value)? createWager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    TResult Function(_OnChanged value)? onAmountChanged,
    TResult Function(_CreateWager value)? createWager,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WagerEventCopyWith<$Res> {
  factory $WagerEventCopyWith(
          WagerEvent value, $Res Function(WagerEvent) then) =
      _$WagerEventCopyWithImpl<$Res, WagerEvent>;
}

/// @nodoc
class _$WagerEventCopyWithImpl<$Res, $Val extends WagerEvent>
    implements $WagerEventCopyWith<$Res> {
  _$WagerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartImplCopyWith<$Res> {
  factory _$$StartImplCopyWith(
          _$StartImpl value, $Res Function(_$StartImpl) then) =
      __$$StartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Game game, String wagerType, String team});
}

/// @nodoc
class __$$StartImplCopyWithImpl<$Res>
    extends _$WagerEventCopyWithImpl<$Res, _$StartImpl>
    implements _$$StartImplCopyWith<$Res> {
  __$$StartImplCopyWithImpl(
      _$StartImpl _value, $Res Function(_$StartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? game = null,
    Object? wagerType = null,
    Object? team = null,
  }) {
    return _then(_$StartImpl(
      game: null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game,
      wagerType: null == wagerType
          ? _value.wagerType
          : wagerType // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartImpl implements _Start {
  const _$StartImpl(
      {required this.game, required this.wagerType, required this.team});

  @override
  final Game game;
  @override
  final String wagerType;
  @override
  final String team;

  @override
  String toString() {
    return 'WagerEvent.start(game: $game, wagerType: $wagerType, team: $team)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartImpl &&
            (identical(other.game, game) || other.game == game) &&
            (identical(other.wagerType, wagerType) ||
                other.wagerType == wagerType) &&
            (identical(other.team, team) || other.team == team));
  }

  @override
  int get hashCode => Object.hash(runtimeType, game, wagerType, team);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      __$$StartImplCopyWithImpl<_$StartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Game game, String wagerType, String team) start,
    required TResult Function() stop,
    required TResult Function(String? value) onAmountChanged,
    required TResult Function() createWager,
  }) {
    return start(game, wagerType, team);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Game game, String wagerType, String team)? start,
    TResult? Function()? stop,
    TResult? Function(String? value)? onAmountChanged,
    TResult? Function()? createWager,
  }) {
    return start?.call(game, wagerType, team);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Game game, String wagerType, String team)? start,
    TResult Function()? stop,
    TResult Function(String? value)? onAmountChanged,
    TResult Function()? createWager,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(game, wagerType, team);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
    required TResult Function(_OnChanged value) onAmountChanged,
    required TResult Function(_CreateWager value) createWager,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_OnChanged value)? onAmountChanged,
    TResult? Function(_CreateWager value)? createWager,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    TResult Function(_OnChanged value)? onAmountChanged,
    TResult Function(_CreateWager value)? createWager,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _Start implements WagerEvent {
  const factory _Start(
      {required final Game game,
      required final String wagerType,
      required final String team}) = _$StartImpl;

  Game get game;
  String get wagerType;
  String get team;
  @JsonKey(ignore: true)
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopImplCopyWith<$Res> {
  factory _$$StopImplCopyWith(
          _$StopImpl value, $Res Function(_$StopImpl) then) =
      __$$StopImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopImplCopyWithImpl<$Res>
    extends _$WagerEventCopyWithImpl<$Res, _$StopImpl>
    implements _$$StopImplCopyWith<$Res> {
  __$$StopImplCopyWithImpl(_$StopImpl _value, $Res Function(_$StopImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StopImpl implements _Stop {
  const _$StopImpl();

  @override
  String toString() {
    return 'WagerEvent.stop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Game game, String wagerType, String team) start,
    required TResult Function() stop,
    required TResult Function(String? value) onAmountChanged,
    required TResult Function() createWager,
  }) {
    return stop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Game game, String wagerType, String team)? start,
    TResult? Function()? stop,
    TResult? Function(String? value)? onAmountChanged,
    TResult? Function()? createWager,
  }) {
    return stop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Game game, String wagerType, String team)? start,
    TResult Function()? stop,
    TResult Function(String? value)? onAmountChanged,
    TResult Function()? createWager,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
    required TResult Function(_OnChanged value) onAmountChanged,
    required TResult Function(_CreateWager value) createWager,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_OnChanged value)? onAmountChanged,
    TResult? Function(_CreateWager value)? createWager,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    TResult Function(_OnChanged value)? onAmountChanged,
    TResult Function(_CreateWager value)? createWager,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class _Stop implements WagerEvent {
  const factory _Stop() = _$StopImpl;
}

/// @nodoc
abstract class _$$OnChangedImplCopyWith<$Res> {
  factory _$$OnChangedImplCopyWith(
          _$OnChangedImpl value, $Res Function(_$OnChangedImpl) then) =
      __$$OnChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? value});
}

/// @nodoc
class __$$OnChangedImplCopyWithImpl<$Res>
    extends _$WagerEventCopyWithImpl<$Res, _$OnChangedImpl>
    implements _$$OnChangedImplCopyWith<$Res> {
  __$$OnChangedImplCopyWithImpl(
      _$OnChangedImpl _value, $Res Function(_$OnChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$OnChangedImpl(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnChangedImpl implements _OnChanged {
  const _$OnChangedImpl(this.value);

  @override
  final String? value;

  @override
  String toString() {
    return 'WagerEvent.onAmountChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangedImplCopyWith<_$OnChangedImpl> get copyWith =>
      __$$OnChangedImplCopyWithImpl<_$OnChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Game game, String wagerType, String team) start,
    required TResult Function() stop,
    required TResult Function(String? value) onAmountChanged,
    required TResult Function() createWager,
  }) {
    return onAmountChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Game game, String wagerType, String team)? start,
    TResult? Function()? stop,
    TResult? Function(String? value)? onAmountChanged,
    TResult? Function()? createWager,
  }) {
    return onAmountChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Game game, String wagerType, String team)? start,
    TResult Function()? stop,
    TResult Function(String? value)? onAmountChanged,
    TResult Function()? createWager,
    required TResult orElse(),
  }) {
    if (onAmountChanged != null) {
      return onAmountChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
    required TResult Function(_OnChanged value) onAmountChanged,
    required TResult Function(_CreateWager value) createWager,
  }) {
    return onAmountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_OnChanged value)? onAmountChanged,
    TResult? Function(_CreateWager value)? createWager,
  }) {
    return onAmountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    TResult Function(_OnChanged value)? onAmountChanged,
    TResult Function(_CreateWager value)? createWager,
    required TResult orElse(),
  }) {
    if (onAmountChanged != null) {
      return onAmountChanged(this);
    }
    return orElse();
  }
}

abstract class _OnChanged implements WagerEvent {
  const factory _OnChanged(final String? value) = _$OnChangedImpl;

  String? get value;
  @JsonKey(ignore: true)
  _$$OnChangedImplCopyWith<_$OnChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateWagerImplCopyWith<$Res> {
  factory _$$CreateWagerImplCopyWith(
          _$CreateWagerImpl value, $Res Function(_$CreateWagerImpl) then) =
      __$$CreateWagerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateWagerImplCopyWithImpl<$Res>
    extends _$WagerEventCopyWithImpl<$Res, _$CreateWagerImpl>
    implements _$$CreateWagerImplCopyWith<$Res> {
  __$$CreateWagerImplCopyWithImpl(
      _$CreateWagerImpl _value, $Res Function(_$CreateWagerImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateWagerImpl implements _CreateWager {
  const _$CreateWagerImpl();

  @override
  String toString() {
    return 'WagerEvent.createWager()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateWagerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Game game, String wagerType, String team) start,
    required TResult Function() stop,
    required TResult Function(String? value) onAmountChanged,
    required TResult Function() createWager,
  }) {
    return createWager();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Game game, String wagerType, String team)? start,
    TResult? Function()? stop,
    TResult? Function(String? value)? onAmountChanged,
    TResult? Function()? createWager,
  }) {
    return createWager?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Game game, String wagerType, String team)? start,
    TResult Function()? stop,
    TResult Function(String? value)? onAmountChanged,
    TResult Function()? createWager,
    required TResult orElse(),
  }) {
    if (createWager != null) {
      return createWager();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
    required TResult Function(_OnChanged value) onAmountChanged,
    required TResult Function(_CreateWager value) createWager,
  }) {
    return createWager(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_OnChanged value)? onAmountChanged,
    TResult? Function(_CreateWager value)? createWager,
  }) {
    return createWager?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    TResult Function(_OnChanged value)? onAmountChanged,
    TResult Function(_CreateWager value)? createWager,
    required TResult orElse(),
  }) {
    if (createWager != null) {
      return createWager(this);
    }
    return orElse();
  }
}

abstract class _CreateWager implements WagerEvent {
  const factory _CreateWager() = _$CreateWagerImpl;
}
