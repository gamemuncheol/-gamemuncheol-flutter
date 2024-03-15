import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/router/redirect_state.dart';
import 'package:gamemuncheol/feature/auth/state/auth_state.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/oauth_webview_screen.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen.dart';

part 'redirect_injection_param.g.dart';

@Riverpod(
  keepAlive: true,
)
RedirectInjectionParam redirectInjectionParam(RedirectInjectionParamRef ref) {
  final RedirectInjectionParam redirectInjectionParam =
      RedirectInjectionParam();

  ref.listen(authNotifierProvider, (previous, next) async {
    if (next is AuthStateUnAuthenticated) {
      redirectInjectionParam.redirectState.value =
          RedirectState.UNAUTHENTICATED;
    }
  });

  return redirectInjectionParam;
}

class RedirectInjectionParam extends Equatable {
  late final ValueNotifier<RedirectState> redirectState;

  RedirectInjectionParam() {
    redirectState = ValueNotifier<RedirectState>(
      RedirectState.AUTHENTICATED,
    );
  }

  @override
  List<Object?> get props => [
        redirectState,
      ];

  FutureOr<String?> redirectLogic(
    BuildContext context,
    GoRouterState goRouterState,
  ) async {
    final RedirectState redirectState = this.redirectState.value;
    final String matchedLocation = goRouterState.matchedLocation;

    if (redirectState == RedirectState.UNAUTHENTICATED) {
      if (matchedLocation == OauthWebviewScreen.PATH) {
        return null;
      }

      return SocialAuthScreen.PATH;
    }

    return null;
  }
}
