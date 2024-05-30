import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/presentation/view/splash/splash_screen.dart';
import 'package:gamemuncheol/common/service/redirect_injection_service.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/screen/privacy_policy_home_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/change_thumb_image_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/feed_form_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/enter_youtube_url_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/video_file_preview_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/youtube_url_preview_screen.dart';
import 'package:gamemuncheol/feature/member/presentation/view/change_nickname_screen/change_nickname_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/presentation/view/home/home_screen.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/social_auth_screen.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/oauth_webview_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/search_match_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/manage_permission_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/select_stakeholder_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/video_upload_screen.dart';

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
        path: SocialAuthScreenV2.PATH,
        name: SocialAuthScreenV2.NAME,
        builder: (context, state) => const SocialAuthScreenV2(),
      ),
      GoRoute(
        path: OauthWebviewScreenV2.PATH,
        name: OauthWebviewScreenV2.NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          final SignInMethod signInMethod = extraData.data["signInMethod"];

          switch (signInMethod) {
            case SignInMethod.apple:
              return OauthWebviewScreenV2.apple();
            case SignInMethod.google:
              return OauthWebviewScreenV2.google();
            default:
              return OauthWebviewScreenV2.google();
          }
        },
      ),
      GoRoute(
        path: PrivacyPolicyHomeScreen.PATH,
        name: PrivacyPolicyHomeScreen.NAME,
        builder: (context, state) => const PrivacyPolicyHomeScreen(),
      ),
      GoRoute(
        path: ChangeNicknameScreen.PATH,
        name: ChangeNicknameScreen.NAME,
        builder: (context, state) => const ChangeNicknameScreen(),
      ),
      GoRoute(
        path: SearchMatchScreen.PATH,
        name: SearchMatchScreen.NAME,
        builder: (context, state) => const SearchMatchScreen(),
      ),
      GoRoute(
        path: SelectStakeHolderScreen.PATH,
        name: SelectStakeHolderScreen.NAME,
        builder: (context, state) => const SelectStakeHolderScreen(),
      ),
      GoRoute(
        path: VideoUploadScreen.PATH,
        name: VideoUploadScreen.NAME,
        builder: (context, state) => const VideoUploadScreen(),
      ),
      GoRoute(
        path: EnterYoutubeUrlScreen.PATH,
        name: EnterYoutubeUrlScreen.NAME,
        builder: (context, state) => const EnterYoutubeUrlScreen(),
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
        path: FeedFormScreen.PATH,
        name: FeedFormScreen.NAME,
        builder: (context, state) => const FeedFormScreen(),
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
        path: VideoFilePreviewScreenV2.PATH,
        name: VideoFilePreviewScreenV2.NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          return VideoFilePreviewScreenV2.fromExtraData(extraData);
        },
      ),
    ],
  );
}
