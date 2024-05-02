import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';

class MatchState {
  final MatchHistory? match;
  final MatchUser? myself;
  final List<MatchUser>? stakeHolders;

  MatchState({
    this.match,
    this.myself,
    this.stakeHolders,
  });

  bool get isMatchSearched => match != null;
  bool get isMatchSelected => isMatchSearched && myself != null;
  bool get isMatchStakeHolderSelected =>
      isMatchSelected && stakeHolders != null && stakeHolders!.isNotEmpty;

  MatchHistory get getMatch => match!;
  MatchUser get getMySelf => myself!;
  List<MatchUser> get getStakeHolders => stakeHolders!;
}

class MatchSearched extends Data<MatchState> {
  MatchSearched({required MatchHistory match})
      : super(MatchState(match: match));
}

class MatchSelected extends Data<MatchState> {
  MatchSelected({
    required MatchHistory match,
    required MatchUser myself,
  }) : super(MatchState(match: match, myself: myself));
}

class MatchStakeHolderSelected extends Data<MatchState> {
  MatchStakeHolderSelected({
    required MatchHistory match,
    required MatchUser myself,
    required List<MatchUser> stakeHolders,
  }) : super(MatchState(
            match: match, myself: myself, stakeHolders: stakeHolders));
}
