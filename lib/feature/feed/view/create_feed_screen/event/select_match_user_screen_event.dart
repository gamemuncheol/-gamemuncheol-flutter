import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/video_upload_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin SelectStakeHolderScreenEvent {
  void onLeadingTap(BuildContext context) {
    context.pop();
  }

  void onTap(BuildContext context) {
    context.pushNamed(VideoUploadScreen.ROUTE_NAME);
  }

  void selectInTeam({required ValueNotifier<bool> inMyTeam}) {
    inMyTeam.value = true;
  }

  void selectInEnemy({required ValueNotifier<bool> inMyTeam}) {
    inMyTeam.value = false;
  }

  void selectStakeHolder(WidgetRef ref, {required MatchUser stakeHolder}) {
    ref.read(matchNotiferProvider.notifier).selectStakeHolder(stakeHolder);
  }

  void exceptStakeHolder(WidgetRef ref, {required MatchUser stakeHolder}) {
    ref.read(matchNotiferProvider.notifier).exceptStakeHolder(stakeHolder);
  }
}
