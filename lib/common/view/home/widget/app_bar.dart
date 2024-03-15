import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double leadingWidth = 152;
    const double horizontalPadding = 16;

    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.w,
      ),
      sliver: SliverAppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        snap: true,
        pinned: false,
        floating: true,
        backgroundColor: ColorGuidance.PRIMARY_WITHE,
        leadingWidth: leadingWidth.w,
        leading: renderLeading(),
        actions: renderAction(
          context,
        ),
      ),
    );
  }

  Widget renderLeading() {
    const double space1 = 8;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AssetPaths.SEARCH_ICON_PATH,
        ),
        const Gap(
          space1,
        ).withWidth(),
        SvgPicture.asset(
          AssetPaths.APP_BAR_LOGO_TEXT_PATH,
        )
      ],
    );
  }

  List<Widget> renderAction(BuildContext context) {
    const double space1 = 12;

    return [
      GestureDetector(
        onTap: () {
          context.pushNamed(
            CreateFeedScreenHome.ROUTE_NAME,
          );
        },
        child: SvgPicture.asset(
          AssetPaths.SEARCH_ICON_PATH,
        ),
      ),
      const Gap(
        space1,
      ).withWidth(),
      SvgPicture.asset(
        AssetPaths.NOTIFICATION_NEW_ICON_PATH,
      )
    ];
  }
}
