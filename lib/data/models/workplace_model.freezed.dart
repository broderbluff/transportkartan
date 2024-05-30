// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workplace_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Workplace _$WorkplaceFromJson(Map<String, dynamic> json) {
  return _Workplace.fromJson(json);
}

/// @nodoc
mixin _$Workplace {
  String get id => throw _privateConstructorUsedError;
  String get companyId => throw _privateConstructorUsedError;
  String get siteId => throw _privateConstructorUsedError;
  int get members => throw _privateConstructorUsedError;
  int get electedOfficials => throw _privateConstructorUsedError;
  int get employees => throw _privateConstructorUsedError;
  CompanyType? get companyType => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkplaceCopyWith<Workplace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkplaceCopyWith<$Res> {
  factory $WorkplaceCopyWith(Workplace value, $Res Function(Workplace) then) =
      _$WorkplaceCopyWithImpl<$Res, Workplace>;
  @useResult
  $Res call(
      {String id,
      String companyId,
      String siteId,
      int members,
      int electedOfficials,
      int employees,
      CompanyType? companyType,
      String updatedAt});
}

/// @nodoc
class _$WorkplaceCopyWithImpl<$Res, $Val extends Workplace>
    implements $WorkplaceCopyWith<$Res> {
  _$WorkplaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? siteId = null,
    Object? members = null,
    Object? electedOfficials = null,
    Object? employees = null,
    Object? companyType = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as int,
      electedOfficials: null == electedOfficials
          ? _value.electedOfficials
          : electedOfficials // ignore: cast_nullable_to_non_nullable
              as int,
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int,
      companyType: freezed == companyType
          ? _value.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as CompanyType?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkplaceImplCopyWith<$Res>
    implements $WorkplaceCopyWith<$Res> {
  factory _$$WorkplaceImplCopyWith(
          _$WorkplaceImpl value, $Res Function(_$WorkplaceImpl) then) =
      __$$WorkplaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String companyId,
      String siteId,
      int members,
      int electedOfficials,
      int employees,
      CompanyType? companyType,
      String updatedAt});
}

/// @nodoc
class __$$WorkplaceImplCopyWithImpl<$Res>
    extends _$WorkplaceCopyWithImpl<$Res, _$WorkplaceImpl>
    implements _$$WorkplaceImplCopyWith<$Res> {
  __$$WorkplaceImplCopyWithImpl(
      _$WorkplaceImpl _value, $Res Function(_$WorkplaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? siteId = null,
    Object? members = null,
    Object? electedOfficials = null,
    Object? employees = null,
    Object? companyType = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_$WorkplaceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as int,
      electedOfficials: null == electedOfficials
          ? _value.electedOfficials
          : electedOfficials // ignore: cast_nullable_to_non_nullable
              as int,
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int,
      companyType: freezed == companyType
          ? _value.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as CompanyType?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkplaceImpl implements _Workplace {
  const _$WorkplaceImpl(
      {required this.id,
      required this.companyId,
      required this.siteId,
      required this.members,
      required this.electedOfficials,
      required this.employees,
      required this.companyType,
      required this.updatedAt});

  factory _$WorkplaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkplaceImplFromJson(json);

  @override
  final String id;
  @override
  final String companyId;
  @override
  final String siteId;
  @override
  final int members;
  @override
  final int electedOfficials;
  @override
  final int employees;
  @override
  final CompanyType? companyType;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'Workplace(id: $id, companyId: $companyId, siteId: $siteId, members: $members, electedOfficials: $electedOfficials, employees: $employees, companyType: $companyType, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkplaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.members, members) || other.members == members) &&
            (identical(other.electedOfficials, electedOfficials) ||
                other.electedOfficials == electedOfficials) &&
            (identical(other.employees, employees) ||
                other.employees == employees) &&
            (identical(other.companyType, companyType) ||
                other.companyType == companyType) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, companyId, siteId, members,
      electedOfficials, employees, companyType, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkplaceImplCopyWith<_$WorkplaceImpl> get copyWith =>
      __$$WorkplaceImplCopyWithImpl<_$WorkplaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkplaceImplToJson(
      this,
    );
  }
}

abstract class _Workplace implements Workplace {
  const factory _Workplace(
      {required final String id,
      required final String companyId,
      required final String siteId,
      required final int members,
      required final int electedOfficials,
      required final int employees,
      required final CompanyType? companyType,
      required final String updatedAt}) = _$WorkplaceImpl;

  factory _Workplace.fromJson(Map<String, dynamic> json) =
      _$WorkplaceImpl.fromJson;

  @override
  String get id;
  @override
  String get companyId;
  @override
  String get siteId;
  @override
  int get members;
  @override
  int get electedOfficials;
  @override
  int get employees;
  @override
  CompanyType? get companyType;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$WorkplaceImplCopyWith<_$WorkplaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
