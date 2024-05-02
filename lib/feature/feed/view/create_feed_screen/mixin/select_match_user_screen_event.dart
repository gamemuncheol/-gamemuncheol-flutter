import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/upload_video_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin SelectStakeHolderScreenEvent {
  void onLeadingTap(BuildContext context) {
    context.pop();
  }

  void onTap(BuildContext context) {
    context.pushNamed(UploadVideoScreen.ROUTE_NAME);
  }

  void selectTeam({required ValueNotifier<bool> inMyTeam}) {
    inMyTeam.value = true;
  }

  void selectEnemy({required ValueNotifier<bool> inMyTeam}) {
    inMyTeam.value = false;
  }

  void selectStakeHolder(WidgetRef ref, {required MatchUser stakeHolder}) {
    ref
        .read(matchNotiferProvider.notifier)
        .selectStakeHolder(stakeHolder: stakeHolder);
  }

  void exceptStakeHolder(WidgetRef ref, {required MatchUser stakeHolder}) {
    ref
        .read(matchNotiferProvider.notifier)
        .exceptStakeHolder(stakeHolder: stakeHolder);
  }
}
