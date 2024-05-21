import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/feature/user/provider/user_provider.dart';
import 'package:gamemuncheol/feature/user/view/change_nickname_screen/change_nickname_screen.dart';

mixin PrivacyPolicySummaryScreenEvent {
  Future<void> agree(WidgetRef ref) async {
    final UserNotifier userNotifier = ref.read(userNotifierProvider.notifier);

    await userNotifier.agree().whenComplete(() {
      locator.navKey.context.pushReplacement(ChangeNickNameScreen.PATH);
    });
  }
}
