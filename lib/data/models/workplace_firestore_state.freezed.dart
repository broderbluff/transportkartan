// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workplace_firestore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkplaceFirestoreState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Workplace> workplaceList) allWorkplaces,
    required TResult Function() createSuccess,
    required TResult Function(dynamic error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Workplace> workplaceList)? allWorkplaces,
    TResult? Function()? createSuccess,
    TResult? Function(dynamic error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Workplace> workplaceList)? allWorkplaces,
    TResult Function()? createSuccess,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(AllWorkplaces value) allWorkplaces,
    required TResult Function(CreateSuccess value) createSuccess,
    required TResult Function(Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(AllWorkplaces value)? allWorkplaces,
    TResult? Function(CreateSuccess value)? createSuccess,
    TResult? Function(Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(AllWorkplaces value)? allWorkplaces,
    TResult Function(CreateSuccess value)? createSuccess,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkplaceFirestoreStateCopyWith<$Res> {
  factory $WorkplaceFirestoreStateCopyWith(WorkplaceFirestoreState value,
          $Res Function(WorkplaceFirestoreState) then) =
      _$WorkplaceFirestoreStateCopyWithImpl<$Res, WorkplaceFirestoreState>;
}

/// @nodoc
class _$WorkplaceFirestoreStateCopyWithImpl<$Res,
        $Val extends WorkplaceFirestoreState>
    implements $WorkplaceFirestoreStateCopyWith<$Res> {
  _$WorkplaceFirestoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$WorkplaceFirestoreStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialStateImpl implements InitialState {
  const _$InitialStateImpl();

  @override
  String toString() {
    return 'WorkplaceFirestoreState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Workplace> workplaceList) allWorkplaces,
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
    TResult? Function(List<Workplace> workplaceList)? allWorkplaces,
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
    TResult Function(List<Workplace> workplaceList)? allWorkplaces,
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
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(AllWorkplaces value) allWorkplaces,
    required TResult Function(CreateSuccess value) createSuccess,
    required TResult Function(Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(AllWorkplaces value)? allWorkplaces,
    TResult? Function(CreateSuccess value)? createSuccess,
    TResult? Function(Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(AllWorkplaces value)? allWorkplaces,
    TResult Function(CreateSuccess value)? createSuccess,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState implements WorkplaceFirestoreState {
  const factory InitialState() = _$InitialStateImpl;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$WorkplaceFirestoreStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl implements LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'WorkplaceFirestoreState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Workplace> workplaceList) allWorkplaces,
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
    TResult? Function(List<Workplace> workplaceList)? allWorkplaces,
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
    TResult Function(List<Workplace> workplaceList)? allWorkplaces,
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
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(AllWorkplaces value) allWorkplaces,
    required TResult Function(CreateSuccess value) createSuccess,
    required TResult Function(Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(AllWorkplaces value)? allWorkplaces,
    TResult? Function(CreateSuccess value)? createSuccess,
    TResult? Function(Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(AllWorkplaces value)? allWorkplaces,
    TResult Function(CreateSuccess value)? createSuccess,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements WorkplaceFirestoreState {
  const factory LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$AllWorkplacesImplCopyWith<$Res> {
  factory _$$AllWorkplacesImplCopyWith(
          _$AllWorkplacesImpl value, $Res Function(_$AllWorkplacesImpl) then) =
      __$$AllWorkplacesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Workplace> workplaceList});
}

/// @nodoc
class __$$AllWorkplacesImplCopyWithImpl<$Res>
    extends _$WorkplaceFirestoreStateCopyWithImpl<$Res, _$AllWorkplacesImpl>
    implements _$$AllWorkplacesImplCopyWith<$Res> {
  __$$AllWorkplacesImplCopyWithImpl(
      _$AllWorkplacesImpl _value, $Res Function(_$AllWorkplacesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workplaceList = null,
  }) {
    return _then(_$AllWorkplacesImpl(
      null == workplaceList
          ? _value._workplaceList
          : workplaceList // ignore: cast_nullable_to_non_nullable
              as List<Workplace>,
    ));
  }
}

/// @nodoc

class _$AllWorkplacesImpl implements AllWorkplaces {
  const _$AllWorkplacesImpl(final List<Workplace> workplaceList)
      : _workplaceList = workplaceList;

  final List<Workplace> _workplaceList;
  @override
  List<Workplace> get workplaceList {
    if (_workplaceList is EqualUnmodifiableListView) return _workplaceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workplaceList);
  }

  @override
  String toString() {
    return 'WorkplaceFirestoreState.allWorkplaces(workplaceList: $workplaceList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllWorkplacesImpl &&
            const DeepCollectionEquality()
                .equals(other._workplaceList, _workplaceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_workplaceList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllWorkplacesImplCopyWith<_$AllWorkplacesImpl> get copyWith =>
      __$$AllWorkplacesImplCopyWithImpl<_$AllWorkplacesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Workplace> workplaceList) allWorkplaces,
    required TResult Function() createSuccess,
    required TResult Function(dynamic error) failure,
  }) {
    return allWorkplaces(workplaceList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Workplace> workplaceList)? allWorkplaces,
    TResult? Function()? createSuccess,
    TResult? Function(dynamic error)? failure,
  }) {
    return allWorkplaces?.call(workplaceList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Workplace> workplaceList)? allWorkplaces,
    TResult Function()? createSuccess,
    TResult Function(dynamic error)? failure,
    required TResult orElse(),
  }) {
    if (allWorkplaces != null) {
      return allWorkplaces(workplaceList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(AllWorkplaces value) allWorkplaces,
    required TResult Function(CreateSuccess value) createSuccess,
    required TResult Function(Failure value) failure,
  }) {
    return allWorkplaces(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(AllWorkplaces value)? allWorkplaces,
    TResult? Function(CreateSuccess value)? createSuccess,
    TResult? Function(Failure value)? failure,
  }) {
    return allWorkplaces?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(AllWorkplaces value)? allWorkplaces,
    TResult Function(CreateSuccess value)? createSuccess,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (allWorkplaces != null) {
      return allWorkplaces(this);
    }
    return orElse();
  }
}

abstract class AllWorkplaces implements WorkplaceFirestoreState {
  const factory AllWorkplaces(final List<Workplace> workplaceList) =
      _$AllWorkplacesImpl;

  List<Workplace> get workplaceList;
  @JsonKey(ignore: true)
  _$$AllWorkplacesImplCopyWith<_$AllWorkplacesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateSuccessImplCopyWith<$Res> {
  factory _$$CreateSuccessImplCopyWith(
          _$CreateSuccessImpl value, $Res Function(_$CreateSuccessImpl) then) =
      __$$CreateSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateSuccessImplCopyWithImpl<$Res>
    extends _$WorkplaceFirestoreStateCopyWithImpl<$Res, _$CreateSuccessImpl>
    implements _$$CreateSuccessImplCopyWith<$Res> {
  __$$CreateSuccessImplCopyWithImpl(
      _$CreateSuccessImpl _value, $Res Function(_$CreateSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateSuccessImpl implements CreateSuccess {
  const _$CreateSuccessImpl();

  @override
  String toString() {
    return 'WorkplaceFirestoreState.createSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Workplace> workplaceList) allWorkplaces,
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
    TResult? Function(List<Workplace> workplaceList)? allWorkplaces,
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
    TResult Function(List<Workplace> workplaceList)? allWorkplaces,
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
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(AllWorkplaces value) allWorkplaces,
    required TResult Function(CreateSuccess value) createSuccess,
    required TResult Function(Failure value) failure,
  }) {
    return createSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(AllWorkplaces value)? allWorkplaces,
    TResult? Function(CreateSuccess value)? createSuccess,
    TResult? Function(Failure value)? failure,
  }) {
    return createSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(AllWorkplaces value)? allWorkplaces,
    TResult Function(CreateSuccess value)? createSuccess,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (createSuccess != null) {
      return createSuccess(this);
    }
    return orElse();
  }
}

abstract class CreateSuccess implements WorkplaceFirestoreState {
  const factory CreateSuccess() = _$CreateSuccessImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$WorkplaceFirestoreStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$FailureImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements Failure {
  const _$FailureImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'WorkplaceFirestoreState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Workplace> workplaceList) allWorkplaces,
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
    TResult? Function(List<Workplace> workplaceList)? allWorkplaces,
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
    TResult Function(List<Workplace> workplaceList)? allWorkplaces,
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
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(AllWorkplaces value) allWorkplaces,
    required TResult Function(CreateSuccess value) createSuccess,
    required TResult Function(Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(AllWorkplaces value)? allWorkplaces,
    TResult? Function(CreateSuccess value)? createSuccess,
    TResult? Function(Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(AllWorkplaces value)? allWorkplaces,
    TResult Function(CreateSuccess value)? createSuccess,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements WorkplaceFirestoreState {
  const factory Failure(final dynamic error) = _$FailureImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
