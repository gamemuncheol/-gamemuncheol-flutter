// ignore_for_file: use_build_context_synchronously

import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/screen/privacy_policy_home_screen.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/oauth_webview_screen.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/social_auth_screen.dart';

mixin SocialAuthScreenState on BaseScreenV2State<SocialAuthScreenV2> {
  final controller =
      VideoPlayerController.asset(AppAsset.AUTH_BACKGROUND_VIDEO);

  @override
  void initState() {
    super.initState();
    controller.initialize().then((value) {
      controller.play();
      controller.setLooping(true);
    });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> signIn({required SignInMethod signInMethod}) async {
    final ExtraData extraData = ExtraData({"signInMethod": signInMethod});
    await context
        .push(OauthWebviewScreenV2.PATH, extra: extraData)
        .then((value) {
      if (value != null) {
        context.pushReplacement(PrivacyPolicyHomeScreen.PATH);
      }
    });
  }
}
