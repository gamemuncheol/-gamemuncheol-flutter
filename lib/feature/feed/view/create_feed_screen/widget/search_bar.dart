import 'package:gamemuncheol/feature/feed/hook/debounce_text_controller_hook.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/feature/feed/provider/search_match_history_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';

class CustomSearchBar extends HookConsumerWidget {
  const CustomSearchBar({
    super.key,
  });

  void search(
    WidgetRef ref, {
    required String gameId,
  }) {
    ref.read(searchMatchHistoryNotiferProvider.notifier).search(gameId: gameId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double frameHeight = 40;

    const double iconVerticalPadding = 8;

    final TextEditingController searchController = useDebouncedTextController(
      (query) => search(ref, gameId: query),
    );

    final TextStyle hintStyle = TextStyleBuilder()
        .withColor(AppColor.FONT_GREY_03)
        .withRegular()
        .build();

    return SizedBoxBuilder()
        .withSize(
          height: frameHeight,
        )
        .withChild(
          SearchBar(
            controller: searchController,
            surfaceTintColor: MaterialStateProperty.all(
              AppColor.NATURAL_02,
            ),
            hintText: "검색어(게임ID)를 입력해 주세요.",
            hintStyle: MaterialStateProperty.all(
              hintStyle,
            ),
            leading: PaddingBuilder()
                .withPadding(
                  top: iconVerticalPadding,
                  bottom: iconVerticalPadding,
                )
                .withChild(
                  SvgPicture.asset(
                    AppAsset.SEARCH_ICON_PATH,
                  ),
                ),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(
              AppColor.NATURAL_02,
            ),
          ),
        );
  }
}
