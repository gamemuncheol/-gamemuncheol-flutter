import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_repository.dart';

part 'search_match_history_provider.g.dart';

@riverpod
class SearchMatchHistory extends _$SearchMatchHistory {
  @override
  Future<MatchHistory?> build() => Future.value(null);

  Future<void> search({required String gameId}) async {
    state = const AsyncLoading();

    Result<MatchHistory> matchHistory =
        await ref.read(feedRepositoryProvider).search(gameId: gameId);

    matchHistory.when(
      success: (matchHistory) {
        state = AsyncValue.data(matchHistory);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }
}

@riverpod
class SearchMatchHistoryNotifer extends _$SearchMatchHistoryNotifer {
  @override
  Ds<MatchHistory> build() => Ds<MatchHistory>(state: DataState.initial);

  Future<void> search({required String gameId}) async {
    state = Loading(null);

    Result<MatchHistory> matchHistory =
        await ref.read(feedRepositoryProvider).search(gameId: gameId);

    matchHistory.when(
      success: (matchHistory) {
        state = Loaded(matchHistory);
      },
      failure: (error) {
        state = Error(error);
      },
    );
  }
}
