import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote_rate.freezed.dart';
part 'vote_rate.g.dart';

@freezed
class VoteRate with _$VoteRate {
  const factory VoteRate({
    required int matchUserId,
    required String nickname,
    required String championThumbnail,
    required int voteOptionsId,
    required int rate,
  }) = _VoteRate;

  factory VoteRate.fromJson(Map<String, dynamic> json) =>
      _$VoteRateFromJson(json);
}
