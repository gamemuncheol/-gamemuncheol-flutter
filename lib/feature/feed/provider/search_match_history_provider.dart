import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/util/data_state.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_repository.dart';

part 'search_match_history_provider.g.dart';

@riverpod
class SearchMatchHistoryNotifer extends _$SearchMatchHistoryNotifer {
  @override
  Ds<MatchHistory> build() => Ds<MatchHistory>(state: DataState.initial);

  Future<void> search({
    required String gameId,
  }) async {
    state = Loading();

    Result<MatchHistory> matchHistory =
        await ref.read(feedRepositoryProvider).search(gameId: gameId);

    switch (matchHistory) {
      case Success<MatchHistory>():
        state = Loaded(
          matchHistory.data,
        );
        break;

      case Failure():
        state = Error(
          matchHistory.exc,
        );
        break;
    }
  }
}
