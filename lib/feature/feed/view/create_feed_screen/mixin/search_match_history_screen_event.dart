import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/select_match_user_screen.dart';

mixin SearchMatchHistoryScreenEvent {
  void goNextStep(
    BuildContext context, {
    required MatchHistory matchHistory,
    required MatchUser mySelf,
  }) {
    final ExtraData extraData = ExtraData({
      "matchHistory": matchHistory,
      "mySelf": mySelf,
    });

    context.pushNamed(
      SelectMatchUserScreen.ROUTE_NAME,
      extra: extraData,
    );
  }

  void selectMySelf({
    required ValueNotifier<MatchUser?> mySelf,
    required MatchUser matchUser,
  }) {
    mySelf.value = matchUser;
  }
}
