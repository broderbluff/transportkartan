// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiteMarker _$SiteMarkerFromJson(Map<String, dynamic> json) {
  return _SiteMarker.fromJson(json);
}

/// @nodoc
mixin _$SiteMarker {
  String? get id => throw _privateConstructorUsedError;
  SiteType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get unit => throw _privateConstructorUsedError;
  UnitType? get unitType => throw _privateConstructorUsedError;
  List<double> get coordinates => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get companies =>
      throw _privateConstructorUsedError; //List<Polyline>? polylinePoints,
  List<String>? get subContractors => throw _privateConstructorUsedError;
  List<String>? get staffingCompanies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteMarkerCopyWith<SiteMarker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteMarkerCopyWith<$Res> {
  factory $SiteMarkerCopyWith(
          SiteMarker value, $Res Function(SiteMarker) then) =
      _$SiteMarkerCopyWithImpl<$Res, SiteMarker>;
  @useResult
  $Res call(
      {String? id,
      SiteType type,
      String name,
      int? unit,
      UnitType? unitType,
      List<double> coordinates,
      String description,
      List<String> companies,
      List<String>? subContractors,
      List<String>? staffingCompanies});
}

/// @nodoc
class _$SiteMarkerCopyWithImpl<$Res, $Val extends SiteMarker>
    implements $SiteMarkerCopyWith<$Res> {
  _$SiteMarkerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? name = null,
    Object? unit = freezed,
    Object? unitType = freezed,
    Object? coordinates = null,
    Object? description = null,
    Object? companies = null,
    Object? subContractors = freezed,
    Object? staffingCompanies = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SiteType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int?,
      unitType: freezed == unitType
          ? _value.unitType
          : unitType // ignore: cast_nullable_to_non_nullable
              as UnitType?,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      companies: null == companies
          ? _value.companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subContractors: freezed == subContractors
          ? _value.subContractors
          : subContractors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      staffingCompanies: freezed == staffingCompanies
          ? _value.staffingCompanies
          : staffingCompanies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiteMarkerImplCopyWith<$Res>
    implements $SiteMarkerCopyWith<$Res> {
  factory _$$SiteMarkerImplCopyWith(
          _$SiteMarkerImpl value, $Res Function(_$SiteMarkerImpl) then) =
      __$$SiteMarkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      SiteType type,
      String name,
      int? unit,
      UnitType? unitType,
      List<double> coordinates,
      String description,
      List<String> companies,
      List<String>? subContractors,
      List<String>? staffingCompanies});
}

/// @nodoc
class __$$SiteMarkerImplCopyWithImpl<$Res>
    extends _$SiteMarkerCopyWithImpl<$Res, _$SiteMarkerImpl>
    implements _$$SiteMarkerImplCopyWith<$Res> {
  __$$SiteMarkerImplCopyWithImpl(
      _$SiteMarkerImpl _value, $Res Function(_$SiteMarkerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? name = null,
    Object? unit = freezed,
    Object? unitType = freezed,
    Object? coordinates = null,
    Object? description = null,
    Object? companies = null,
    Object? subContractors = freezed,
    Object? staffingCompanies = freezed,
  }) {
    return _then(_$SiteMarkerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SiteType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int?,
      unitType: freezed == unitType
          ? _value.unitType
          : unitType // ignore: cast_nullable_to_non_nullable
              as UnitType?,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      companies: null == companies
          ? _value._companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subContractors: freezed == subContractors
          ? _value._subContractors
          : subContractors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      staffingCompanies: freezed == staffingCompanies
          ? _value._staffingCompanies
          : staffingCompanies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteMarkerImpl implements _SiteMarker {
  const _$SiteMarkerImpl(
      {this.id,
      required this.type,
      required this.name,
      this.unit,
      this.unitType,
      required final List<double> coordinates,
      required this.description,
      required final List<String> companies,
      final List<String>? subContractors,
      final List<String>? staffingCompanies})
      : _coordinates = coordinates,
        _companies = companies,
        _subContractors = subContractors,
        _staffingCompanies = staffingCompanies;

  factory _$SiteMarkerImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteMarkerImplFromJson(json);

  @override
  final String? id;
  @override
  final SiteType type;
  @override
  final String name;
  @override
  final int? unit;
  @override
  final UnitType? unitType;
  final List<double> _coordinates;
  @override
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  final String description;
  final List<String> _companies;
  @override
  List<String> get companies {
    if (_companies is EqualUnmodifiableListView) return _companies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companies);
  }

//List<Polyline>? polylinePoints,
  final List<String>? _subContractors;
//List<Polyline>? polylinePoints,
  @override
  List<String>? get subContractors {
    final value = _subContractors;
    if (value == null) return null;
    if (_subContractors is EqualUnmodifiableListView) return _subContractors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _staffingCompanies;
  @override
  List<String>? get staffingCompanies {
    final value = _staffingCompanies;
    if (value == null) return null;
    if (_staffingCompanies is EqualUnmodifiableListView)
      return _staffingCompanies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SiteMarker(id: $id, type: $type, name: $name, unit: $unit, unitType: $unitType, coordinates: $coordinates, description: $description, companies: $companies, subContractors: $subContractors, staffingCompanies: $staffingCompanies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteMarkerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unitType, unitType) ||
                other.unitType == unitType) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._companies, _companies) &&
            const DeepCollectionEquality()
                .equals(other._subContractors, _subContractors) &&
            const DeepCollectionEquality()
                .equals(other._staffingCompanies, _staffingCompanies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      unit,
      unitType,
      const DeepCollectionEquality().hash(_coordinates),
      description,
      const DeepCollectionEquality().hash(_companies),
      const DeepCollectionEquality().hash(_subContractors),
      const DeepCollectionEquality().hash(_staffingCompanies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteMarkerImplCopyWith<_$SiteMarkerImpl> get copyWith =>
      __$$SiteMarkerImplCopyWithImpl<_$SiteMarkerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteMarkerImplToJson(
      this,
    );
  }
}

abstract class _SiteMarker implements SiteMarker {
  const factory _SiteMarker(
      {final String? id,
      required final SiteType type,
      required final String name,
      final int? unit,
      final UnitType? unitType,
      required final List<double> coordinates,
      required final String description,
      required final List<String> companies,
      final List<String>? subContractors,
      final List<String>? staffingCompanies}) = _$SiteMarkerImpl;

  factory _SiteMarker.fromJson(Map<String, dynamic> json) =
      _$SiteMarkerImpl.fromJson;

  @override
  String? get id;
  @override
  SiteType get type;
  @override
  String get name;
  @override
  int? get unit;
  @override
  UnitType? get unitType;
  @override
  List<double> get coordinates;
  @override
  String get description;
  @override
  List<String> get companies;
  @override //List<Polyline>? polylinePoints,
  List<String>? get subContractors;
  @override
  List<String>? get staffingCompanies;
  @override
  @JsonKey(ignore: true)
  _$$SiteMarkerImplCopyWith<_$SiteMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
