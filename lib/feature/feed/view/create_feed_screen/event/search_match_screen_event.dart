import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/select_stakeholder_screen.dart';

mixin SearchMatchScreenEvent {
  void search(WidgetRef ref, {required String gameId}) {
    ref.read(matchNotiferProvider.notifier).search(gameId);
  }

  void selectMySelf(WidgetRef ref, {required MatchUser myself}) {
    ref.read(matchNotiferProvider.notifier).selectMySelf(myself);
  }

  void onLeadingTap(BuildContext context) {
    context.pop();
  }

  void onTap(BuildContext context) {
    context.pushNamed(SelectStakeHolderScreen.ROUTE_NAME);
  }
}
