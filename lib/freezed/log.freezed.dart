// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Log {
  int get id => throw _privateConstructorUsedError;
  Map<String, String> get text => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  Map<String, double> get data => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get modified => throw _privateConstructorUsedError;

  /// Create a copy of Log
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogCopyWith<Log> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogCopyWith<$Res> {
  factory $LogCopyWith(Log value, $Res Function(Log) then) =
      _$LogCopyWithImpl<$Res, Log>;
  @useResult
  $Res call(
      {int id,
      Map<String, String> text,
      int code,
      Map<String, double> data,
      DateTime created,
      DateTime modified});
}

/// @nodoc
class _$LogCopyWithImpl<$Res, $Val extends Log> implements $LogCopyWith<$Res> {
  _$LogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Log
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? code = null,
    Object? data = null,
    Object? created = null,
    Object? modified = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogImplCopyWith<$Res> implements $LogCopyWith<$Res> {
  factory _$$LogImplCopyWith(_$LogImpl value, $Res Function(_$LogImpl) then) =
      __$$LogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Map<String, String> text,
      int code,
      Map<String, double> data,
      DateTime created,
      DateTime modified});
}

/// @nodoc
class __$$LogImplCopyWithImpl<$Res> extends _$LogCopyWithImpl<$Res, _$LogImpl>
    implements _$$LogImplCopyWith<$Res> {
  __$$LogImplCopyWithImpl(_$LogImpl _value, $Res Function(_$LogImpl) _then)
      : super(_value, _then);

  /// Create a copy of Log
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? code = null,
    Object? data = null,
    Object? created = null,
    Object? modified = null,
  }) {
    return _then(_$LogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value._text
          : text // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$LogImpl implements _Log {
  const _$LogImpl(
      {required this.id,
      required final Map<String, String> text,
      required this.code,
      required final Map<String, double> data,
      required this.created,
      required this.modified})
      : _text = text,
        _data = data;

  @override
  final int id;
  final Map<String, String> _text;
  @override
  Map<String, String> get text {
    if (_text is EqualUnmodifiableMapView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_text);
  }

  @override
  final int code;
  final Map<String, double> _data;
  @override
  Map<String, double> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final DateTime created;
  @override
  final DateTime modified;

  @override
  String toString() {
    return 'Log(id: $id, text: $text, code: $code, data: $data, created: $created, modified: $modified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._text, _text) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.modified, modified) ||
                other.modified == modified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_text),
      code,
      const DeepCollectionEquality().hash(_data),
      created,
      modified);

  /// Create a copy of Log
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogImplCopyWith<_$LogImpl> get copyWith =>
      __$$LogImplCopyWithImpl<_$LogImpl>(this, _$identity);
}

abstract class _Log implements Log {
  const factory _Log(
      {required final int id,
      required final Map<String, String> text,
      required final int code,
      required final Map<String, double> data,
      required final DateTime created,
      required final DateTime modified}) = _$LogImpl;

  @override
  int get id;
  @override
  Map<String, String> get text;
  @override
  int get code;
  @override
  Map<String, double> get data;
  @override
  DateTime get created;
  @override
  DateTime get modified;

  /// Create a copy of Log
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogImplCopyWith<_$LogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
