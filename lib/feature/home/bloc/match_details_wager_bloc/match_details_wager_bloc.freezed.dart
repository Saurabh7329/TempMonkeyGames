// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_details_wager_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MatchDetailsWagerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String wagerType, String team) start,
    required TResult Function() stop,
    required TResult Function(int gameID, double amount) createWager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String wagerType, String team)? start,
    TResult? Function()? stop,
    TResult? Function(int gameID, double amount)? createWager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String wagerType, String team)? start,
    TResult Function()? stop,
    TResult Function(int gameID, double amount)? createWager,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
    required TResult Function(_CreateWager value) createWager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_CreateWager value)? createWager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    TResult Function(_CreateWager value)? createWager,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchDetailsWagerEventCopyWith<$Res> {
  factory $MatchDetailsWagerEventCopyWith(MatchDetailsWagerEvent value,
          $Res Function(MatchDetailsWagerEvent) then) =
      _$MatchDetailsWagerEventCopyWithImpl<$Res, MatchDetailsWagerEvent>;
}

/// @nodoc
class _$MatchDetailsWagerEventCopyWithImpl<$Res,
        $Val extends MatchDetailsWagerEvent>
    implements $MatchDetailsWagerEventCopyWith<$Res> {
  _$MatchDetailsWagerEventCopyWithImpl(this._value, this._then);

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
  $Res call({String wagerType, String team});
}

/// @nodoc
class __$$StartImplCopyWithImpl<$Res>
    extends _$MatchDetailsWagerEventCopyWithImpl<$Res, _$StartImpl>
    implements _$$StartImplCopyWith<$Res> {
  __$$StartImplCopyWithImpl(
      _$StartImpl _value, $Res Function(_$StartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wagerType = null,
    Object? team = null,
  }) {
    return _then(_$StartImpl(
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
  const _$StartImpl({required this.wagerType, required this.team});

  @override
  final String wagerType;
  @override
  final String team;

  @override
  String toString() {
    return 'MatchDetailsWagerEvent.start(wagerType: $wagerType, team: $team)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartImpl &&
            (identical(other.wagerType, wagerType) ||
                other.wagerType == wagerType) &&
            (identical(other.team, team) || other.team == team));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wagerType, team);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      __$$StartImplCopyWithImpl<_$StartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String wagerType, String team) start,
    required TResult Function() stop,
    required TResult Function(int gameID, double amount) createWager,
  }) {
    return start(wagerType, team);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String wagerType, String team)? start,
    TResult? Function()? stop,
    TResult? Function(int gameID, double amount)? createWager,
  }) {
    return start?.call(wagerType, team);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String wagerType, String team)? start,
    TResult Function()? stop,
    TResult Function(int gameID, double amount)? createWager,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(wagerType, team);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
    required TResult Function(_CreateWager value) createWager,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_CreateWager value)? createWager,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    TResult Function(_CreateWager value)? createWager,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _Start implements MatchDetailsWagerEvent {
  const factory _Start(
      {required final String wagerType,
      required final String team}) = _$StartImpl;

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
    extends _$MatchDetailsWagerEventCopyWithImpl<$Res, _$StopImpl>
    implements _$$StopImplCopyWith<$Res> {
  __$$StopImplCopyWithImpl(_$StopImpl _value, $Res Function(_$StopImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StopImpl implements _Stop {
  const _$StopImpl();

  @override
  String toString() {
    return 'MatchDetailsWagerEvent.stop()';
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
    required TResult Function(String wagerType, String team) start,
    required TResult Function() stop,
    required TResult Function(int gameID, double amount) createWager,
  }) {
    return stop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String wagerType, String team)? start,
    TResult? Function()? stop,
    TResult? Function(int gameID, double amount)? createWager,
  }) {
    return stop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String wagerType, String team)? start,
    TResult Function()? stop,
    TResult Function(int gameID, double amount)? createWager,
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
    required TResult Function(_CreateWager value) createWager,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_CreateWager value)? createWager,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    TResult Function(_CreateWager value)? createWager,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class _Stop implements MatchDetailsWagerEvent {
  const factory _Stop() = _$StopImpl;
}

/// @nodoc
abstract class _$$CreateWagerImplCopyWith<$Res> {
  factory _$$CreateWagerImplCopyWith(
          _$CreateWagerImpl value, $Res Function(_$CreateWagerImpl) then) =
      __$$CreateWagerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int gameID, double amount});
}

/// @nodoc
class __$$CreateWagerImplCopyWithImpl<$Res>
    extends _$MatchDetailsWagerEventCopyWithImpl<$Res, _$CreateWagerImpl>
    implements _$$CreateWagerImplCopyWith<$Res> {
  __$$CreateWagerImplCopyWithImpl(
      _$CreateWagerImpl _value, $Res Function(_$CreateWagerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameID = null,
    Object? amount = null,
  }) {
    return _then(_$CreateWagerImpl(
      gameID: null == gameID
          ? _value.gameID
          : gameID // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CreateWagerImpl implements _CreateWager {
  const _$CreateWagerImpl({required this.gameID, required this.amount});

  @override
  final int gameID;
  @override
  final double amount;

  @override
  String toString() {
    return 'MatchDetailsWagerEvent.createWager(gameID: $gameID, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWagerImpl &&
            (identical(other.gameID, gameID) || other.gameID == gameID) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameID, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWagerImplCopyWith<_$CreateWagerImpl> get copyWith =>
      __$$CreateWagerImplCopyWithImpl<_$CreateWagerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String wagerType, String team) start,
    required TResult Function() stop,
    required TResult Function(int gameID, double amount) createWager,
  }) {
    return createWager(gameID, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String wagerType, String team)? start,
    TResult? Function()? stop,
    TResult? Function(int gameID, double amount)? createWager,
  }) {
    return createWager?.call(gameID, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String wagerType, String team)? start,
    TResult Function()? stop,
    TResult Function(int gameID, double amount)? createWager,
    required TResult orElse(),
  }) {
    if (createWager != null) {
      return createWager(gameID, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Stop value) stop,
    required TResult Function(_CreateWager value) createWager,
  }) {
    return createWager(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_CreateWager value)? createWager,
  }) {
    return createWager?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Stop value)? stop,
    TResult Function(_CreateWager value)? createWager,
    required TResult orElse(),
  }) {
    if (createWager != null) {
      return createWager(this);
    }
    return orElse();
  }
}

abstract class _CreateWager implements MatchDetailsWagerEvent {
  const factory _CreateWager(
      {required final int gameID,
      required final double amount}) = _$CreateWagerImpl;

  int get gameID;
  double get amount;
  @JsonKey(ignore: true)
  _$$CreateWagerImplCopyWith<_$CreateWagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
