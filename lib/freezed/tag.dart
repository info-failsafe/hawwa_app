import 'package:freezed_annotation/freezed_annotation.dart';
part 'tag.freezed.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    required int id,
    required int org_id,
    required int flag,
    required String name,
    required String remarks,
    required bool checked,
  }) = _Tag;
}
