// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/search_match_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/event/search_match_screen_event.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/feature/feed/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_bottom_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/match_search_result.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/step_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/match_search_bar.dart';

// 6862565824
class SearchMatchScreen extends StatelessWidget with SearchMatchScreenEvent {
  const SearchMatchScreen({super.key});

  static const PATH = "/search_match_screen";
  static const ROUTE_NAME = "SearchMatchScreen";

  @override
  Widget build(BuildContext context) {
    return SearchMatchScreenScaffold(
      stepBar: buildStepBar(onLeadingTap: () => onLeadingTap(context)),
      bottomButton: buildBottomButton(onTap: () => onTap(context)),
      header: buildHeader(),
      searchBar: buildSearchBar(search: search),
      searchResult: buildSearchResult(selectMySelf: selectMySelf),
    );
  }

  Widget buildStepBar({required VoidCallback onLeadingTap}) {
    return FeedStepBar.step1(onLeadingTap: onLeadingTap);
  }

  Widget buildBottomButton({required VoidCallback onTap}) {
    return Consumer(
      builder: (context, ref, child) {
        final StateMapper<MatchState> state = ref.watch(matchNotiferProvider);
        final bool able = state.isPState && state.pState.isMatchSelected;

        return able
            ? FeedBottomButton(onTap: onTap)
            : FeedBottomButton.disAble();
      },
    );
  }

  Widget buildHeader() {
    return const FeedScreenHeader(
      title: "전적입력을 위해 게임ID\n를 입력해주세요.",
      description: "롤문철이 명확하게 판단해드려요.",
    );
  }

  Widget buildSearchBar({
    required Function(WidgetRef, {required String gameId}) search,
  }) {
    return MatchSearchBar(search: search);
  }

  Widget buildSearchResult({
    required Function(WidgetRef ref, {required MatchUser myself}) selectMySelf,
  }) {
    return Builder(
      builder: (context) {
        TextStyle textStyle = context.textStyleTheme.body5R;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("검색결과", style: textStyle),
            const Gap(20).setHeight(),
            Expanded(child: MatchSearchResult(selectMySelf: selectMySelf)),
          ],
        );
      },
    );
  }
}
