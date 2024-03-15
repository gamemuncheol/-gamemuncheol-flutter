import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/view/splash_screen.dart';
import 'package:gamemuncheol/common/view/home/home_screen.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/common/router/redirect_injection_param.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/oauth_webview_screen.dart';
import 'package:gamemuncheol/feature/user/view/rigister_nickname_screen/register_nickname_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen.dart';

part 'go_router.g.dart';

@Riverpod(
  keepAlive: true,
)
GoRouter goRouter(
  GoRouterRef ref, {
  required RedirectInjectionParam redirectInjectionParam,
}) {
  return GoRouter(
    initialLocation: SplashScreen.PATH,
    redirect: redirectInjectionParam.redirectLogic,
    refreshListenable: redirectInjectionParam.redirectState,
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
          final Object extra = state.extra!;

          if (extra == SignInMethod.GOOGLE) {
            return OauthWebviewScreen.google();
          }

          return OauthWebviewScreen.google();
        },
      ),
      GoRoute(
        path: RegisterNickNameScreen.PATH,
        name: RegisterNickNameScreen.ROUTE_NAME,
        builder: (context, state) => const RegisterNickNameScreen(),
      ),
      GoRoute(
        path: HomeScreen.PATH,
        name: HomeScreen.ROUTE_NAME,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: CreateFeedScreenHome.PATH,
            name: CreateFeedScreenHome.ROUTE_NAME,
            builder: (context, state) => const CreateFeedScreenHome(),
          )
        ],
      ),
    ],
  );
}
