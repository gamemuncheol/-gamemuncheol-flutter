import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_home_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/oauth_webview_screen.dart';

mixin SocialAuthScreenEvent {
  Future<void> signInWhen(
    BuildContext context,
    WidgetRef ref, {
    required SignInMethod signInMethod,
  }) async {
    bool? success;

    switch (signInMethod) {
      case SignInMethod.apple:
        success =
            await ref.read(authNotifierProvider.notifier).signInWithApple();

      case SignInMethod.google:
        final ExtraData extraData = ExtraData({"signInMethod": signInMethod});
        success = await context.push(OauthWebviewScreen.PATH, extra: extraData);

      default:
        success = false;
    }

    if (success != null && success && context.mounted) {
      context.pushReplacement(PrivacyPolicyHomeScreen.PATH);
    }
  }
}
