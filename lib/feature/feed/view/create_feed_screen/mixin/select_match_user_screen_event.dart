import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/upload_video_screen.dart';
import 'package:go_router/go_router.dart';

mixin SelectMatchUserScreenEvent {
  void goNextStep(
    BuildContext context, {
    required List<MatchUser> selectedMatchUsers,
  }) {
    final ExtraData extra = GoRouterState.of(context).extra! as ExtraData;

    context.pushNamed(
      UploadVideoScreen.ROUTE_NAME,
      extra: extra.copyWith("selectedMatchUsers", selectedMatchUsers),
    );
  }

  void fromMyTeam({
    required ValueNotifier<bool> myTeamNotifier,
  }) {
    myTeamNotifier.value = true;
  }

  void fromEnemy({
    required ValueNotifier<bool> myTeamNotifier,
  }) {
    myTeamNotifier.value = false;
  }

  void selectMatchUser({
    required ValueNotifier<List<MatchUser>> matchUsersNotifier,
    required MatchUser selectedMatchUser,
  }) {
    List<MatchUser> updatedList = List.from(matchUsersNotifier.value);

    updatedList.add(selectedMatchUser);

    matchUsersNotifier.value = updatedList;
  }

  void unSelectMatchUser({
    required ValueNotifier<List<MatchUser>> matchUsersNotifier,
    required MatchUser selectedMatchUser,
  }) {
    List<MatchUser> updatedList = List.from(matchUsersNotifier.value);

    updatedList.removeWhere((matchUser) => matchUser == selectedMatchUser);

    matchUsersNotifier.value = updatedList;
  }
}
