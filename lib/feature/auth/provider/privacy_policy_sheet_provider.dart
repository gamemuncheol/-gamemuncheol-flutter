import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/state/privacy_policy_sheet_state.dart';
import 'package:gamemuncheol/feature/auth/widget/privacy_policy_sheet/privacy_policy_home.dart';

part 'privacy_policy_sheet_provider.g.dart';

@Riverpod()
class PrivacyPolicyNotifier extends _$PrivacyPolicyNotifier {
  @override
  PrivacyPolicySheetState build() => PrivacyPolicySheetStateInitial(
        singleAcceptCount: 0,
      );

  void showPrivatePolicyDocs(
    BuildContext context,
  ) =>
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => PrivacyPolicyHome(),
      );

  void acceptAll() {
    state = PrivacyPolicySheetStateAllAccepted(
      singleAcceptCount: 4,
    );
  }

  void rejectALl() {
    state = PrivacyPolicySheetStateAllRejected(
      singleAcceptCount: 0,
    );
  }

  bool accept({
    bool? isUnnecessaryTerm,
  }) {
    if (isUnnecessaryTerm == null &&
        state is PrivacyPolicySheetStateWithUnnecessary) {
      state = PrivacyPolicySheetStateWithUnnecessary(
        singleAcceptCount: state.singleAcceptCount + 1,
      );
    } else {
      if (isUnnecessaryTerm == null) {
        state = PrivacyPolicySheetStateNecessary(
          singleAcceptCount: state.singleAcceptCount + 1,
        );
      } else {
        state = PrivacyPolicySheetStateWithUnnecessary(
          singleAcceptCount: state.singleAcceptCount + 1,
        );
      }
    }

    return true;
  }

  bool reject({
    bool? isUnnecessaryTerm,
  }) {
    if (isUnnecessaryTerm == null &&
        state is PrivacyPolicySheetStateWithUnnecessary) {
      state = PrivacyPolicySheetStateWithUnnecessary(
        singleAcceptCount: state.singleAcceptCount - 1,
      );
    } else {
      state = PrivacyPolicySheetStateNecessary(
        singleAcceptCount: state.singleAcceptCount - 1,
      );
    }

    return false;
  }

  void goNextPage(
    BuildContext context, {
    required PageController pageController,
  }) {
    final double currentPage = pageController.page!;

    void move() => pageController.nextPage(
          duration: const Duration(
            milliseconds: 50,
          ),
          curve: Curves.linear,
        );

    if (currentPage == 0) {
      if (state is PrivacyPolicySheetStateAllAccepted) {
        move();
      } else if (state is PrivacyPolicySheetStateNecessary &&
          state.singleAcceptCount == 3) {
        move();
      } else if (state is PrivacyPolicySheetStateWithUnnecessary &&
          state.singleAcceptCount == 4) {
        move();
      }
    } else {
      final AuthNotifier authNotifier = ref.read(
        authNotifierProvider.notifier,
      );

      final SignInMethod signInMethod = ref
          .read(
            authNotifierProvider,
          )
          .signInMethod;

      if (signInMethod == SignInMethod.APPLE) {
        authNotifier.signInWithApple();
      } else if (signInMethod == SignInMethod.GOOGLE) {
        authNotifier.signInWithGoogleClient(
          context,
        );
      }
    }
  }
}
