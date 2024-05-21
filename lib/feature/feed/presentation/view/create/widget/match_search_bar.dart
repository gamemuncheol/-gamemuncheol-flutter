import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gamemuncheol/feature/feed/presentation/hook/debounce_text_controller_hook.dart';

class MatchSearchBar extends HookConsumerWidget with ThemeServiceProvider {
  final Function(WidgetRef ref, {required String gameId}) search;
  const MatchSearchBar({super.key, required this.search});

  final String hintText = "검색어(게임ID)를 입력해 주세요.";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double frameHeight = 40.h;
    final double leadingVerticalPadding = 8.h;

    final hintStyle =
        textStyleTheme.body4R.copyWith(color: colorTheme.natural06);

    final searchController =
        useDebouncedTextController((query) => search(ref, gameId: query));

    return SizedBox(
      height: frameHeight,
      child: SearchBar(
        controller: searchController,
        surfaceTintColor: MaterialStateProperty.all(colorTheme.natural02),
        hintText: hintText,
        hintStyle: MaterialStateProperty.all(hintStyle),
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical: leadingVerticalPadding),
          child: SvgPicture.asset(AppAsset.SEARCH_ICON_PATH),
        ),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(colorTheme.natural02),
      ),
    );
  }
}
