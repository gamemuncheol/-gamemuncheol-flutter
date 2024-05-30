import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/service/feed_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'match_provider.g.dart';

@riverpod
class MatchNotifer extends _$MatchNotifer {
  @override
  StateMapper<MatchState> build() => StateMapper.init();

  Future<void> search(String gameId) async {
    state = LoadingState();
    final feedService = ref.read(feedServiceProvider);

    Result<Match> matchHistory = await feedService.search(gameId);

    matchHistory.when(
      success: (match) => state = MatchSearched(match: match),
      failure: (error) => state = ErrorState(error),
    );
  }

  void selectMySelf(MatchUser myself) {
    state = MatchSelected(
      match: state.pState.match,
      myself: myself,
    );
  }

  void selectStakeHolder(MatchUser stakeHolder) {
    state = StakeHolderSelected(
      match: state.pState.match,
      myself: state.pState.myself,
      stakeHolder: stakeHolder,
    );
  }

  void exceptStakeHolder(MatchUser stakeHolder) {
    state = MatchSelected(
      match: state.pState.match,
      myself: state.pState.myself,
    );
  }
}
