import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gamemuncheol/common/const/assets.dart';

class HomeAppBar extends ConsumerWidget with ThemeServiceProvider {
  final VoidCallback onSearchIconTap;
  final VoidCallback onNotiIconTap;

  const HomeAppBar({
    super.key,
    required this.onSearchIconTap,
    required this.onNotiIconTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double leadingWidth = 152.w;

    return SliverAppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      snap: true,
      pinned: false,
      floating: true,
      backgroundColor: colorTheme.background,
      leadingWidth: leadingWidth,
      leading: buildLeading(),
      actions: buildActions(
          onSearchIconTap: onSearchIconTap, onNotiIconTap: onNotiIconTap),
    );
  }

  Widget buildLeading() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppAsset.SEARCH_ICON_PATH,
        ),
        Gap(8.w),
        SvgPicture.asset(
          AppAsset.APP_BAR_LOGO_TEXT_PATH,
        )
      ],
    );
  }

  List<Widget> buildActions({
    required VoidCallback onSearchIconTap,
    required VoidCallback onNotiIconTap,
  }) {
    return [
      GestureDetector(
        onTap: onSearchIconTap,
        child: SvgPicture.asset(
          AppAsset.SEARCH_ICON_PATH,
        ),
      ),
      Gap(12.w),
      GestureDetector(
        onTap: onNotiIconTap,
        child: SvgPicture.asset(
          AppAsset.NOTIFICATION_NEW_ICON_PATH,
        ),
      )
    ];
  }
}
