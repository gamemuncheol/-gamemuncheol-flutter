import 'package:gamemuncheol/feature/member/presentation/view/change_nickname_screen/change_nickname_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/feature/member/presentation/provider/member_provider.dart';

mixin PrivacyPolicySummaryScreenEvent {
  Future<void> agree(WidgetRef ref) async {
    final memberNotifier = ref.read(memberNotifierProvider.notifier);

    await memberNotifier.agree().whenComplete(() {
      locator.navKey.context.pushReplacement(ChangeNicknameScreen.PATH);
    });
  }
}
