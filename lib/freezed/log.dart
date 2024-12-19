import 'package:freezed_annotation/freezed_annotation.dart';
part 'log.freezed.dart';

@freezed
class Log with _$Log {
  const factory Log({
    required int id,
    required Map<String, String> text,
    required int code,
    required Map<String, double> data,
    required DateTime created,
    required DateTime modified,
  }) = _Log;
}
