import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/select_match_user_screen.dart';

mixin SearchMatchScreenEvent {
  // 검색
  void search(WidgetRef ref, {required String gameId}) {
    ref.read(matchNotiferProvider.notifier).search(gameId: gameId);
  }

  // 본인 선택
  void selectMySelf(WidgetRef ref, {required MatchUser myself}) {
    ref.read(matchNotiferProvider.notifier).selectMySelf(myself: myself);
  }

  // 전 단계로
  void onLeadingTap(BuildContext context) {
    context.pop();
  }

  // 다음 단계로
  void onTap(BuildContext context) {
    context.pushNamed(SelectStakeHolderScreen.ROUTE_NAME);
  }
}
