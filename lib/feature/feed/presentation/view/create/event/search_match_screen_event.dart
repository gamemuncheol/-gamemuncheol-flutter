import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/select_stakeholder_screen.dart';

mixin SearchMatchScreenEvent {
  void onLeadingTap() {
    locator.navKey.context.pop();
  }

  void onNextButtonTap() {
    locator.navKey.context.pushNamed(SelectStakeHolderScreen.NAME);
  }

  void search(WidgetRef ref, {required String gameId}) {
    ref.read(matchNotiferProvider.notifier).search(gameId);
  }

  void selectMySelf(WidgetRef ref, {required MatchUser myself}) {
    ref.read(matchNotiferProvider.notifier).selectMySelf(myself);
  }
}
