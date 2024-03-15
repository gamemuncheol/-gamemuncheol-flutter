import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';

part 'match_history.freezed.dart';
part 'match_history.g.dart';

@freezed
class MatchHistory with _$MatchHistory {
  const factory MatchHistory({
    required String gameId,
    required String gameCreation,
    required int gameDuration,
    required String gameMode,
    required List<MatchUser> matchUsers,
  }) = _MatchHistory;

  factory MatchHistory.fromJson(Map<String, dynamic> json) =>
      _$MatchHistoryFromJson(json);

}
