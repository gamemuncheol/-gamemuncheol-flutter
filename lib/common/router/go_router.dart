import 'package:gamemuncheol/common/router/redirect_injection_service.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:gamemuncheol/common/view/splash_screen.dart';
import 'package:gamemuncheol/common/view/home/home_screen.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/oauth_webview_screen.dart';
import 'package:gamemuncheol/feature/user/view/change_nickname_screen/change_nickname_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/search_match_history_screen.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_home_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/request_gallery_and_camera_permission_screen.dart.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/select_match_user_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/upload_video_screen.dart';

part 'go_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(
  GoRouterRef ref, {
  required RedirectInjectionService redirectInjectionService,
}) {
  return GoRouter(
    initialLocation: SplashScreen.PATH,
    redirect: redirectInjectionService.redirectLogic,
    routes: [
      GoRoute(
        path: SplashScreen.PATH,
        name: SplashScreen.ROUTE_NAME,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: SocialAuthScreen.PATH,
        name: SocialAuthScreen.ROUTE_NAME,
        builder: (context, state) => const SocialAuthScreen(),
      ),
      GoRoute(
        path: OauthWebviewScreen.PATH,
        name: OauthWebviewScreen.ROUTE_NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          final SignInMethod signInMethod = extraData.data["signInMethod"];
          switch (signInMethod) {
            case SignInMethod.google:
              return OauthWebviewScreen.google();
            default:
              return OauthWebviewScreen.google();
          }
        },
      ),
      GoRoute(
        path: PrivacyPolicyHomeScreen.PATH,
        name: PrivacyPolicyHomeScreen.ROUTE_NAME,
        builder: (context, state) => PrivacyPolicyHomeScreen(),
      ),
      GoRoute(
        path: ChangeNicknameScreen.PATH,
        name: ChangeNicknameScreen.ROUTE_NAME,
        builder: (context, state) => const ChangeNicknameScreen(),
      ),
      GoRoute(
        path: HomeScreen.PATH,
        name: HomeScreen.ROUTE_NAME,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: SearchMatchHistoryScreen.PATH,
        name: SearchMatchHistoryScreen.ROUTE_NAME,
        builder: (context, state) => SearchMatchHistoryScreen(),
      ),
      GoRoute(
        path: SelectMatchUserScreen.PATH,
        name: SelectMatchUserScreen.ROUTE_NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          return SelectMatchUserScreen.fromExtraData(extraData);
        },
      ),
      GoRoute(
        path: UploadVideoScreen.PATH,
        name: UploadVideoScreen.ROUTE_NAME,
        builder: (context, state) => const UploadVideoScreen(),
      ),
      GoRoute(
        path: RequestGalleryAndCameraPermissionScreen.PATH,
        name: RequestGalleryAndCameraPermissionScreen.ROUTE_NAME,
        builder: (context, state) {
          final ExtraData extraData = state.extra as ExtraData;
          return RequestGalleryAndCameraPermissionScreen.fromExtraData(
            extraData,
          );
        },
      ),
    ],
  );
}
