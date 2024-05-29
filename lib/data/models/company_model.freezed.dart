// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return _Company.fromJson(json);
}

/// @nodoc
mixin _$Company {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  UnionType? get union => throw _privateConstructorUsedError;
  int get totalEmployees => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  String? get websiteUrl => throw _privateConstructorUsedError;
  String? get facebookUrl => throw _privateConstructorUsedError;
  bool? get isITF => throw _privateConstructorUsedError;
  String? get linkedInUrl => throw _privateConstructorUsedError;
  String get orgNumber => throw _privateConstructorUsedError;
  String? get headquarterAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyCopyWith<Company> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) then) =
      _$CompanyCopyWithImpl<$Res, Company>;
  @useResult
  $Res call(
      {String name,
      String description,
      UnionType? union,
      int totalEmployees,
      String id,
      String? logoUrl,
      String? websiteUrl,
      String? facebookUrl,
      bool? isITF,
      String? linkedInUrl,
      String orgNumber,
      String? headquarterAddress});
}

/// @nodoc
class _$CompanyCopyWithImpl<$Res, $Val extends Company>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? union = freezed,
    Object? totalEmployees = null,
    Object? id = null,
    Object? logoUrl = freezed,
    Object? websiteUrl = freezed,
    Object? facebookUrl = freezed,
    Object? isITF = freezed,
    Object? linkedInUrl = freezed,
    Object? orgNumber = null,
    Object? headquarterAddress = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      union: freezed == union
          ? _value.union
          : union // ignore: cast_nullable_to_non_nullable
              as UnionType?,
      totalEmployees: null == totalEmployees
          ? _value.totalEmployees
          : totalEmployees // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      facebookUrl: freezed == facebookUrl
          ? _value.facebookUrl
          : facebookUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isITF: freezed == isITF
          ? _value.isITF
          : isITF // ignore: cast_nullable_to_non_nullable
              as bool?,
      linkedInUrl: freezed == linkedInUrl
          ? _value.linkedInUrl
          : linkedInUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      orgNumber: null == orgNumber
          ? _value.orgNumber
          : orgNumber // ignore: cast_nullable_to_non_nullable
              as String,
      headquarterAddress: freezed == headquarterAddress
          ? _value.headquarterAddress
          : headquarterAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyImplCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$$CompanyImplCopyWith(
          _$CompanyImpl value, $Res Function(_$CompanyImpl) then) =
      __$$CompanyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      UnionType? union,
      int totalEmployees,
      String id,
      String? logoUrl,
      String? websiteUrl,
      String? facebookUrl,
      bool? isITF,
      String? linkedInUrl,
      String orgNumber,
      String? headquarterAddress});
}

/// @nodoc
class __$$CompanyImplCopyWithImpl<$Res>
    extends _$CompanyCopyWithImpl<$Res, _$CompanyImpl>
    implements _$$CompanyImplCopyWith<$Res> {
  __$$CompanyImplCopyWithImpl(
      _$CompanyImpl _value, $Res Function(_$CompanyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? union = freezed,
    Object? totalEmployees = null,
    Object? id = null,
    Object? logoUrl = freezed,
    Object? websiteUrl = freezed,
    Object? facebookUrl = freezed,
    Object? isITF = freezed,
    Object? linkedInUrl = freezed,
    Object? orgNumber = null,
    Object? headquarterAddress = freezed,
  }) {
    return _then(_$CompanyImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      union: freezed == union
          ? _value.union
          : union // ignore: cast_nullable_to_non_nullable
              as UnionType?,
      totalEmployees: null == totalEmployees
          ? _value.totalEmployees
          : totalEmployees // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      facebookUrl: freezed == facebookUrl
          ? _value.facebookUrl
          : facebookUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isITF: freezed == isITF
          ? _value.isITF
          : isITF // ignore: cast_nullable_to_non_nullable
              as bool?,
      linkedInUrl: freezed == linkedInUrl
          ? _value.linkedInUrl
          : linkedInUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      orgNumber: null == orgNumber
          ? _value.orgNumber
          : orgNumber // ignore: cast_nullable_to_non_nullable
              as String,
      headquarterAddress: freezed == headquarterAddress
          ? _value.headquarterAddress
          : headquarterAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyImpl implements _Company {
  const _$CompanyImpl(
      {required this.name,
      required this.description,
      this.union,
      required this.totalEmployees,
      required this.id,
      this.logoUrl,
      this.websiteUrl,
      this.facebookUrl,
      this.isITF,
      this.linkedInUrl,
      required this.orgNumber,
      this.headquarterAddress});

  factory _$CompanyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final UnionType? union;
  @override
  final int totalEmployees;
  @override
  final String id;
  @override
  final String? logoUrl;
  @override
  final String? websiteUrl;
  @override
  final String? facebookUrl;
  @override
  final bool? isITF;
  @override
  final String? linkedInUrl;
  @override
  final String orgNumber;
  @override
  final String? headquarterAddress;

  @override
  String toString() {
    return 'Company(name: $name, description: $description, union: $union, totalEmployees: $totalEmployees, id: $id, logoUrl: $logoUrl, websiteUrl: $websiteUrl, facebookUrl: $facebookUrl, isITF: $isITF, linkedInUrl: $linkedInUrl, orgNumber: $orgNumber, headquarterAddress: $headquarterAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.union, union) || other.union == union) &&
            (identical(other.totalEmployees, totalEmployees) ||
                other.totalEmployees == totalEmployees) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.facebookUrl, facebookUrl) ||
                other.facebookUrl == facebookUrl) &&
            (identical(other.isITF, isITF) || other.isITF == isITF) &&
            (identical(other.linkedInUrl, linkedInUrl) ||
                other.linkedInUrl == linkedInUrl) &&
            (identical(other.orgNumber, orgNumber) ||
                other.orgNumber == orgNumber) &&
            (identical(other.headquarterAddress, headquarterAddress) ||
                other.headquarterAddress == headquarterAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      union,
      totalEmployees,
      id,
      logoUrl,
      websiteUrl,
      facebookUrl,
      isITF,
      linkedInUrl,
      orgNumber,
      headquarterAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      __$$CompanyImplCopyWithImpl<_$CompanyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyImplToJson(
      this,
    );
  }
}

abstract class _Company implements Company {
  const factory _Company(
      {required final String name,
      required final String description,
      final UnionType? union,
      required final int totalEmployees,
      required final String id,
      final String? logoUrl,
      final String? websiteUrl,
      final String? facebookUrl,
      final bool? isITF,
      final String? linkedInUrl,
      required final String orgNumber,
      final String? headquarterAddress}) = _$CompanyImpl;

  factory _Company.fromJson(Map<String, dynamic> json) = _$CompanyImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  UnionType? get union;
  @override
  int get totalEmployees;
  @override
  String get id;
  @override
  String? get logoUrl;
  @override
  String? get websiteUrl;
  @override
  String? get facebookUrl;
  @override
  bool? get isITF;
  @override
  String? get linkedInUrl;
  @override
  String get orgNumber;
  @override
  String? get headquarterAddress;
  @override
  @JsonKey(ignore: true)
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
