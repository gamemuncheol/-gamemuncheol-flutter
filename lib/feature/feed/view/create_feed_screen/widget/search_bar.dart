import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/feature/feed/hook/debounce_text_controller_hook.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/search_match_screen_event.dart';

class FeedSearchBar extends HookConsumerWidget with SearchMatchScreenEvent {
  const FeedSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double frameHeight = 40;
    const double iconVerticalPadding = 8;

    final TextStyle hintStyle = context.textStyleTheme.body4R
        .copyWith(color: context.colorTheme.natural06);

    final TextEditingController searchController =
        useDebouncedTextController((query) => search(ref, gameId: query));

    return SizedBoxBuilder()
        .setHeigh(
          frameHeight,
        )
        .withChild(
          SearchBar(
            controller: searchController,
            surfaceTintColor:
                MaterialStateProperty.all(context.colorTheme.natural02),
            hintText: "검색어(게임ID)를 입력해 주세요.",
            hintStyle: MaterialStateProperty.all(hintStyle),
            leading: PaddingBuilder()
                .setPadding(vertical: iconVerticalPadding)
                .setChild(SvgPicture.asset(AppAsset.SEARCH_ICON_PATH)),
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                MaterialStateProperty.all(context.colorTheme.natural02),
          ),
        );
  }
}
