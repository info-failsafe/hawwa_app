import 'package:freezed_annotation/freezed_annotation.dart';
part 'monitor.freezed.dart';

@freezed
class Monitor with _$Monitor {
  const factory Monitor({
    required int id,
    required int org_id,
    required int flag,
    required String name,
    required bool checked,
  }) = _Monitor;
}
