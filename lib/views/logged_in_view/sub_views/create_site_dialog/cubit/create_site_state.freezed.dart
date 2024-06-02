// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_site_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateSiteState {
  Site get site => throw _privateConstructorUsedError;
  List<Workplace> get workplaces => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateSiteStateCopyWith<CreateSiteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSiteStateCopyWith<$Res> {
  factory $CreateSiteStateCopyWith(
          CreateSiteState value, $Res Function(CreateSiteState) then) =
      _$CreateSiteStateCopyWithImpl<$Res, CreateSiteState>;
  @useResult
  $Res call({Site site, List<Workplace> workplaces});

  $SiteCopyWith<$Res> get site;
}

/// @nodoc
class _$CreateSiteStateCopyWithImpl<$Res, $Val extends CreateSiteState>
    implements $CreateSiteStateCopyWith<$Res> {
  _$CreateSiteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? site = null,
    Object? workplaces = null,
  }) {
    return _then(_value.copyWith(
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as Site,
      workplaces: null == workplaces
          ? _value.workplaces
          : workplaces // ignore: cast_nullable_to_non_nullable
              as List<Workplace>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SiteCopyWith<$Res> get site {
    return $SiteCopyWith<$Res>(_value.site, (value) {
      return _then(_value.copyWith(site: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateSiteStateImplCopyWith<$Res>
    implements $CreateSiteStateCopyWith<$Res> {
  factory _$$CreateSiteStateImplCopyWith(_$CreateSiteStateImpl value,
          $Res Function(_$CreateSiteStateImpl) then) =
      __$$CreateSiteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Site site, List<Workplace> workplaces});

  @override
  $SiteCopyWith<$Res> get site;
}

/// @nodoc
class __$$CreateSiteStateImplCopyWithImpl<$Res>
    extends _$CreateSiteStateCopyWithImpl<$Res, _$CreateSiteStateImpl>
    implements _$$CreateSiteStateImplCopyWith<$Res> {
  __$$CreateSiteStateImplCopyWithImpl(
      _$CreateSiteStateImpl _value, $Res Function(_$CreateSiteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? site = null,
    Object? workplaces = null,
  }) {
    return _then(_$CreateSiteStateImpl(
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as Site,
      workplaces: null == workplaces
          ? _value._workplaces
          : workplaces // ignore: cast_nullable_to_non_nullable
              as List<Workplace>,
    ));
  }
}

/// @nodoc

class _$CreateSiteStateImpl implements _CreateSiteState {
  const _$CreateSiteStateImpl(
      {required this.site, required final List<Workplace> workplaces})
      : _workplaces = workplaces;

  @override
  final Site site;
  final List<Workplace> _workplaces;
  @override
  List<Workplace> get workplaces {
    if (_workplaces is EqualUnmodifiableListView) return _workplaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workplaces);
  }

  @override
  String toString() {
    return 'CreateSiteState(site: $site, workplaces: $workplaces)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSiteStateImpl &&
            (identical(other.site, site) || other.site == site) &&
            const DeepCollectionEquality()
                .equals(other._workplaces, _workplaces));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, site, const DeepCollectionEquality().hash(_workplaces));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSiteStateImplCopyWith<_$CreateSiteStateImpl> get copyWith =>
      __$$CreateSiteStateImplCopyWithImpl<_$CreateSiteStateImpl>(
          this, _$identity);
}

abstract class _CreateSiteState implements CreateSiteState {
  const factory _CreateSiteState(
      {required final Site site,
      required final List<Workplace> workplaces}) = _$CreateSiteStateImpl;

  @override
  Site get site;
  @override
  List<Workplace> get workplaces;
  @override
  @JsonKey(ignore: true)
  _$$CreateSiteStateImplCopyWith<_$CreateSiteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
