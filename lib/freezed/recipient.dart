import 'package:freezed_annotation/freezed_annotation.dart';
part 'recipient.freezed.dart';

@freezed
class Recipient with _$Recipient {
  const factory Recipient({
    required int id,
    required int org_id,
    required int flag,
    required String name,
    required bool checked,
  }) = _Recipient;
}
