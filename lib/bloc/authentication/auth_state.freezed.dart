// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user) loggedIn,
    required TResult Function(dynamic error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user)? loggedIn,
    TResult? Function(dynamic error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(UserModel user)? loggedIn,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoggedOut value) loggedOut,
    required TResult Function(AuthStateLoggedIn value) loggedIn,
    required TResult Function(AuthStateFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoggedOut value)? loggedOut,
    TResult? Function(AuthStateLoggedIn value)? loggedIn,
    TResult? Function(AuthStateFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoggedOut value)? loggedOut,
    TResult Function(AuthStateLoggedIn value)? loggedIn,
    TResult Function(AuthStateFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateInitialImplCopyWith<$Res> {
  factory _$$AuthStateInitialImplCopyWith(_$AuthStateInitialImpl value,
          $Res Function(_$AuthStateInitialImpl) then) =
      __$$AuthStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateInitialImpl>
    implements _$$AuthStateInitialImplCopyWith<$Res> {
  __$$AuthStateInitialImplCopyWithImpl(_$AuthStateInitialImpl _value,
      $Res Function(_$AuthStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateInitialImpl implements AuthStateInitial {
  const _$AuthStateInitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user) loggedIn,
    required TResult Function(dynamic error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user)? loggedIn,
    TResult? Function(dynamic error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(UserModel user)? loggedIn,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoggedOut value) loggedOut,
    required TResult Function(AuthStateLoggedIn value) loggedIn,
    required TResult Function(AuthStateFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoggedOut value)? loggedOut,
    TResult? Function(AuthStateLoggedIn value)? loggedIn,
    TResult? Function(AuthStateFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoggedOut value)? loggedOut,
    TResult Function(AuthStateLoggedIn value)? loggedIn,
    TResult Function(AuthStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthStateInitial implements AuthState {
  const factory AuthStateInitial() = _$AuthStateInitialImpl;
}

/// @nodoc
abstract class _$$AuthStateLoggedOutImplCopyWith<$Res> {
  factory _$$AuthStateLoggedOutImplCopyWith(_$AuthStateLoggedOutImpl value,
          $Res Function(_$AuthStateLoggedOutImpl) then) =
      __$$AuthStateLoggedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateLoggedOutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateLoggedOutImpl>
    implements _$$AuthStateLoggedOutImplCopyWith<$Res> {
  __$$AuthStateLoggedOutImplCopyWithImpl(_$AuthStateLoggedOutImpl _value,
      $Res Function(_$AuthStateLoggedOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateLoggedOutImpl implements AuthStateLoggedOut {
  const _$AuthStateLoggedOutImpl();

  @override
  String toString() {
    return 'AuthState.loggedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateLoggedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user) loggedIn,
    required TResult Function(dynamic error) failure,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user)? loggedIn,
    TResult? Function(dynamic error)? failure,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(UserModel user)? loggedIn,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoggedOut value) loggedOut,
    required TResult Function(AuthStateLoggedIn value) loggedIn,
    required TResult Function(AuthStateFailure value) failure,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoggedOut value)? loggedOut,
    TResult? Function(AuthStateLoggedIn value)? loggedIn,
    TResult? Function(AuthStateFailure value)? failure,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoggedOut value)? loggedOut,
    TResult Function(AuthStateLoggedIn value)? loggedIn,
    TResult Function(AuthStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class AuthStateLoggedOut implements AuthState {
  const factory AuthStateLoggedOut() = _$AuthStateLoggedOutImpl;
}

/// @nodoc
abstract class _$$AuthStateLoggedInImplCopyWith<$Res> {
  factory _$$AuthStateLoggedInImplCopyWith(_$AuthStateLoggedInImpl value,
          $Res Function(_$AuthStateLoggedInImpl) then) =
      __$$AuthStateLoggedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthStateLoggedInImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateLoggedInImpl>
    implements _$$AuthStateLoggedInImplCopyWith<$Res> {
  __$$AuthStateLoggedInImplCopyWithImpl(_$AuthStateLoggedInImpl _value,
      $Res Function(_$AuthStateLoggedInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthStateLoggedInImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthStateLoggedInImpl implements AuthStateLoggedIn {
  const _$AuthStateLoggedInImpl(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthState.loggedIn(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateLoggedInImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateLoggedInImplCopyWith<_$AuthStateLoggedInImpl> get copyWith =>
      __$$AuthStateLoggedInImplCopyWithImpl<_$AuthStateLoggedInImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user) loggedIn,
    required TResult Function(dynamic error) failure,
  }) {
    return loggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user)? loggedIn,
    TResult? Function(dynamic error)? failure,
  }) {
    return loggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(UserModel user)? loggedIn,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoggedOut value) loggedOut,
    required TResult Function(AuthStateLoggedIn value) loggedIn,
    required TResult Function(AuthStateFailure value) failure,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoggedOut value)? loggedOut,
    TResult? Function(AuthStateLoggedIn value)? loggedIn,
    TResult? Function(AuthStateFailure value)? failure,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoggedOut value)? loggedOut,
    TResult Function(AuthStateLoggedIn value)? loggedIn,
    TResult Function(AuthStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class AuthStateLoggedIn implements AuthState {
  const factory AuthStateLoggedIn(final UserModel user) =
      _$AuthStateLoggedInImpl;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$AuthStateLoggedInImplCopyWith<_$AuthStateLoggedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateFailureImplCopyWith<$Res> {
  factory _$$AuthStateFailureImplCopyWith(_$AuthStateFailureImpl value,
          $Res Function(_$AuthStateFailureImpl) then) =
      __$$AuthStateFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$AuthStateFailureImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateFailureImpl>
    implements _$$AuthStateFailureImplCopyWith<$Res> {
  __$$AuthStateFailureImplCopyWithImpl(_$AuthStateFailureImpl _value,
      $Res Function(_$AuthStateFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AuthStateFailureImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AuthStateFailureImpl implements AuthStateFailure {
  const _$AuthStateFailureImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'AuthState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateFailureImplCopyWith<_$AuthStateFailureImpl> get copyWith =>
      __$$AuthStateFailureImplCopyWithImpl<_$AuthStateFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user) loggedIn,
    required TResult Function(dynamic error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user)? loggedIn,
    TResult? Function(dynamic error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggedOut,
    TResult Function(UserModel user)? loggedIn,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoggedOut value) loggedOut,
    required TResult Function(AuthStateLoggedIn value) loggedIn,
    required TResult Function(AuthStateFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoggedOut value)? loggedOut,
    TResult? Function(AuthStateLoggedIn value)? loggedIn,
    TResult? Function(AuthStateFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoggedOut value)? loggedOut,
    TResult Function(AuthStateLoggedIn value)? loggedIn,
    TResult Function(AuthStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AuthStateFailure implements AuthState {
  const factory AuthStateFailure(final dynamic error) = _$AuthStateFailureImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$AuthStateFailureImplCopyWith<_$AuthStateFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
