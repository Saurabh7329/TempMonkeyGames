// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contest_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContests,
    required TResult Function(String contestId) joinContest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContests,
    TResult? Function(String contestId)? joinContest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContests,
    TResult Function(String contestId)? joinContest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetContests value) getContests,
    required TResult Function(_JoinContest value) joinContest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetContests value)? getContests,
    TResult? Function(_JoinContest value)? joinContest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetContests value)? getContests,
    TResult Function(_JoinContest value)? joinContest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContestEventCopyWith<$Res> {
  factory $ContestEventCopyWith(
          ContestEvent value, $Res Function(ContestEvent) then) =
      _$ContestEventCopyWithImpl<$Res, ContestEvent>;
}

/// @nodoc
class _$ContestEventCopyWithImpl<$Res, $Val extends ContestEvent>
    implements $ContestEventCopyWith<$Res> {
  _$ContestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetContestsImplCopyWith<$Res> {
  factory _$$GetContestsImplCopyWith(
          _$GetContestsImpl value, $Res Function(_$GetContestsImpl) then) =
      __$$GetContestsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetContestsImplCopyWithImpl<$Res>
    extends _$ContestEventCopyWithImpl<$Res, _$GetContestsImpl>
    implements _$$GetContestsImplCopyWith<$Res> {
  __$$GetContestsImplCopyWithImpl(
      _$GetContestsImpl _value, $Res Function(_$GetContestsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetContestsImpl implements _GetContests {
  const _$GetContestsImpl();

  @override
  String toString() {
    return 'ContestEvent.getContests()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetContestsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContests,
    required TResult Function(String contestId) joinContest,
  }) {
    return getContests();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContests,
    TResult? Function(String contestId)? joinContest,
  }) {
    return getContests?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContests,
    TResult Function(String contestId)? joinContest,
    required TResult orElse(),
  }) {
    if (getContests != null) {
      return getContests();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetContests value) getContests,
    required TResult Function(_JoinContest value) joinContest,
  }) {
    return getContests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetContests value)? getContests,
    TResult? Function(_JoinContest value)? joinContest,
  }) {
    return getContests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetContests value)? getContests,
    TResult Function(_JoinContest value)? joinContest,
    required TResult orElse(),
  }) {
    if (getContests != null) {
      return getContests(this);
    }
    return orElse();
  }
}

abstract class _GetContests implements ContestEvent {
  const factory _GetContests() = _$GetContestsImpl;
}

/// @nodoc
abstract class _$$JoinContestImplCopyWith<$Res> {
  factory _$$JoinContestImplCopyWith(
          _$JoinContestImpl value, $Res Function(_$JoinContestImpl) then) =
      __$$JoinContestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String contestId});
}

/// @nodoc
class __$$JoinContestImplCopyWithImpl<$Res>
    extends _$ContestEventCopyWithImpl<$Res, _$JoinContestImpl>
    implements _$$JoinContestImplCopyWith<$Res> {
  __$$JoinContestImplCopyWithImpl(
      _$JoinContestImpl _value, $Res Function(_$JoinContestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contestId = null,
  }) {
    return _then(_$JoinContestImpl(
      contestId: null == contestId
          ? _value.contestId
          : contestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JoinContestImpl implements _JoinContest {
  const _$JoinContestImpl({required this.contestId});

  @override
  final String contestId;

  @override
  String toString() {
    return 'ContestEvent.joinContest(contestId: $contestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinContestImpl &&
            (identical(other.contestId, contestId) ||
                other.contestId == contestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinContestImplCopyWith<_$JoinContestImpl> get copyWith =>
      __$$JoinContestImplCopyWithImpl<_$JoinContestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContests,
    required TResult Function(String contestId) joinContest,
  }) {
    return joinContest(contestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContests,
    TResult? Function(String contestId)? joinContest,
  }) {
    return joinContest?.call(contestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContests,
    TResult Function(String contestId)? joinContest,
    required TResult orElse(),
  }) {
    if (joinContest != null) {
      return joinContest(contestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetContests value) getContests,
    required TResult Function(_JoinContest value) joinContest,
  }) {
    return joinContest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetContests value)? getContests,
    TResult? Function(_JoinContest value)? joinContest,
  }) {
    return joinContest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetContests value)? getContests,
    TResult Function(_JoinContest value)? joinContest,
    required TResult orElse(),
  }) {
    if (joinContest != null) {
      return joinContest(this);
    }
    return orElse();
  }
}

abstract class _JoinContest implements ContestEvent {
  const factory _JoinContest({required final String contestId}) =
      _$JoinContestImpl;

  String get contestId;
  @JsonKey(ignore: true)
  _$$JoinContestImplCopyWith<_$JoinContestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContestState {
  bool get isLoading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, bool error, String errorMessage)
        idle,
    required TResult Function(List<Contest> contests, bool isLoading) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, bool error, String errorMessage)? idle,
    TResult? Function(List<Contest> contests, bool isLoading)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool error, String errorMessage)? idle,
    TResult Function(List<Contest> contests, bool isLoading)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContestStateCopyWith<ContestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContestStateCopyWith<$Res> {
  factory $ContestStateCopyWith(
          ContestState value, $Res Function(ContestState) then) =
      _$ContestStateCopyWithImpl<$Res, ContestState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$ContestStateCopyWithImpl<$Res, $Val extends ContestState>
    implements $ContestStateCopyWith<$Res> {
  _$ContestStateCopyWithImpl(this._value, this._then);

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
abstract class _$$IdleImplCopyWith<$Res>
    implements $ContestStateCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool error, String errorMessage});
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$ContestStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? errorMessage = null,
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
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl(
      {required this.isLoading, this.error = false, this.errorMessage = ''});

  @override
  final bool isLoading;
  @override
  @JsonKey()
  final bool error;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'ContestState.idle(isLoading: $isLoading, error: $error, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleImplCopyWith<_$IdleImpl> get copyWith =>
      __$$IdleImplCopyWithImpl<_$IdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, bool error, String errorMessage)
        idle,
    required TResult Function(List<Contest> contests, bool isLoading) success,
  }) {
    return idle(isLoading, error, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, bool error, String errorMessage)? idle,
    TResult? Function(List<Contest> contests, bool isLoading)? success,
  }) {
    return idle?.call(isLoading, error, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool error, String errorMessage)? idle,
    TResult Function(List<Contest> contests, bool isLoading)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(isLoading, error, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Success value) success,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements ContestState {
  const factory _Idle(
      {required final bool isLoading,
      final bool error,
      final String errorMessage}) = _$IdleImpl;

  @override
  bool get isLoading;
  bool get error;
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$IdleImplCopyWith<_$IdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $ContestStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Contest> contests, bool isLoading});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ContestStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contests = null,
    Object? isLoading = null,
  }) {
    return _then(_$SuccessImpl(
      contests: null == contests
          ? _value._contests
          : contests // ignore: cast_nullable_to_non_nullable
              as List<Contest>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {required final List<Contest> contests, required this.isLoading})
      : _contests = contests;

  final List<Contest> _contests;
  @override
  List<Contest> get contests {
    if (_contests is EqualUnmodifiableListView) return _contests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contests);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ContestState.success(contests: $contests, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._contests, _contests) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_contests), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, bool error, String errorMessage)
        idle,
    required TResult Function(List<Contest> contests, bool isLoading) success,
  }) {
    return success(contests, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, bool error, String errorMessage)? idle,
    TResult? Function(List<Contest> contests, bool isLoading)? success,
  }) {
    return success?.call(contests, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool error, String errorMessage)? idle,
    TResult Function(List<Contest> contests, bool isLoading)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(contests, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ContestState {
  const factory _Success(
      {required final List<Contest> contests,
      required final bool isLoading}) = _$SuccessImpl;

  List<Contest> get contests;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
