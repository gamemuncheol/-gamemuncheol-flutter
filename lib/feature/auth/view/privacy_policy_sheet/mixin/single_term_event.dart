import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/feature/auth/provider/privacy_policy_sheet_provider.dart';
import 'package:gamemuncheol/feature/auth/state/privacy_policy_sheet_state.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/widget/single_term.dart';

mixin SigleTermEvent on State<SingleTerm> {
  bool get isAccepted => _isAccepted;
  late bool _isAccepted;

  set isAccepted(bool value) {
    _isAccepted = value;
  }

  void stateListener(WidgetRef ref) {
    ref.listen(privacyPolicyNotifierProvider, (previous, next) {
      if (next is PrivacyPolicySheetStateAllAccepted) {
        setState(() {
          isAccepted = true;
        });
      }

      if (next is PrivacyPolicySheetStateAllRejected) {
        setState(() {
          isAccepted = false;
        });
      }
    });
  }

  void acceptALl(WidgetRef ref) => ref
      .read(
        privacyPolicyNotifierProvider.notifier,
      )
      .acceptAll();

  void rejectALl(WidgetRef ref) => ref
      .read(
        privacyPolicyNotifierProvider.notifier,
      )
      .rejectALl();

  void accept(WidgetRef ref) => setState(() {
        isAccepted = ref
            .read(
              privacyPolicyNotifierProvider.notifier,
            )
            .accept(
              isUnnecessaryTerm: widget.isUnnecessaryTerm,
            );
      });

  void reject(WidgetRef ref) => setState(() {
        isAccepted = ref
            .read(
              privacyPolicyNotifierProvider.notifier,
            )
            .reject(
              isUnnecessaryTerm: widget.isUnnecessaryTerm,
            );
      });
}
