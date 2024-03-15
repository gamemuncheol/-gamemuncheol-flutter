import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/provider/privacy_policy_sheet_provider.dart';
import 'package:gamemuncheol/feature/auth/state/privacy_policy_sheet_state.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/oauth_webview_screen.dart';
import 'package:go_router/go_router.dart';

mixin NextButtonEvent {
  void move({
    required PageController pageController,
  }) {
    const int speed = 50;

    pageController.nextPage(
      duration: const Duration(
        milliseconds: speed,
      ),
      curve: Curves.linear,
    );
  }

  void goNextPage(
    BuildContext context,
    WidgetRef ref, {
    required PageController pageController,
    required int necessaryAcceptCount,
    required SignInMethod signInMethod,
  }) {
    final double currentPage = pageController.page!;

    final PrivacyPolicySheetState state = ref.read(
      privacyPolicyNotifierProvider,
    );

    if (currentPage == 0) {
      switch (state) {
        case PrivacyPolicySheetStateAllAccepted():
          move(
            pageController: pageController,
          );

        case PrivacyPolicySheetStateNecessary():
          state.singleAcceptCount == necessaryAcceptCount
              ? move(
                  pageController: pageController,
                )
              : ();
        case PrivacyPolicySheetStateWithUnnecessary():
          state.singleAcceptCount - state.unnecessaryAcceptCount ==
                  necessaryAcceptCount
              ? move(
                  pageController: pageController,
                )
              : ();

        default:
          break;
      }
    } else {
      signIn(
        context,
        ref,
        signInMethod: signInMethod,
      );
    }
  }

  void signIn(
    BuildContext context,
    WidgetRef ref, {
    required SignInMethod signInMethod,
  }) {
    final AuthNotifier authNotifier = ref.read(
      authNotifierProvider.notifier,
    );

    if (signInMethod == SignInMethod.APPLE) {
      authNotifier.signInWithApple();
    } else if (signInMethod == SignInMethod.GOOGLE) {
      context.go(
        OauthWebviewScreen.PATH,
        extra: SignInMethod.GOOGLE,
      );
    }
  }
}
