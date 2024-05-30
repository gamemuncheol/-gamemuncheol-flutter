// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/select_match_user_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/select_stakeholder_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_app_bar.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_header.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/match_stake_holders.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/team_selection_tab.dart';

class SelectStakeHolderScreen extends BaseScreenV2 {
  const SelectStakeHolderScreen({super.key});

  static const PATH = "/$NAME";
  static const NAME = "SELECT_STAKE_HOLDER_SCREEN";

  @override
  BaseScreenV2State<SelectStakeHolderScreen> createState() =>
      _SelectStakeHolderScreenV2State();
}

class _SelectStakeHolderScreenV2State
    extends BaseScreenV2State<SelectStakeHolderScreen>
    with DefaultLayout, SelectStakeHolderScreenState {
  @override
  PreferredSizeWidget? buildAppBar() {
    return CreateFeedScreenAppBar.step2(
      onLeadingTap: onLeadingTap,
    ).toAppBar();
  }

  @override
  Widget buildBody() {
    return SelectMatchUserScreenLayout(
      bottomButton: _buildNextButton(),
      header: _buildHeader(),
      tab: _buildTab(),
      stakeHolders: _buildStakeHolders(),
    );
  }

  Widget _buildNextButton() {
    return Consumer(
      builder: (context, ref, child) {
        final StateMapper<MatchState> state = ref.watch(matchNotiferProvider);
        final bool able = state.pState.isStakeHolderSelected;

        return able
            ? CreateFeedScreenNextButton(onTap: onNextButtonTap)
            : CreateFeedScreenNextButton.disAble();
      },
    );
  }

  Widget _buildHeader() {
    const String title = "게임 상대를 선택해 주세\n요.";

    return const CreateFeedScreenHeader(
      title: title,
    );
  }

  Widget _buildTab() {
    const String teamLabel = "아군";
    const String enemyLabel = "적군";

    return ValueListenableBuilder(
      valueListenable: inMyTeam,
      builder: (context, value, child) {
        return Row(
          children: [
            TeamSelectionTab(
              onTap: selectInTeam,
              selected: inMyTeam.value,
              label: teamLabel,
            ),
            TeamSelectionTab(
              onTap: selectInEnemy,
              selected: !inMyTeam.value,
              label: enemyLabel,
            ),
          ],
        );
      },
    );
  }

  Widget _buildStakeHolders() {
    return ValueListenableBuilder(
      valueListenable: inMyTeam,
      builder: (context, value, child) {
        return MatchStakeHolders(
          inMyTeam: inMyTeam.value,
          exceptStakeHolder: exceptStakeHolder,
          selectStakeHolder: selectStakeHolder,
        );
      },
    );
  }
}
