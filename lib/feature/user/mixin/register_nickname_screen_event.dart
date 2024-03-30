import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/feature/user/provider/change_nickname_provider.dart';

mixin ChangeNicknameScreenEvent {
  Future<void> changeNickname(
    WidgetRef ref, {
    required String nickname,
  }) async {
    await ref
        .read(changeNicknamNotifierProvider.notifier)
        .changeNickname(nickname);
  }
}
