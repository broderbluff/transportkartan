// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactModel {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<String>? get workplaces => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactModelCopyWith<ContactModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactModelCopyWith<$Res> {
  factory $ContactModelCopyWith(
          ContactModel value, $Res Function(ContactModel) then) =
      _$ContactModelCopyWithImpl<$Res, ContactModel>;
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? phone,
      String? title,
      List<String>? workplaces});
}

/// @nodoc
class _$ContactModelCopyWithImpl<$Res, $Val extends ContactModel>
    implements $ContactModelCopyWith<$Res> {
  _$ContactModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? title = freezed,
    Object? workplaces = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaces: freezed == workplaces
          ? _value.workplaces
          : workplaces // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactModelImplCopyWith<$Res>
    implements $ContactModelCopyWith<$Res> {
  factory _$$ContactModelImplCopyWith(
          _$ContactModelImpl value, $Res Function(_$ContactModelImpl) then) =
      __$$ContactModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? phone,
      String? title,
      List<String>? workplaces});
}

/// @nodoc
class __$$ContactModelImplCopyWithImpl<$Res>
    extends _$ContactModelCopyWithImpl<$Res, _$ContactModelImpl>
    implements _$$ContactModelImplCopyWith<$Res> {
  __$$ContactModelImplCopyWithImpl(
      _$ContactModelImpl _value, $Res Function(_$ContactModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? title = freezed,
    Object? workplaces = freezed,
  }) {
    return _then(_$ContactModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaces: freezed == workplaces
          ? _value._workplaces
          : workplaces // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$ContactModelImpl implements _ContactModel {
  const _$ContactModelImpl(
      {this.name,
      this.email,
      this.phone,
      this.title,
      final List<String>? workplaces})
      : _workplaces = workplaces;

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? title;
  final List<String>? _workplaces;
  @override
  List<String>? get workplaces {
    final value = _workplaces;
    if (value == null) return null;
    if (_workplaces is EqualUnmodifiableListView) return _workplaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ContactModel(name: $name, email: $email, phone: $phone, title: $title, workplaces: $workplaces)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._workplaces, _workplaces));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone, title,
      const DeepCollectionEquality().hash(_workplaces));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactModelImplCopyWith<_$ContactModelImpl> get copyWith =>
      __$$ContactModelImplCopyWithImpl<_$ContactModelImpl>(this, _$identity);
}

abstract class _ContactModel implements ContactModel {
  const factory _ContactModel(
      {final String? name,
      final String? email,
      final String? phone,
      final String? title,
      final List<String>? workplaces}) = _$ContactModelImpl;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get title;
  @override
  List<String>? get workplaces;
  @override
  @JsonKey(ignore: true)
  _$$ContactModelImplCopyWith<_$ContactModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
