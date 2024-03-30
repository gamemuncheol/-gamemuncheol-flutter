import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/router/redirect_state.dart';
import 'package:gamemuncheol/feature/auth/state/auth_state.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_home_screen.dart';

part 'redirect_injection_service.g.dart';

@Riverpod(keepAlive: true)
RedirectInjectionService redirectInjectionService(
    RedirectInjectionServiceRef ref) {
  final RedirectInjectionService redirectInjectionService =
      RedirectInjectionService();

  ref.listen(authNotifierProvider, (previous, next) {
    switch (next) {
      case Authenticated():
        redirectInjectionService.whenAuthenticated();

      case UnAuthenticated():
        redirectInjectionService.whenUnAuthenticated();
      default:
        break;
    }
  });
  return redirectInjectionService;
}

class RedirectInjectionService extends Equatable {
  late final ValueNotifier<RedirectState> redirectState;

  RedirectInjectionService() {
    redirectState = ValueNotifier<RedirectState>(RedirectState.pass);
  }

  @override
  List<Object?> get props => [redirectState];

  void whenAuthenticated() {
    redirectState.value = RedirectState.authenticated;
  }

  void whenUnAuthenticated() {
    redirectState.value = RedirectState.unAuthenticated;
  }

  String? redirectLogic(BuildContext context, GoRouterState goRouterState) {
    final RedirectState redirectState = this.redirectState.value;
    final String matchedLocation = goRouterState.matchedLocation;

    // 이미 로그인 한 유저는 다시 로그인할 필요가 없음!
    if (matchedLocation == SocialAuthScreen.PATH &&
        redirectState == RedirectState.authenticated) {
      return PrivacyPolicyHomeScreen.PATH;
    }

    return null;
  }
}
