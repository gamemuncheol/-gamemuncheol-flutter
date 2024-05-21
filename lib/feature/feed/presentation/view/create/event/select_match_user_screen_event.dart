import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/video_upload_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin SelectStakeHolderScreenEvent {
  void onLeadingTap() {
    locator.navKey.context.pop();
  }

  void onNextButtonTap() {
    locator.navKey.context.pushNamed(VideoUploadScreen.NAME);
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
