// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gap/gap.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/search_match_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/search_match_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/match_search_result.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_header.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_app_bar.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/match_search_bar.dart';

// 6862565824
class SearchMatchScreen extends BaseScreen with SearchMatchScreenEvent {
  SearchMatchScreen({super.key});

  static const PATH = "/search_match_screen";
  static const NAME = "SearchMatchScreen";

  @override
  PreferredSizeWidget? buildAppBar(ref) {
    return CreateFeedScreenAppBar.step1(onLeadingTap: onLeadingTap).toAppBar();
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    return SearchMatchScreenLayout(
      bottomButton: buildNextButton(
        onTap: onNextButtonTap,
      ),
      header: buildHeader(),
      searchBar: buildSearchBar(search: search),
      searchResult: buildSearchResult(selectMySelf: selectMySelf),
    );
  }

  Widget buildNextButton({required VoidCallback onTap}) {
    return Consumer(
      builder: (context, ref, child) {
        final StateMapper<MatchState> state = ref.watch(matchNotiferProvider);
        final bool able = state.isPState && state.pState.isMatchSelected;

        return able
            ? CreateFeedScreenNextButton(onTap: onTap)
            : CreateFeedScreenNextButton.disAble();
      },
    );
  }

  Widget buildHeader() {
    const String title = "전적입력을 위해 게임ID\n를 입력해주세요.";
    const String description = "롤문철이 명확하게 판단해드려요.";

    return const CreateFeedScreenHeader(
      title: title,
      description: description,
    );
  }

  Widget buildSearchBar({
    required Function(WidgetRef ref, {required String gameId}) search,
  }) {
    return MatchSearchBar(search: search);
  }

  Widget buildSearchResult({
    required Function(WidgetRef ref, {required MatchUser myself}) selectMySelf,
  }) {
    const title = "검색결과";
    final titleStyle = textStyleTheme.body5R;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Gap(20.h),
        Expanded(
          child: MatchSearchResult(
            selectMySelf: selectMySelf,
          ),
        ),
      ],
    );
  }
}
