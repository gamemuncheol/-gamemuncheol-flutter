import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/user/provider/user_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin PrivacyPolicySummaryScreenEvent {
  Future<void> agree(
    WidgetRef ref, {
    required VoidCallback goChangeNicknameScreen,
  }) async {
    await ref
        .read(userNotifierProvider.notifier)
        .agree()
        .whenComplete(goChangeNicknameScreen);
  }
}
