import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/search_match_history_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/match_history_card.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/search_bar.dart';

class SearchMatchHistoryScreen extends StatelessWidget {
  const SearchMatchHistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchMatchHistoryScreenScaffold(
      header: renderHeader(),
      searchBar: renderSearchBar(),
      matchHistory: renderMatchHistory(),
    );
  }

  Widget renderHeader() {
    return const Header(
      title: "전적입력을 위해 게임ID\n를 입력해주세요",
      description: "롤문철이 명확하게 판단해드려요",
    );
  }

  Widget renderSearchBar() {
    return const CustomSearchBar();
  }

  Widget renderMatchHistory() {
    return const MatchHistoryCard();
  }
}
