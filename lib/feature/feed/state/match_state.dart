import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';

mixin MatchState on StateMapper<MatchState> {
  @override
  get pState => this;

  bool get isMatchSearched => this is MatchSearched;
  bool get isMatchSelected => this is MatchSelected;
  bool get isStakeHolderSelected => this is StakeHolderSelected;

  Match get match;
  MatchUser get myself;
  List<MatchUser> get stakeHolders;

  R whenPState<R>({
    R Function(Match match)? matchSearched,
    R Function(Match match, MatchUser myself)? matchSelected,
    R Function(Match match, MatchUser myself, List<MatchUser> stakeHolders)?
        stakeHolderSelected,
    R Function()? orElse,
  }) {
    if (isMatchSearched && matchSearched != null) {
      return matchSearched(match);
    } else if (isMatchSearched && matchSelected != null) {
      return matchSelected(match, myself);
    } else if (isStakeHolderSelected && stakeHolderSelected != null) {
      return stakeHolderSelected(match, myself, stakeHolders);
    } else {
      return orElse!();
    }
  }
}

class MatchSearched extends StateMapper<MatchState> with MatchState {
  @override
  final Match match;

  @override
  MatchUser get myself => throw UnimplementedError();

  @override
  List<MatchUser> get stakeHolders => throw UnimplementedError();

  MatchSearched({required this.match});
}

class MatchSelected extends StateMapper<MatchState> with MatchState {
  @override
  final Match match;

  @override
  final MatchUser myself;

  @override
  List<MatchUser> get stakeHolders => throw UnimplementedError();

  MatchSelected({
    required this.match,
    required this.myself,
  });
}

class StakeHolderSelected extends StateMapper<MatchState> with MatchState {
  @override
  final Match match;

  @override
  final MatchUser myself;

  @override
  final List<MatchUser> stakeHolders;

  StakeHolderSelected({
    required this.match,
    required this.myself,
    required this.stakeHolders,
  });
}
