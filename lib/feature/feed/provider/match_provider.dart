import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/state/match_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/feed/repository/feed_repository.dart';

part 'match_provider.g.dart';

@riverpod
class MatchNotifer extends _$MatchNotifer {
  @override
  StateMapper<MatchState> build() => StateMapper.init();

  Future<void> search(String gameId) async {
    final FeedRepository feedRepository = ref.read(feedRepositoryProvider);

    state = LoadingState();
    Result<Match> matchHistory = await feedRepository.search(gameId);

    matchHistory.when(
      success: (match) => state = MatchSearched(match: match),
      failure: (error) => state = ErrorState(error),
    );
  }

  void selectMySelf(MatchUser myself) {
    state = MatchSelected(match: state.pState.match, myself: myself);
  }

  void selectStakeHolder(MatchUser stakeHolder) {
    final MatchState pState = state.pState;
    final bool hasList = pState.isStakeHolderSelected;

    final List<MatchUser> stakeHolders = hasList ? pState.stakeHolders : [];
    stakeHolders.add(stakeHolder);

    state = StakeHolderSelected(
      match: pState.match,
      myself: pState.myself,
      stakeHolders: stakeHolders,
    );
  }

  void exceptStakeHolder(MatchUser stakeHolder) {
    final MatchState pState = state.pState;

    final List<MatchUser> stakeHolders = pState.stakeHolders;
    stakeHolders.remove(stakeHolder);

    final bool hasList = pState.stakeHolders.isNotEmpty;

    if (hasList) {
      state = StakeHolderSelected(
        match: pState.match,
        myself: pState.myself,
        stakeHolders: stakeHolders,
      );

      return;
    }

    state = MatchSelected(
      match: pState.match,
      myself: pState.myself,
    );
  }
}
