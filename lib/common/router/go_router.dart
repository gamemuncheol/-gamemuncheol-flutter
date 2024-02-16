import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/view/social_auth_screen.dart';
import 'package:gamemuncheol/feature/auth/view/OauthWebviewScreen.dart';
import 'package:gamemuncheol/feature/user/view/register_nickname_screen.dart';

part 'go_router.g.dart';

@Riverpod(
  keepAlive: true,
)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: SocialAuthScreen.PATH,
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
          return OauthWebviewScreen.google();
        },
      ),
      GoRoute(
        path: RegisterNickNameScreen.PATH,
        name: RegisterNickNameScreen.ROUTE_NAME,
        builder: (context, state) => const RegisterNickNameScreen(),
      ),
    ],
  );
}
