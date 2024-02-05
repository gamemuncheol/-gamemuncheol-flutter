import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/view/social_auth_screen.dart';

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
    ],
  );
}
