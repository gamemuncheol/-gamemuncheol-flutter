import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/view/OauthWebviewScreen.dart';
import 'package:gamemuncheol/feature/auth/widget/privacy_policy_sheet/privacy_policy_home.dart';

part 'auth_provider.g.dart';

@Riverpod(
  keepAlive: true,
)
class AuthNotifier extends _$AuthNotifier {
  @override
  dynamic build() => null;

  void signInWithApplee(BuildContext context) => context.go(
        "${OauthWebviewScreen.PATH}?platform=apple",
      );

  void signInWithGoogle(BuildContext context) => context.go(
        "${OauthWebviewScreen.PATH}?platform=google",
      );

  void showPrivatePolicyDocs(
    BuildContext context, {
    required void Function() signInFunc,
  }) =>
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => PrivacyPolicyHome(
          signInFunc: signInFunc,
        ),
      );
}
