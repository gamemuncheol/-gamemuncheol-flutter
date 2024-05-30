import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/select_stakeholder_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/video_upload_screen.dart';

mixin SelectStakeHolderScreenState
    on BaseScreenV2State<SelectStakeHolderScreen> {
  final ValueNotifier<bool> inMyTeam = ValueNotifier(true);

  void onLeadingTap() {
    context.pop();
  }

  void onNextButtonTap() {
    context.pushNamed(VideoUploadScreen.NAME);
  }

  void selectInTeam() {
    inMyTeam.value = true;
  }

  void selectInEnemy() {
    inMyTeam.value = false;
  }

  void selectStakeHolder({required MatchUser stakeHolder}) {
    ref.read(matchNotiferProvider.notifier).selectStakeHolder(stakeHolder);
  }

  void exceptStakeHolder({required MatchUser stakeHolder}) {
    ref.read(matchNotiferProvider.notifier).exceptStakeHolder(stakeHolder);
  }

  @override
  void dispose() {
    inMyTeam.dispose();
    super.dispose();
  }
}
