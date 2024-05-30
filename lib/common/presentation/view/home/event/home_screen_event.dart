import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/util/role_method.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/feature/auth/presentation/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/social_auth_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/search_match_screen.dart';

mixin HomeScreenEvent {
  void onSearchIconTap() {
    locator.navKey.context.push(SearchMatchScreen.PATH);
  }

  void onNotiIconTap(WidgetRef ref) {
    ref.read(
      excecuteWhenProvider(
        guest: () {
          locator.navKey.context.push(SocialAuthScreenV2.PATH);
        },
        user: () async {
          await ref.read(authNotifierProvider.notifier).signOut();
        },
      ),
    );
  }
}
