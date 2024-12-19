// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Recipient {
  int get id => throw _privateConstructorUsedError;
  int get org_id => throw _privateConstructorUsedError;
  int get flag => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get checked => throw _privateConstructorUsedError;
  int get limited => throw _privateConstructorUsedError;
  int get usage => throw _privateConstructorUsedError;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipientCopyWith<Recipient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipientCopyWith<$Res> {
  factory $RecipientCopyWith(Recipient value, $Res Function(Recipient) then) =
      _$RecipientCopyWithImpl<$Res, Recipient>;
  @useResult
  $Res call(
      {int id,
      int org_id,
      int flag,
      String name,
      bool checked,
      int limited,
      int usage});
}

/// @nodoc
class _$RecipientCopyWithImpl<$Res, $Val extends Recipient>
    implements $RecipientCopyWith<$Res> {
  _$RecipientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? org_id = null,
    Object? flag = null,
    Object? name = null,
    Object? checked = null,
    Object? limited = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      org_id: null == org_id
          ? _value.org_id
          : org_id // ignore: cast_nullable_to_non_nullable
              as int,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      limited: null == limited
          ? _value.limited
          : limited // ignore: cast_nullable_to_non_nullable
              as int,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipientImplCopyWith<$Res>
    implements $RecipientCopyWith<$Res> {
  factory _$$RecipientImplCopyWith(
          _$RecipientImpl value, $Res Function(_$RecipientImpl) then) =
      __$$RecipientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int org_id,
      int flag,
      String name,
      bool checked,
      int limited,
      int usage});
}

/// @nodoc
class __$$RecipientImplCopyWithImpl<$Res>
    extends _$RecipientCopyWithImpl<$Res, _$RecipientImpl>
    implements _$$RecipientImplCopyWith<$Res> {
  __$$RecipientImplCopyWithImpl(
      _$RecipientImpl _value, $Res Function(_$RecipientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? org_id = null,
    Object? flag = null,
    Object? name = null,
    Object? checked = null,
    Object? limited = null,
    Object? usage = null,
  }) {
    return _then(_$RecipientImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      org_id: null == org_id
          ? _value.org_id
          : org_id // ignore: cast_nullable_to_non_nullable
              as int,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      limited: null == limited
          ? _value.limited
          : limited // ignore: cast_nullable_to_non_nullable
              as int,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecipientImpl implements _Recipient {
  const _$RecipientImpl(
      {required this.id,
      required this.org_id,
      required this.flag,
      required this.name,
      required this.checked,
      required this.limited,
      required this.usage});

  @override
  final int id;
  @override
  final int org_id;
  @override
  final int flag;
  @override
  final String name;
  @override
  final bool checked;
  @override
  final int limited;
  @override
  final int usage;

  @override
  String toString() {
    return 'Recipient(id: $id, org_id: $org_id, flag: $flag, name: $name, checked: $checked, limited: $limited, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.org_id, org_id) || other.org_id == org_id) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.checked, checked) || other.checked == checked) &&
            (identical(other.limited, limited) || other.limited == limited) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, org_id, flag, name, checked, limited, usage);

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipientImplCopyWith<_$RecipientImpl> get copyWith =>
      __$$RecipientImplCopyWithImpl<_$RecipientImpl>(this, _$identity);
}

abstract class _Recipient implements Recipient {
  const factory _Recipient(
      {required final int id,
      required final int org_id,
      required final int flag,
      required final String name,
      required final bool checked,
      required final int limited,
      required final int usage}) = _$RecipientImpl;

  @override
  int get id;
  @override
  int get org_id;
  @override
  int get flag;
  @override
  String get name;
  @override
  bool get checked;
  @override
  int get limited;
  @override
  int get usage;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipientImplCopyWith<_$RecipientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
