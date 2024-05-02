// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/search_match_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/search_match_screen_event.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/feature/feed/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/bottom_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/match_search_result.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/step_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/search_bar.dart';

// 6862565824
class SearchMatchScreen extends StatelessWidget with SearchMatchScreenEvent {
  SearchMatchScreen({super.key});

  static const PATH = "/search_match_screen";
  static const ROUTE_NAME = "SearchMatchScreen";

  @override
  Widget build(BuildContext context) {
    return SearchMatchScreenScaffold(
      stepBar: buildStepBar(onLeadingTap: () => onLeadingTap(context)),
      bottomButton: buildBottomButton(onTap: () => onTap(context)),
      header: buildHeader(),
      searchBar: buildSearchBar(),
      match: buildMatch(context),
    );
  }

  Widget buildStepBar({required VoidCallback onLeadingTap}) {
    return FeedStepBar.step1(onLeadingTap: onLeadingTap);
  }

  Widget buildBottomButton({required VoidCallback onTap}) {
    return Consumer(
      builder: (context, ref, child) {
        final BaseState<MatchState> state = ref.watch(matchNotiferProvider);
        final bool able = state.valueOrNull?.isMatchSelected ?? false;

        if (able) {
          return FeedBottomButton(onTap: onTap);
        }
        return FeedBottomButton.disAble();
      },
    );
  }

  Widget buildHeader() {
    return const CreateFeedScreenHeader(
      title: "전적입력을 위해 게임ID\n를 입력해주세요.",
      description: "롤문철이 명확하게 판단해드려요.",
    );
  }

  Widget buildSearchBar() {
    return const FeedSearchBar();
  }

  Widget buildMatch(BuildContext context) {
    TextStyle textStyle = context.textStyleTheme.body5R;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("검색결과", style: textStyle),
        const Gap(20).setHeight(),
        const Expanded(child: MatchSearchResult()),
      ],
    );
  }
}
