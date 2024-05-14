// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/common/presentation/view/base_screen.dart';
import 'package:gamemuncheol/common/presentation/widget/loading_indicator.dart';
import 'package:gamemuncheol/feature/auth/model/token_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/oauth_webview_screen_layout.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/hook/use_chrome_safari_browser.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/event/oauth_webview_screen_event.dart';

class OauthWebviewScreen extends BaseScreen with OauthWebviewScreenEvent {
  final SignInMethod signInMethod;

  OauthWebviewScreen({super.key, required this.signInMethod});

  static const path = "/oauth";
  static const name = "OauthWebviewScreen";

  factory OauthWebviewScreen.apple() =>
      OauthWebviewScreen(signInMethod: SignInMethod.apple);

  factory OauthWebviewScreen.google() =>
      OauthWebviewScreen(signInMethod: SignInMethod.google);

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final ValueNotifier<TokenResponse?> token = useValueNotifier(null);
    final chromeSafariBrowser = useChromeSafariBrowser(
      onClosed: () =>
          signInWithOAuth(ref, token: token, signInMethod: signInMethod),
    );

    useEffect(() {
      listenUniLinks(token: token, browser: chromeSafariBrowser);
      startOauth(signInMethod: signInMethod, browser: chromeSafariBrowser);
      return () {};
    }, []);

    return const OAuthWebviewScreenLayout(
      indicator: LoadingIndicator(),
    );
  }
}
