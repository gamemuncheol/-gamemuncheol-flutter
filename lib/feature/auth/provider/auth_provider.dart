import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/widget/privacy_policy_docs.dart';

part 'auth_provider.g.dart';

@Riverpod(
  keepAlive: true,
)
class AuthNotifier extends _$AuthNotifier {
  @override
  dynamic build() => null;

  void showPrivatePolicyDocs(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const PrivacyPolicyDocs();
      },
    );
  }
}
