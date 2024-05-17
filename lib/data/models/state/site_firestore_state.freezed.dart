// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_firestore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SiteFirestoreState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Site> sitesList) allSites,
    required TResult Function() createSuccess,
    required TResult Function(dynamic error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Site> sitesList)? allSites,
    TResult? Function()? createSuccess,
    TResult? Function(dynamic error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Site> sitesList)? allSites,
    TResult Function()? createSuccess,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SiteInitialState value) initial,
    required TResult Function(SiteLoadingState value) loading,
    required TResult Function(AllSites value) allSites,
    required TResult Function(SiteCreateSuccess value) createSuccess,
    required TResult Function(SiteFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SiteInitialState value)? initial,
    TResult? Function(SiteLoadingState value)? loading,
    TResult? Function(AllSites value)? allSites,
    TResult? Function(SiteCreateSuccess value)? createSuccess,
    TResult? Function(SiteFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SiteInitialState value)? initial,
    TResult Function(SiteLoadingState value)? loading,
    TResult Function(AllSites value)? allSites,
    TResult Function(SiteCreateSuccess value)? createSuccess,
    TResult Function(SiteFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteFirestoreStateCopyWith<$Res> {
  factory $SiteFirestoreStateCopyWith(
          SiteFirestoreState value, $Res Function(SiteFirestoreState) then) =
      _$SiteFirestoreStateCopyWithImpl<$Res, SiteFirestoreState>;
}

/// @nodoc
class _$SiteFirestoreStateCopyWithImpl<$Res, $Val extends SiteFirestoreState>
    implements $SiteFirestoreStateCopyWith<$Res> {
  _$SiteFirestoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SiteInitialStateImplCopyWith<$Res> {
  factory _$$SiteInitialStateImplCopyWith(_$SiteInitialStateImpl value,
          $Res Function(_$SiteInitialStateImpl) then) =
      __$$SiteInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SiteInitialStateImplCopyWithImpl<$Res>
    extends _$SiteFirestoreStateCopyWithImpl<$Res, _$SiteInitialStateImpl>
    implements _$$SiteInitialStateImplCopyWith<$Res> {
  __$$SiteInitialStateImplCopyWithImpl(_$SiteInitialStateImpl _value,
      $Res Function(_$SiteInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SiteInitialStateImpl implements SiteInitialState {
  const _$SiteInitialStateImpl();

  @override
  String toString() {
    return 'SiteFirestoreState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SiteInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Site> sitesList) allSites,
    required TResult Function() createSuccess,
    required TResult Function(dynamic error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Site> sitesList)? allSites,
    TResult? Function()? createSuccess,
    TResult? Function(dynamic error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Site> sitesList)? allSites,
    TResult Function()? createSuccess,
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
    required TResult Function(SiteInitialState value) initial,
    required TResult Function(SiteLoadingState value) loading,
    required TResult Function(AllSites value) allSites,
    required TResult Function(SiteCreateSuccess value) createSuccess,
    required TResult Function(SiteFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SiteInitialState value)? initial,
    TResult? Function(SiteLoadingState value)? loading,
    TResult? Function(AllSites value)? allSites,
    TResult? Function(SiteCreateSuccess value)? createSuccess,
    TResult? Function(SiteFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SiteInitialState value)? initial,
    TResult Function(SiteLoadingState value)? loading,
    TResult Function(AllSites value)? allSites,
    TResult Function(SiteCreateSuccess value)? createSuccess,
    TResult Function(SiteFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SiteInitialState implements SiteFirestoreState {
  const factory SiteInitialState() = _$SiteInitialStateImpl;
}

/// @nodoc
abstract class _$$SiteLoadingStateImplCopyWith<$Res> {
  factory _$$SiteLoadingStateImplCopyWith(_$SiteLoadingStateImpl value,
          $Res Function(_$SiteLoadingStateImpl) then) =
      __$$SiteLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SiteLoadingStateImplCopyWithImpl<$Res>
    extends _$SiteFirestoreStateCopyWithImpl<$Res, _$SiteLoadingStateImpl>
    implements _$$SiteLoadingStateImplCopyWith<$Res> {
  __$$SiteLoadingStateImplCopyWithImpl(_$SiteLoadingStateImpl _value,
      $Res Function(_$SiteLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SiteLoadingStateImpl implements SiteLoadingState {
  const _$SiteLoadingStateImpl();

  @override
  String toString() {
    return 'SiteFirestoreState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SiteLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Site> sitesList) allSites,
    required TResult Function() createSuccess,
    required TResult Function(dynamic error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Site> sitesList)? allSites,
    TResult? Function()? createSuccess,
    TResult? Function(dynamic error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Site> sitesList)? allSites,
    TResult Function()? createSuccess,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SiteInitialState value) initial,
    required TResult Function(SiteLoadingState value) loading,
    required TResult Function(AllSites value) allSites,
    required TResult Function(SiteCreateSuccess value) createSuccess,
    required TResult Function(SiteFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SiteInitialState value)? initial,
    TResult? Function(SiteLoadingState value)? loading,
    TResult? Function(AllSites value)? allSites,
    TResult? Function(SiteCreateSuccess value)? createSuccess,
    TResult? Function(SiteFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SiteInitialState value)? initial,
    TResult Function(SiteLoadingState value)? loading,
    TResult Function(AllSites value)? allSites,
    TResult Function(SiteCreateSuccess value)? createSuccess,
    TResult Function(SiteFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SiteLoadingState implements SiteFirestoreState {
  const factory SiteLoadingState() = _$SiteLoadingStateImpl;
}

/// @nodoc
abstract class _$$AllSitesImplCopyWith<$Res> {
  factory _$$AllSitesImplCopyWith(
          _$AllSitesImpl value, $Res Function(_$AllSitesImpl) then) =
      __$$AllSitesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Site> sitesList});
}

/// @nodoc
class __$$AllSitesImplCopyWithImpl<$Res>
    extends _$SiteFirestoreStateCopyWithImpl<$Res, _$AllSitesImpl>
    implements _$$AllSitesImplCopyWith<$Res> {
  __$$AllSitesImplCopyWithImpl(
      _$AllSitesImpl _value, $Res Function(_$AllSitesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sitesList = null,
  }) {
    return _then(_$AllSitesImpl(
      null == sitesList
          ? _value._sitesList
          : sitesList // ignore: cast_nullable_to_non_nullable
              as List<Site>,
    ));
  }
}

/// @nodoc

class _$AllSitesImpl implements AllSites {
  const _$AllSitesImpl(final List<Site> sitesList) : _sitesList = sitesList;

  final List<Site> _sitesList;
  @override
  List<Site> get sitesList {
    if (_sitesList is EqualUnmodifiableListView) return _sitesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sitesList);
  }

  @override
  String toString() {
    return 'SiteFirestoreState.allSites(sitesList: $sitesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllSitesImpl &&
            const DeepCollectionEquality()
                .equals(other._sitesList, _sitesList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sitesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllSitesImplCopyWith<_$AllSitesImpl> get copyWith =>
      __$$AllSitesImplCopyWithImpl<_$AllSitesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Site> sitesList) allSites,
    required TResult Function() createSuccess,
    required TResult Function(dynamic error) failure,
  }) {
    return allSites(sitesList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Site> sitesList)? allSites,
    TResult? Function()? createSuccess,
    TResult? Function(dynamic error)? failure,
  }) {
    return allSites?.call(sitesList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Site> sitesList)? allSites,
    TResult Function()? createSuccess,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) {
    if (allSites != null) {
      return allSites(sitesList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SiteInitialState value) initial,
    required TResult Function(SiteLoadingState value) loading,
    required TResult Function(AllSites value) allSites,
    required TResult Function(SiteCreateSuccess value) createSuccess,
    required TResult Function(SiteFailure value) failure,
  }) {
    return allSites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SiteInitialState value)? initial,
    TResult? Function(SiteLoadingState value)? loading,
    TResult? Function(AllSites value)? allSites,
    TResult? Function(SiteCreateSuccess value)? createSuccess,
    TResult? Function(SiteFailure value)? failure,
  }) {
    return allSites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SiteInitialState value)? initial,
    TResult Function(SiteLoadingState value)? loading,
    TResult Function(AllSites value)? allSites,
    TResult Function(SiteCreateSuccess value)? createSuccess,
    TResult Function(SiteFailure value)? failure,
    required TResult orElse(),
  }) {
    if (allSites != null) {
      return allSites(this);
    }
    return orElse();
  }
}

abstract class AllSites implements SiteFirestoreState {
  const factory AllSites(final List<Site> sitesList) = _$AllSitesImpl;

  List<Site> get sitesList;
  @JsonKey(ignore: true)
  _$$AllSitesImplCopyWith<_$AllSitesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SiteCreateSuccessImplCopyWith<$Res> {
  factory _$$SiteCreateSuccessImplCopyWith(_$SiteCreateSuccessImpl value,
          $Res Function(_$SiteCreateSuccessImpl) then) =
      __$$SiteCreateSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SiteCreateSuccessImplCopyWithImpl<$Res>
    extends _$SiteFirestoreStateCopyWithImpl<$Res, _$SiteCreateSuccessImpl>
    implements _$$SiteCreateSuccessImplCopyWith<$Res> {
  __$$SiteCreateSuccessImplCopyWithImpl(_$SiteCreateSuccessImpl _value,
      $Res Function(_$SiteCreateSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SiteCreateSuccessImpl implements SiteCreateSuccess {
  const _$SiteCreateSuccessImpl();

  @override
  String toString() {
    return 'SiteFirestoreState.createSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SiteCreateSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Site> sitesList) allSites,
    required TResult Function() createSuccess,
    required TResult Function(dynamic error) failure,
  }) {
    return createSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Site> sitesList)? allSites,
    TResult? Function()? createSuccess,
    TResult? Function(dynamic error)? failure,
  }) {
    return createSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Site> sitesList)? allSites,
    TResult Function()? createSuccess,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) {
    if (createSuccess != null) {
      return createSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SiteInitialState value) initial,
    required TResult Function(SiteLoadingState value) loading,
    required TResult Function(AllSites value) allSites,
    required TResult Function(SiteCreateSuccess value) createSuccess,
    required TResult Function(SiteFailure value) failure,
  }) {
    return createSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SiteInitialState value)? initial,
    TResult? Function(SiteLoadingState value)? loading,
    TResult? Function(AllSites value)? allSites,
    TResult? Function(SiteCreateSuccess value)? createSuccess,
    TResult? Function(SiteFailure value)? failure,
  }) {
    return createSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SiteInitialState value)? initial,
    TResult Function(SiteLoadingState value)? loading,
    TResult Function(AllSites value)? allSites,
    TResult Function(SiteCreateSuccess value)? createSuccess,
    TResult Function(SiteFailure value)? failure,
    required TResult orElse(),
  }) {
    if (createSuccess != null) {
      return createSuccess(this);
    }
    return orElse();
  }
}

abstract class SiteCreateSuccess implements SiteFirestoreState {
  const factory SiteCreateSuccess() = _$SiteCreateSuccessImpl;
}

/// @nodoc
abstract class _$$SiteFailureImplCopyWith<$Res> {
  factory _$$SiteFailureImplCopyWith(
          _$SiteFailureImpl value, $Res Function(_$SiteFailureImpl) then) =
      __$$SiteFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$SiteFailureImplCopyWithImpl<$Res>
    extends _$SiteFirestoreStateCopyWithImpl<$Res, _$SiteFailureImpl>
    implements _$$SiteFailureImplCopyWith<$Res> {
  __$$SiteFailureImplCopyWithImpl(
      _$SiteFailureImpl _value, $Res Function(_$SiteFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$SiteFailureImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$SiteFailureImpl implements SiteFailure {
  const _$SiteFailureImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'SiteFirestoreState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteFailureImplCopyWith<_$SiteFailureImpl> get copyWith =>
      __$$SiteFailureImplCopyWithImpl<_$SiteFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Site> sitesList) allSites,
    required TResult Function() createSuccess,
    required TResult Function(dynamic error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Site> sitesList)? allSites,
    TResult? Function()? createSuccess,
    TResult? Function(dynamic error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Site> sitesList)? allSites,
    TResult Function()? createSuccess,
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
    required TResult Function(SiteInitialState value) initial,
    required TResult Function(SiteLoadingState value) loading,
    required TResult Function(AllSites value) allSites,
    required TResult Function(SiteCreateSuccess value) createSuccess,
    required TResult Function(SiteFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SiteInitialState value)? initial,
    TResult? Function(SiteLoadingState value)? loading,
    TResult? Function(AllSites value)? allSites,
    TResult? Function(SiteCreateSuccess value)? createSuccess,
    TResult? Function(SiteFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SiteInitialState value)? initial,
    TResult Function(SiteLoadingState value)? loading,
    TResult Function(AllSites value)? allSites,
    TResult Function(SiteCreateSuccess value)? createSuccess,
    TResult Function(SiteFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class SiteFailure implements SiteFirestoreState {
  const factory SiteFailure(final dynamic error) = _$SiteFailureImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$SiteFailureImplCopyWith<_$SiteFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
