// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sports_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SportsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSports,
    required TResult Function(Sport sport) onSportSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSports,
    TResult? Function(Sport sport)? onSportSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSports,
    TResult Function(Sport sport)? onSportSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSports value) getSports,
    required TResult Function(_OnSportSelected value) onSportSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSports value)? getSports,
    TResult? Function(_OnSportSelected value)? onSportSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSports value)? getSports,
    TResult Function(_OnSportSelected value)? onSportSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SportsEventCopyWith<$Res> {
  factory $SportsEventCopyWith(
          SportsEvent value, $Res Function(SportsEvent) then) =
      _$SportsEventCopyWithImpl<$Res, SportsEvent>;
}

/// @nodoc
class _$SportsEventCopyWithImpl<$Res, $Val extends SportsEvent>
    implements $SportsEventCopyWith<$Res> {
  _$SportsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetSportsImplCopyWith<$Res> {
  factory _$$GetSportsImplCopyWith(
          _$GetSportsImpl value, $Res Function(_$GetSportsImpl) then) =
      __$$GetSportsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSportsImplCopyWithImpl<$Res>
    extends _$SportsEventCopyWithImpl<$Res, _$GetSportsImpl>
    implements _$$GetSportsImplCopyWith<$Res> {
  __$$GetSportsImplCopyWithImpl(
      _$GetSportsImpl _value, $Res Function(_$GetSportsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetSportsImpl implements _GetSports {
  const _$GetSportsImpl();

  @override
  String toString() {
    return 'SportsEvent.getSports()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSportsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSports,
    required TResult Function(Sport sport) onSportSelected,
  }) {
    return getSports();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSports,
    TResult? Function(Sport sport)? onSportSelected,
  }) {
    return getSports?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSports,
    TResult Function(Sport sport)? onSportSelected,
    required TResult orElse(),
  }) {
    if (getSports != null) {
      return getSports();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSports value) getSports,
    required TResult Function(_OnSportSelected value) onSportSelected,
  }) {
    return getSports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSports value)? getSports,
    TResult? Function(_OnSportSelected value)? onSportSelected,
  }) {
    return getSports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSports value)? getSports,
    TResult Function(_OnSportSelected value)? onSportSelected,
    required TResult orElse(),
  }) {
    if (getSports != null) {
      return getSports(this);
    }
    return orElse();
  }
}

abstract class _GetSports implements SportsEvent {
  const factory _GetSports() = _$GetSportsImpl;
}

/// @nodoc
abstract class _$$OnSportSelectedImplCopyWith<$Res> {
  factory _$$OnSportSelectedImplCopyWith(_$OnSportSelectedImpl value,
          $Res Function(_$OnSportSelectedImpl) then) =
      __$$OnSportSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Sport sport});
}

/// @nodoc
class __$$OnSportSelectedImplCopyWithImpl<$Res>
    extends _$SportsEventCopyWithImpl<$Res, _$OnSportSelectedImpl>
    implements _$$OnSportSelectedImplCopyWith<$Res> {
  __$$OnSportSelectedImplCopyWithImpl(
      _$OnSportSelectedImpl _value, $Res Function(_$OnSportSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sport = null,
  }) {
    return _then(_$OnSportSelectedImpl(
      null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as Sport,
    ));
  }
}

/// @nodoc

class _$OnSportSelectedImpl implements _OnSportSelected {
  const _$OnSportSelectedImpl(this.sport);

  @override
  final Sport sport;

  @override
  String toString() {
    return 'SportsEvent.onSportSelected(sport: $sport)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSportSelectedImpl &&
            (identical(other.sport, sport) || other.sport == sport));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sport);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSportSelectedImplCopyWith<_$OnSportSelectedImpl> get copyWith =>
      __$$OnSportSelectedImplCopyWithImpl<_$OnSportSelectedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSports,
    required TResult Function(Sport sport) onSportSelected,
  }) {
    return onSportSelected(sport);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSports,
    TResult? Function(Sport sport)? onSportSelected,
  }) {
    return onSportSelected?.call(sport);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSports,
    TResult Function(Sport sport)? onSportSelected,
    required TResult orElse(),
  }) {
    if (onSportSelected != null) {
      return onSportSelected(sport);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSports value) getSports,
    required TResult Function(_OnSportSelected value) onSportSelected,
  }) {
    return onSportSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSports value)? getSports,
    TResult? Function(_OnSportSelected value)? onSportSelected,
  }) {
    return onSportSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSports value)? getSports,
    TResult Function(_OnSportSelected value)? onSportSelected,
    required TResult orElse(),
  }) {
    if (onSportSelected != null) {
      return onSportSelected(this);
    }
    return orElse();
  }
}

abstract class _OnSportSelected implements SportsEvent {
  const factory _OnSportSelected(final Sport sport) = _$OnSportSelectedImpl;

  Sport get sport;
  @JsonKey(ignore: true)
  _$$OnSportSelectedImplCopyWith<_$OnSportSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
