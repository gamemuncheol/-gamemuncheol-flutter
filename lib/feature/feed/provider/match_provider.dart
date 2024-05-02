import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/state/match_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_repository.dart';

part 'match_provider.g.dart';

@riverpod
class MatchNotifer extends _$MatchNotifer {
  @override
  BaseState<MatchState> build() => Initial();

  Future<void> search({required String gameId}) async {
    final FeedRepository feedRepository = ref.read(feedRepositoryProvider);
    state = Loading();

    Result<MatchHistory> matchHistory = await feedRepository.search(gameId);

    matchHistory.when(
      success: (match) => state = MatchSearched(match: match),
      failure: (error) => state = Error(error),
    );
  }

  void selectMySelf({required MatchUser myself}) {
    state = MatchSelected(match: state.asData.getMatch, myself: myself);
  }

  void selectStakeHolder({required MatchUser stakeHolder}) {
    final List<MatchUser> stakeHolders = state.asData.stakeHolders ?? [];
    stakeHolders.add(stakeHolder);

    state = MatchStakeHolderSelected(
      match: state.asData.getMatch,
      myself: state.asData.getMySelf,
      stakeHolders: stakeHolders,
    );
  }

  void exceptStakeHolder({required MatchUser stakeHolder}) {
    final List<MatchUser> stakeHolders = state.asData.stakeHolders!;
    stakeHolders.remove(stakeHolder);

    if (stakeHolders.isEmpty) {
      state = MatchSelected(
        match: state.asData.getMatch,
        myself: state.asData.getMySelf,
      );
    }

    state = MatchStakeHolderSelected(
      match: state.asData.getMatch,
      myself: state.asData.getMySelf,
      stakeHolders: stakeHolders,
    );
  }
}
