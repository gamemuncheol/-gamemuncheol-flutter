import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/view/home/mixin/home_screen_event.dart';
import 'package:gamemuncheol/common/util/role_method.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen.dart';

class HomeAppBar extends ConsumerWidget with HomeScreenEvent {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double leadingWidth = 152.w;

    return SliverAppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      snap: true,
      pinned: false,
      floating: true,
      backgroundColor: AppColor.PRIMARY_WITHE,
      leadingWidth: leadingWidth,
      leading: renderLeading(),
      actions: renderAction(
        onSearchIconTap: () => ref.read(excecuteWhenProvider(
          guest: () => context.push(SocialAuthScreen.PATH),
          user: () => pushSearchMatchHistoryScreen(context),
        )),
        onNotiIconTap: () => ref.read(excecuteWhenProvider(
          guest: () => context.push(SocialAuthScreen.PATH),
          user: () async {
            await ref.read(authNotifierProvider.notifier).signOut();
          },
        )),
      ),
    );
  }

  Widget renderLeading() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppAsset.SEARCH_ICON_PATH),
        const Gap(8).setWidth(),
        SvgPicture.asset(AppAsset.APP_BAR_LOGO_TEXT_PATH)
      ],
    );
  }

  List<Widget> renderAction({
    required VoidCallback onSearchIconTap,
    required VoidCallback onNotiIconTap,
  }) {
    return [
      GestureDetector(
        onTap: onSearchIconTap,
        child: SvgPicture.asset(AppAsset.SEARCH_ICON_PATH),
      ),
      const Gap(12).setWidth(),
      GestureDetector(
        onTap: onNotiIconTap,
        child: SvgPicture.asset(AppAsset.NOTIFICATION_NEW_ICON_PATH),
      )
    ];
  }
}
