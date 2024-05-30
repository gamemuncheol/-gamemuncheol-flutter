import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/feature/auth/presentation/state/privacy_policy_state.dart';
import 'package:gamemuncheol/feature/auth/presentation/provider/privacy_policy_provider.dart';


mixin PrivacyPolicyAcceptScreenEvent {
  int calPassCount({required Map<String, bool> terms}) {
    int necessaryAcceptCount = 0;
    terms.forEach((key, value) {
      if (value) {
        necessaryAcceptCount++;
      }
    });

    return necessaryAcceptCount;
  }

  void nextPage(
    WidgetRef ref, {
    required int passCount,
    required PageController pageController,
  }) async {
    final state = ref.read(privacyPolicyNotifierProvider);

    // 현재 동의한 필수 항목 수
    final int totalCount = state.totalCount;

    // 현재 동의한 선택 항목 수
    final int unnecessaryAcceptCount = state.unnecessaryAcceptCount;

    void nextPage() {
      const duration = Duration(milliseconds: 200);
      pageController.nextPage(duration: duration, curve: Curves.linear);
    }

    switch (state.status) {
      case PrivacyPolicyStatus.allAccepted:
        nextPage();

      case PrivacyPolicyStatus.necessaryOnly:
        if (totalCount == passCount) {
          nextPage();
        }

      case PrivacyPolicyStatus.withUnnecessary:
        if (totalCount - unnecessaryAcceptCount == passCount) {
          nextPage();
        }

      default:
        break;
    }
  }

  void listenGlobalEvent(
    WidgetRef ref, {
    required ValueNotifier<bool> isAccepted,
  }) {
    ref.listen(privacyPolicyNotifierProvider, (previous, next) {
      if (next.status == PrivacyPolicyStatus.allAccepted) {
        isAccepted.value = true;
      } else if (next.status == PrivacyPolicyStatus.allRejected) {
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
    required bool isUnNeccesary,
    required ValueNotifier<bool> isAccepted,
  }) {
    isAccepted.value = ref
        .read(privacyPolicyNotifierProvider.notifier)
        .accept(isUnNeccesary: isUnNeccesary);
  }

  void reject(
    WidgetRef ref, {
    required bool isUnNeccesary,
    required ValueNotifier<bool> isAccepted,
  }) {
    isAccepted.value = ref
        .read(privacyPolicyNotifierProvider.notifier)
        .reject(isUnnecessaryTerm: isUnNeccesary);
  }
}
