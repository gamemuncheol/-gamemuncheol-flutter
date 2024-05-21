import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/presentation/view/splash/splash_screen.dart';
import 'package:gamemuncheol/common/service/redirect_injection_service.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy/screen/privacy_policy_home_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/change_thumb_image_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/enter_feed_form_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/enter_youtube_url_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/video_file_preview_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/youtube_url_preview_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/presentation/view/home/home_screen.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth/social_auth_screen.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth/oauth_webview_screen.dart';
import 'package:gamemuncheol/feature/user/view/change_nickname_screen/change_nickname_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/search_match_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/manage_permission_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/select_stakeholder_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/video_upload_screen.dart';

part 'go_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(
  GoRouterRef ref, {
  required GlobalKey<NavigatorState> naveKey,
  required RedirectInjectionService redirectInjectionService,
}) {
  return GoRouter(
    navigatorKey: naveKey,
    initialLocation: SplashScreen.PATH,
    redirect: redirectInjectionService.redirectLogic,
    routes: [
      GoRoute(
        path: SplashScreen.PATH,
        name: SplashScreen.NAME,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: HomeScreen.PATH,
        name: HomeScreen.NAME,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: SocialAuthScreen.PATH,
        name: SocialAuthScreen.NAME,
        builder: (context, state) => SocialAuthScreen(),
      ),
      GoRoute(
        path: OauthWebviewScreen.PATH,
        name: OauthWebviewScreen.NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          final SignInMethod signInMethod = extraData.data["signInMethod"];

          switch (signInMethod) {
            case SignInMethod.apple:
              return OauthWebviewScreen.apple();
            case SignInMethod.google:
              return OauthWebviewScreen.google();
            default:
              return OauthWebviewScreen.google();
          }
        },
      ),
      GoRoute(
        path: PrivacyPolicyHomeScreen.PATH,
        name: PrivacyPolicyHomeScreen.NAME,
        builder: (context, state) => PrivacyPolicyHomeScreen(),
      ),
      GoRoute(
        path: ChangeNickNameScreen.PATH,
        name: ChangeNickNameScreen.NAME,
        builder: (context, state) => ChangeNickNameScreen(),
      ),
      GoRoute(
        path: SearchMatchScreen.PATH,
        name: SearchMatchScreen.NAME,
        builder: (context, state) => VideoUploadScreen(),
      ),
      GoRoute(
        path: SelectStakeHolderScreen.PATH,
        name: SelectStakeHolderScreen.NAME,
        builder: (context, state) => SelectStakeHolderScreen(),
      ),
      GoRoute(
        path: VideoUploadScreen.PATH,
        name: VideoUploadScreen.NAME,
        builder: (context, state) => VideoUploadScreen(),
      ),
      GoRoute(
        path: EnterYoutubeUrlScreen.PATH,
        name: EnterYoutubeUrlScreen.NAME,
        builder: (context, state) => EnterYoutubeUrlScreen(),
      ),
      GoRoute(
        path: YoutubeUrlPreviewScreen.PATH,
        name: YoutubeUrlPreviewScreen.NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          return YoutubeUrlPreviewScreen.fromExtraData(extraData);
        },
      ),
      GoRoute(
        path: ManagePermissionScreen.PATH,
        name: ManagePermissionScreen.NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          return ManagePermissionScreen.fromExtraData(extraData);
        },
      ),
      GoRoute(
        path: EnterFeedFormScreen.PATH,
        name: EnterFeedFormScreen.NAME,
        builder: (context, state) => EnterFeedFormScreen(),
      ),
      GoRoute(
        path: ChangeThumbImageScreen.PATH,
        name: ChangeThumbImageScreen.NAME,
        builder: (context, state) {
          final ExtraData? extraData = state.extra as ExtraData?;
          return ChangeThumbImageScreen.fromExtra(extraData);
        },
      ),
      GoRoute(
        path: VideoFilePreviewScreen.PATH,
        name: VideoFilePreviewScreen.NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          return VideoFilePreviewScreen.fromExtraData(extraData);
        },
      ),
    ],
  );
}
