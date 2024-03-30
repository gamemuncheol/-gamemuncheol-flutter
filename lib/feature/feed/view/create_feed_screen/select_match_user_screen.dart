// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/select_match_user_screen_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/select_match_user_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/app_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/match_history_card.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/next_button.dart';

class SelectMatchUserScreen extends HookWidget with SelectMatchUserScreenEvent {
  final MatchHistory matchHistory;
  final MatchUser mySelf;

  SelectMatchUserScreen({
    super.key,
    required this.matchHistory,
    required this.mySelf,
  });

  factory SelectMatchUserScreen.fromExtraData(ExtraData extraData) {
    return SelectMatchUserScreen(
      matchHistory: extraData.data["matchHistory"],
      mySelf: extraData.data["mySelf"],
    );
  }

  static const PATH = "/search_match_user_screen";
  static const ROUTE_NAME = "SelectMatchUserScreen";

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<MatchUser>> selectedMatchUsers = useState([]);
    final ValueNotifier<bool> selectFromMyTeam = useState(true);

    return SelectMatchUserScreenScaffold(
      appBar: renderAppBar(),
      nextButton: renderNextButton(
        context,
        selectedMatchUsers: selectedMatchUsers,
      ),
      header: renderHeader(),
      tabBar: renderTabBar(
        selectFromMyTeam: selectFromMyTeam,
      ),
      matchUser: renderMatchUsers(
        selectFromMyTeam: selectFromMyTeam,
        selectedMatchUsers: selectedMatchUsers,
      ),
    );
  }

  Widget renderAppBar() => const CreateFeedScreenAppBar(currentStep: 2);

  Widget renderNextButton(
    BuildContext context, {
    required ValueNotifier<List<MatchUser>> selectedMatchUsers,
  }) {
    final TextStyle textStyle = TextStyleBuilder()
        .withColor(AppColor.PRIMARY_WITHE)
        .withFontSize(20)
        .build();

    const BoxDecoration buttonDecoration = BoxDecoration(
      color: AppColor.PRIMARY_BLUE,
    );

    return CreateFeedScreenNextButton(
      onTap: () => goNextStep(
        context,
        selectedMatchUsers: selectedMatchUsers.value,
      ),
      text: "다음",
      textStyle: textStyle,
      buttonDecoration: buttonDecoration,
    );
  }

  Widget renderHeader() => const CreateFeedScreenHeader(
        title: "게임 상대를 선택해 주세\n요.",
      );

  Widget renderTabBar({
    required ValueNotifier<bool> selectFromMyTeam,
  }) {
    return Row(
      children: [
        buildTab(
          label: "아군",
          selected: selectFromMyTeam.value,
          onTap: () => fromMyTeam(myTeamNotifier: selectFromMyTeam),
        ),
        buildTab(
          label: "적군",
          selected: !selectFromMyTeam.value,
          onTap: () => fromEnemy(myTeamNotifier: selectFromMyTeam),
        ),
      ],
    );
  }

  Widget buildTab({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    const double selectedUnderlineHeight = 3;
    const double unSelectedUnderlineHeight = 1;

    BoxDecoration frameDecoration =
        const BoxDecoration(color: AppColor.PRIMARY_WITHE);

    BoxDecoration selectedUnderlineDecoration =
        const BoxDecoration(color: AppColor.PRIMARY_BLUE);

    BoxDecoration unSelctedunderlineDecoration =
        const BoxDecoration(color: AppColor.NATURAL_03);

    TextStyle selectedTextStyle = TextStyleBuilder()
        .withColor(AppColor.PRIMARY_BLUE)
        .withFontSize(20)
        .withMedium()
        .build();

    TextStyle unSelectedTextStyle =
        selectedTextStyle.copyWith(color: AppColor.NATURAL_05);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: ContainerBuilder()
            .withBoxDecoration(
              frameDecoration,
            )
            .withChild(
              Column(
                children: [
                  Text(
                    label,
                    style: selected ? selectedTextStyle : unSelectedTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(8).withHeight(),
                  ContainerBuilder()
                      .withSize(
                        height: selected
                            ? selectedUnderlineHeight
                            : unSelectedUnderlineHeight,
                      )
                      .withBoxDecoration(
                        selected
                            ? selectedUnderlineDecoration
                            : unSelctedunderlineDecoration,
                      )
                      .build(),
                ],
              ),
            ),
      ),
    );
  }

  Widget renderMatchUsers({
    required ValueNotifier<bool> selectFromMyTeam,
    required ValueNotifier<List<MatchUser>> selectedMatchUsers,
  }) {
    List<MatchUser> myTeam = matchHistory.matchUsers.where((matchUser) {
      return matchUser.win == mySelf.win && matchUser != mySelf;
    }).toList();

    List<MatchUser> enemy = matchHistory.matchUsers.where((matchUser) {
      return matchUser.win != mySelf.win;
    }).toList();

    return Column(
      children: (selectFromMyTeam.value ? myTeam : enemy).map(
        (matchUser) {
          const double verticalPadding = 12;
          final bool selected = selectedMatchUsers.value.contains(matchUser);

          return PaddingBuilder()
              .withPadding(vertical: verticalPadding)
              .withChild(
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => selected
                          ? unSelectMatchUser(
                              matchUsersNotifier: selectedMatchUsers,
                              selectedMatchUser: matchUser,
                            )
                          : selectMatchUser(
                              matchUsersNotifier: selectedMatchUsers,
                              selectedMatchUser: matchUser,
                            ),
                      child: SvgPicture.asset(
                        selected
                            ? AppAsset.CHECKBOX_FILLED_VER_PATH
                            : AppAsset.CHECKBOX_BLANK_VER_PATH,
                      ),
                    ),
                    const Gap(16).withWidth(),
                    Expanded(
                      child: MatchHistoryCard(
                        matchUser: matchUser,
                      ),
                    ),
                  ],
                ),
              );
        },
      ).toList(),
    );
  }
}
