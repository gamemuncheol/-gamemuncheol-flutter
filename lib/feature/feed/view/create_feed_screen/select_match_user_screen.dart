// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/feature/feed/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/state/match_state.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/bottom_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/step_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/team_selection_tab.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/stake_holders.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/select_match_user_screen_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/select_match_user_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/header.dart';

class SelectStakeHolderScreen extends HookWidget
    with SelectStakeHolderScreenEvent {
  const SelectStakeHolderScreen({super.key});

  static const PATH = "/search_match_user_screen";
  static const ROUTE_NAME = "SelectMatchUserScreen";

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> inMyTeam = useState(true);

    return SelectMatchUserScreenScaffold(
      stepBar: buildStepBar(onLeadingTap: () => onLeadingTap(context)),
      bottomButton: buildBottomButton(onTap: () => onTap(context)),
      header: buildHeader(),
      tab: buildTab(inMyTeam: inMyTeam),
      stakeHolders: buildStakeHolders(inMyTeam: inMyTeam.value),
    );
  }

  Widget buildStepBar({required VoidCallback onLeadingTap}) {
    return FeedStepBar.step2(onLeadingTap: onLeadingTap);
  }

  Widget buildBottomButton({required VoidCallback onTap}) {
    return Consumer(
      builder: (context, ref, child) {
        final BaseState<MatchState> state = ref.watch(matchNotiferProvider);
        final bool able = state.asData.isMatchStakeHolderSelected;

        if (able) {
          return FeedBottomButton(onTap: onTap);
        }
        return FeedBottomButton.disAble();
      },
    );
  }

  Widget buildHeader() {
    return const CreateFeedScreenHeader(title: "게임 상대를 선택해 주세\n요.");
  }

  Widget buildTab({required ValueNotifier<bool> inMyTeam}) {
    return TeamSelectionTab(inMyTeam: inMyTeam);
  }

  Widget buildStakeHolders({required bool inMyTeam}) {
    return StakeHolders(inMyTeam: inMyTeam);
  }
}
