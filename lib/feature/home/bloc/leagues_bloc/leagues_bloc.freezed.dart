// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leagues_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LeaguesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLeagues,
    required TResult Function(League sport) onLeagueSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLeagues,
    TResult? Function(League sport)? onLeagueSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLeagues,
    TResult Function(League sport)? onLeagueSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLeagues value) getLeagues,
    required TResult Function(_OnLeagueSelected value) onLeagueSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLeagues value)? getLeagues,
    TResult? Function(_OnLeagueSelected value)? onLeagueSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLeagues value)? getLeagues,
    TResult Function(_OnLeagueSelected value)? onLeagueSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaguesEventCopyWith<$Res> {
  factory $LeaguesEventCopyWith(
          LeaguesEvent value, $Res Function(LeaguesEvent) then) =
      _$LeaguesEventCopyWithImpl<$Res, LeaguesEvent>;
}

/// @nodoc
class _$LeaguesEventCopyWithImpl<$Res, $Val extends LeaguesEvent>
    implements $LeaguesEventCopyWith<$Res> {
  _$LeaguesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetLeaguesImplCopyWith<$Res> {
  factory _$$GetLeaguesImplCopyWith(
          _$GetLeaguesImpl value, $Res Function(_$GetLeaguesImpl) then) =
      __$$GetLeaguesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLeaguesImplCopyWithImpl<$Res>
    extends _$LeaguesEventCopyWithImpl<$Res, _$GetLeaguesImpl>
    implements _$$GetLeaguesImplCopyWith<$Res> {
  __$$GetLeaguesImplCopyWithImpl(
      _$GetLeaguesImpl _value, $Res Function(_$GetLeaguesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLeaguesImpl implements _GetLeagues {
  const _$GetLeaguesImpl();

  @override
  String toString() {
    return 'LeaguesEvent.getLeagues()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetLeaguesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLeagues,
    required TResult Function(League sport) onLeagueSelected,
  }) {
    return getLeagues();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLeagues,
    TResult? Function(League sport)? onLeagueSelected,
  }) {
    return getLeagues?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLeagues,
    TResult Function(League sport)? onLeagueSelected,
    required TResult orElse(),
  }) {
    if (getLeagues != null) {
      return getLeagues();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLeagues value) getLeagues,
    required TResult Function(_OnLeagueSelected value) onLeagueSelected,
  }) {
    return getLeagues(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLeagues value)? getLeagues,
    TResult? Function(_OnLeagueSelected value)? onLeagueSelected,
  }) {
    return getLeagues?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLeagues value)? getLeagues,
    TResult Function(_OnLeagueSelected value)? onLeagueSelected,
    required TResult orElse(),
  }) {
    if (getLeagues != null) {
      return getLeagues(this);
    }
    return orElse();
  }
}

abstract class _GetLeagues implements LeaguesEvent {
  const factory _GetLeagues() = _$GetLeaguesImpl;
}

/// @nodoc
abstract class _$$OnLeagueSelectedImplCopyWith<$Res> {
  factory _$$OnLeagueSelectedImplCopyWith(_$OnLeagueSelectedImpl value,
          $Res Function(_$OnLeagueSelectedImpl) then) =
      __$$OnLeagueSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({League sport});
}

/// @nodoc
class __$$OnLeagueSelectedImplCopyWithImpl<$Res>
    extends _$LeaguesEventCopyWithImpl<$Res, _$OnLeagueSelectedImpl>
    implements _$$OnLeagueSelectedImplCopyWith<$Res> {
  __$$OnLeagueSelectedImplCopyWithImpl(_$OnLeagueSelectedImpl _value,
      $Res Function(_$OnLeagueSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sport = null,
  }) {
    return _then(_$OnLeagueSelectedImpl(
      null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as League,
    ));
  }
}

/// @nodoc

class _$OnLeagueSelectedImpl implements _OnLeagueSelected {
  const _$OnLeagueSelectedImpl(this.sport);

  @override
  final League sport;

  @override
  String toString() {
    return 'LeaguesEvent.onLeagueSelected(sport: $sport)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLeagueSelectedImpl &&
            (identical(other.sport, sport) || other.sport == sport));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sport);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLeagueSelectedImplCopyWith<_$OnLeagueSelectedImpl> get copyWith =>
      __$$OnLeagueSelectedImplCopyWithImpl<_$OnLeagueSelectedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLeagues,
    required TResult Function(League sport) onLeagueSelected,
  }) {
    return onLeagueSelected(sport);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLeagues,
    TResult? Function(League sport)? onLeagueSelected,
  }) {
    return onLeagueSelected?.call(sport);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLeagues,
    TResult Function(League sport)? onLeagueSelected,
    required TResult orElse(),
  }) {
    if (onLeagueSelected != null) {
      return onLeagueSelected(sport);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLeagues value) getLeagues,
    required TResult Function(_OnLeagueSelected value) onLeagueSelected,
  }) {
    return onLeagueSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLeagues value)? getLeagues,
    TResult? Function(_OnLeagueSelected value)? onLeagueSelected,
  }) {
    return onLeagueSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLeagues value)? getLeagues,
    TResult Function(_OnLeagueSelected value)? onLeagueSelected,
    required TResult orElse(),
  }) {
    if (onLeagueSelected != null) {
      return onLeagueSelected(this);
    }
    return orElse();
  }
}

abstract class _OnLeagueSelected implements LeaguesEvent {
  const factory _OnLeagueSelected(final League sport) = _$OnLeagueSelectedImpl;

  League get sport;
  @JsonKey(ignore: true)
  _$$OnLeagueSelectedImplCopyWith<_$OnLeagueSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
