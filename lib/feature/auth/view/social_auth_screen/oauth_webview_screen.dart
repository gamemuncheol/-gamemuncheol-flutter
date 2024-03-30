// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/oauth_webview_screen_scaffold.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/hook/use_chrome_safari_browser.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/mixin/oauth_webview_screen_event.dart';

class OauthWebviewScreen extends HookConsumerWidget
    with OauthWebviewScreenEvent {
  final SignInMethod signInMethod;

  const OauthWebviewScreen({
    super.key,
    required this.signInMethod,
  });

  factory OauthWebviewScreen.google() =>
      const OauthWebviewScreen(signInMethod: SignInMethod.google);

  static const PATH = "/oauth_webview_screen";
  static const ROUTE_NAME = "OauthWebviewScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<String?> token = useValueNotifier(null);
    final ChromeSafariBrowser chromeSafariBrowser = useChromeSafariBrowser(
      onClosedCallBack: () => signInWhenToken(
        context,
        ref,
        token: token,
        signInMethod: signInMethod,
      ).then((success) {
        context.pop(success);
      }),
    );

    useEffect(() {
      listenUniLinks(
        ref,
        token: token,
        chromeSafariBrowser: chromeSafariBrowser,
      );
      startOauth(chromeSafariBrowser: chromeSafariBrowser);
      return () {};
    }, []);

    return const OAuthWebviewScreenScaffold();
  }
}
