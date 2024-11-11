// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Monitor {
  int get id => throw _privateConstructorUsedError;
  int get org_id => throw _privateConstructorUsedError;
  int get flag => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get remarks => throw _privateConstructorUsedError;
  bool get checked => throw _privateConstructorUsedError;

  /// Create a copy of Monitor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonitorCopyWith<Monitor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitorCopyWith<$Res> {
  factory $MonitorCopyWith(Monitor value, $Res Function(Monitor) then) =
      _$MonitorCopyWithImpl<$Res, Monitor>;
  @useResult
  $Res call(
      {int id, int org_id, int flag, String url, String remarks, bool checked});
}

/// @nodoc
class _$MonitorCopyWithImpl<$Res, $Val extends Monitor>
    implements $MonitorCopyWith<$Res> {
  _$MonitorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Monitor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? org_id = null,
    Object? flag = null,
    Object? url = null,
    Object? remarks = null,
    Object? checked = null,
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
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitorImplCopyWith<$Res> implements $MonitorCopyWith<$Res> {
  factory _$$MonitorImplCopyWith(
          _$MonitorImpl value, $Res Function(_$MonitorImpl) then) =
      __$$MonitorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int org_id, int flag, String url, String remarks, bool checked});
}

/// @nodoc
class __$$MonitorImplCopyWithImpl<$Res>
    extends _$MonitorCopyWithImpl<$Res, _$MonitorImpl>
    implements _$$MonitorImplCopyWith<$Res> {
  __$$MonitorImplCopyWithImpl(
      _$MonitorImpl _value, $Res Function(_$MonitorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Monitor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? org_id = null,
    Object? flag = null,
    Object? url = null,
    Object? remarks = null,
    Object? checked = null,
  }) {
    return _then(_$MonitorImpl(
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
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MonitorImpl implements _Monitor {
  const _$MonitorImpl(
      {required this.id,
      required this.org_id,
      required this.flag,
      required this.url,
      required this.remarks,
      required this.checked});

  @override
  final int id;
  @override
  final int org_id;
  @override
  final int flag;
  @override
  final String url;
  @override
  final String remarks;
  @override
  final bool checked;

  @override
  String toString() {
    return 'Monitor(id: $id, org_id: $org_id, flag: $flag, url: $url, remarks: $remarks, checked: $checked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.org_id, org_id) || other.org_id == org_id) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.checked, checked) || other.checked == checked));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, org_id, flag, url, remarks, checked);

  /// Create a copy of Monitor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitorImplCopyWith<_$MonitorImpl> get copyWith =>
      __$$MonitorImplCopyWithImpl<_$MonitorImpl>(this, _$identity);
}

abstract class _Monitor implements Monitor {
  const factory _Monitor(
      {required final int id,
      required final int org_id,
      required final int flag,
      required final String url,
      required final String remarks,
      required final bool checked}) = _$MonitorImpl;

  @override
  int get id;
  @override
  int get org_id;
  @override
  int get flag;
  @override
  String get url;
  @override
  String get remarks;
  @override
  bool get checked;

  /// Create a copy of Monitor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonitorImplCopyWith<_$MonitorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
