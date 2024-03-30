import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/feature/auth/state/privacy_policy_state.dart';
import 'package:gamemuncheol/feature/auth/provider/privacy_policy_provider.dart';

mixin PrivacyPolicyAcceptScreenEvent {
  int calNeccesary({required Map<String, bool> terms}) {
    int necessaryAcceptCount = 0;
    terms.forEach((key, value) {
      if (value) {
        necessaryAcceptCount++;
      }
    });
    return necessaryAcceptCount;
  }

  void nextWhen(
    WidgetRef ref, {
    required int necessaryAcceptCount,
    required VoidCallback nextPage,
  }) async {
    final PrivacyPolicyState state = ref.read(privacyPolicyNotifierProvider);
    switch (state.state) {
      case PrivacyPolicyStates.allAccepted:
        nextPage();

      case PrivacyPolicyStates.necessary:
        state.singleAcceptCount == necessaryAcceptCount ? nextPage() : ();

      case PrivacyPolicyStates.withUnnecessary:
        state.singleAcceptCount - state.unnecessaryAcceptCount ==
                necessaryAcceptCount
            ? nextPage()
            : ();

      default:
        break;
    }
  }

  void stateListener(
    WidgetRef ref, {
    required ValueNotifier<bool> isAccepted,
  }) {
    ref.listen(privacyPolicyNotifierProvider, (previous, next) {
      if (next.state == PrivacyPolicyStates.allAccepted) {
        isAccepted.value = true;
      } else if (next.state == PrivacyPolicyStates.allRejected) {
        isAccepted.value = false;
      }
    });
  }

  void acceptALl(WidgetRef ref) =>
      ref.read(privacyPolicyNotifierProvider.notifier).acceptAll();

  void rejectALl(WidgetRef ref) =>
      ref.read(privacyPolicyNotifierProvider.notifier).rejectALl();

  void accept(
    WidgetRef ref, {
    required bool isUnnecessaryTerm,
    required ValueNotifier<bool> isAccepted,
  }) {
    isAccepted.value = ref
        .read(privacyPolicyNotifierProvider.notifier)
        .accept(isUnnecessaryTerm: isUnnecessaryTerm);
  }

  void reject(
    WidgetRef ref, {
    required bool isUnnecessaryTerm,
    required ValueNotifier<bool> isAccepted,
  }) {
    isAccepted.value = ref
        .read(privacyPolicyNotifierProvider.notifier)
        .reject(isUnnecessaryTerm: isUnnecessaryTerm);
  }
}
