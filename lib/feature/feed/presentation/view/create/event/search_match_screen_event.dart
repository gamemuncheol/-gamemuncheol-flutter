import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/search_match_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/select_stakeholder_screen.dart';

mixin SearchMatchScreenState on BaseScreenV2State<SearchMatchScreen> {
  void onLeadingTap() {
    context.pop();
  }

  void onNextButtonTap() {
    context.pushNamed(SelectStakeHolderScreen.NAME);
  }

  void search({required String gameId}) {
    ref.read(matchNotiferProvider.notifier).search(gameId);
  }

  void selectMySelf({required MatchUser myself}) {
    ref.read(matchNotiferProvider.notifier).selectMySelf(myself);
  }
}
