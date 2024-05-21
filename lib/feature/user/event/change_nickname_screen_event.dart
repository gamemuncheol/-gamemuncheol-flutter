import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/feature/user/provider/change_nickname_provider.dart';

mixin ChangeNicknameScreenEvent {
  void onLeadingTap() {
    locator.navKey.context.pop();
  }

  Future<void> changeNickName(WidgetRef ref, {required String nickname}) async {
    await ref
        .read(changeNickNameNotifierProvider.notifier)
        .changeNickName(nickname)
        .whenComplete(() {
      locator.navKey.context.pop();
    });
  }
}
