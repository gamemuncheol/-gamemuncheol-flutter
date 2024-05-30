import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:gamemuncheol/feature/member/model/member.dart';
import 'package:gamemuncheol/feature/feed/model/vote_rate.dart';


part 'feed.freezed.dart';
part 'feed.g.dart';

@freezed
class Feed with _$Feed {
  const factory Feed({
    required int id,
    required Member member,
    required String videoUrl,
    required String thumbnailUrl,
    required String title,
    required String createdAt,
    required String updatedAt,
    required int viewCount,
    required List<VoteRate> voteRates,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}