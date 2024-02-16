import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/state/privacy_policy_sheet_state.dart';

part 'privacy_policy_sheet_provider.g.dart';

@Riverpod()
class PrivacyPolicyNotifier extends _$PrivacyPolicyNotifier {
  @override
  PrivacyPolicySheetState build() => PrivacyPolicySheetStateInitial(
        singleAcceptCount: 0,
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

  void goNextPage({
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
    }
  }
}
