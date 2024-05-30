import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/config/router/redirect_state.dart';
import 'package:gamemuncheol/feature/auth/presentation/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/presentation/state/auth_state.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/screen/privacy_policy_home_screen.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/social_auth_screen.dart';

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
  final ValueNotifier<RedirectState> redirectState =
      ValueNotifier<RedirectState>(RedirectState.pass);

  RedirectInjectionService();

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
    if (matchedLocation == SocialAuthScreenV2.PATH &&
        redirectState == RedirectState.authenticated) {
      return PrivacyPolicyHomeScreen.PATH;
    }

    return null;
  }
}
