import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/extension/theme_data_short_cut.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/presentation/layout/bottom_button_expanded_layout.dart';

class SearchMatchScreenLayout extends BottomButtonExpandedLayout {
  final Widget bottomButton;

  final Widget header;
  final Widget searchBar;
  final Widget searchResult;

  const SearchMatchScreenLayout({
    super.key,
    required this.bottomButton,
    required this.header,
    required this.searchBar,
    required this.searchResult,
  });

  @override
  Widget buildBottomButton() => bottomButton;

  @override
  Widget buildBottomButtonExpandedLayout(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Container(
        color: context.colorTheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40.h),
            header,
            Gap(40.h),
            searchBar,
            Gap(40.h),
            Expanded(
              child: searchResult,
            ),
          ],
        ),
      ),
    );
  }
}
