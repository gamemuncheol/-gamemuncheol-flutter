import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';

class SearchMatchHistoryScreenScaffold extends StatelessWidget {
  final Widget header;
  final Widget searchBar;
  final Widget matchHistory;
  const SearchMatchHistoryScreenScaffold({
    super.key,
    required this.header,
    required this.searchBar,
    required this.matchHistory,
  });

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 16;

    return PaddingBuilder()
        .withPadding(
          left: horizontalPadding,
          right: horizontalPadding,
        )
        .withChild(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,
              searchBar,
              Expanded(
                child: matchHistory,
              ),
            ],
          ),
        );
  }
}
