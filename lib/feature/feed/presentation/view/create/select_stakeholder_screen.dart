// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_app_bar.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/team_selection_tab.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/stake_holders.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/select_match_user_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/select_stakeholder_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_header.dart';

class SelectStakeHolderScreen extends BaseScreen
    with SelectStakeHolderScreenEvent {
  SelectStakeHolderScreen({super.key});

  static const PATH = "/search_stake_holder_screen";
  static const NAME = "SelectStakeHolderScreen";

  @override
  PreferredSizeWidget? buildAppBar(ref) {
    return CreateFeedScreenAppBar.step2(onLeadingTap: onLeadingTap).toAppBar();
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> inMyTeam = useState(true);

    return SelectMatchUserScreenLayout(
      bottomButton: buildNextButton(onTap: onNextButtonTap),
      header: buildHeader(),
      tab: buildTab(
        inMyTeam: inMyTeam.value,
        selectInTeam: () {
          selectInTeam(inMyTeam: inMyTeam);
        },
        selectInEnemy: () {
          selectInEnemy(inMyTeam: inMyTeam);
        },
      ),
      stakeHolders: buildStakeHolders(
        inMyTeam: inMyTeam.value,
        exceptStakeHolder: exceptStakeHolder,
        selectStakeHolder: selectStakeHolder,
      ),
    );
  }

  Widget buildNextButton({required VoidCallback onTap}) {
    return Consumer(
      builder: (context, ref, child) {
        final StateMapper<MatchState> state = ref.watch(matchNotiferProvider);
        final bool able = state.pState.isStakeHolderSelected;

        return able
            ? CreateFeedScreenNextButton(onTap: onTap)
            : CreateFeedScreenNextButton.disAble();
      },
    );
  }

  Widget buildHeader() {
    const String title = "게임 상대를 선택해 주세\n요.";

    return const CreateFeedScreenHeader(title: title);
  }

  Widget buildTab({
    required bool inMyTeam,
    required VoidCallback selectInTeam,
    required VoidCallback selectInEnemy,
  }) {
    const String teamLabel = "아군";
    const String enemyLabel = "적군";

    return Row(
      children: [
        TeamSelectionTab(
          onTap: selectInTeam,
          selected: inMyTeam,
          label: teamLabel,
        ),
        TeamSelectionTab(
          onTap: selectInEnemy,
          selected: !inMyTeam,
          label: enemyLabel,
        ),
      ],
    );
  }

  Widget buildStakeHolders({
    required bool inMyTeam,
    required void Function(
      WidgetRef ref, {
      required MatchUser stakeHolder,
    }) exceptStakeHolder,
    required void Function(
      WidgetRef ref, {
      required MatchUser stakeHolder,
    }) selectStakeHolder,
  }) {
    return StakeHolders(
      inMyTeam: inMyTeam,
      exceptStakeHolder: exceptStakeHolder,
      selectStakeHolder: selectStakeHolder,
    );
  }
}
