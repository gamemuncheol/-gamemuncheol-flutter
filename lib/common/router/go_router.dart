import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/view/home_screen.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/common/router/redirect_injection_param.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen.dart';
import 'package:gamemuncheol/feature/auth/view/oauth_webview_screen.dart';
import 'package:gamemuncheol/feature/user/view/register_nickname_screen.dart';

part 'go_router.g.dart';

@Riverpod(
  keepAlive: true,
)
GoRouter goRouter(
  GoRouterRef ref, {
  required RedirectInjectionParam redirectInjectionParam,
}) {
  return GoRouter(
    initialLocation: SocialAuthScreen.PATH,
    redirect: (context, goRouterState) => redirectInjectionParam.redirectLogic(
      context,
      goRouterState,
    ),
    refreshListenable: redirectInjectionParam.redirectState,
    routes: [
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
      ),
    ],
  );
}
