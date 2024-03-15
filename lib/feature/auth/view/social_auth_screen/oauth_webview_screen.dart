// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/mixin/oauth_webview_event.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {}

  @override
  void onClosed() {
    dispose();
  }
}

class OauthWebviewScreen extends ConsumerStatefulWidget {
  final SignInMethod signInMethod;
  final ChromeSafariBrowser chromeSafariBrowser = MyChromeSafariBrowser();

  OauthWebviewScreen({
    super.key,
    required this.signInMethod,
  });

  factory OauthWebviewScreen.google() => OauthWebviewScreen(
        signInMethod: SignInMethod.GOOGLE,
      );

  static const PATH = "/oauth_webview_screen";
  static const ROUTE_NAME = "OauthWebviewScreen";

  @override
  ConsumerState<OauthWebviewScreen> createState() => _OauthWebviewScreenState();
}

class _OauthWebviewScreenState extends ConsumerState<OauthWebviewScreen>
    with OauthWebviewEvent {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      initUniLinks(
        ref,
      );
      startOauth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
