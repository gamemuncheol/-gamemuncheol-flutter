// ignore_for_file: use_build_context_synchronously

import 'package:gamemuncheol/feature/auth/view/privacy_policy/screen/privacy_policy_home_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth/oauth_webview_screen.dart';

mixin SocialAuthScreenEvent {
  Future<void> signInWithOAuth({required SignInMethod signInMethod}) async {
    bool? success;

    final ExtraData extraData = ExtraData({"signInMethod": signInMethod});
    success = await locator.navKey.context
        .push(OauthWebviewScreen.PATH, extra: extraData);

    if (success != null && success && locator.navKey.context.mounted) {
      locator.navKey.context.pushReplacement(PrivacyPolicyHomeScreen.PATH);
    }
  }
}
