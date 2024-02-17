// ignore_for_file: constant_identifier_names, empty_catches

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/user/view/register_nickname_screen.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}

class OauthWebviewScreen extends StatefulWidget {
  final SignInMethod signInMethod;

  const OauthWebviewScreen({
    super.key,
    required this.signInMethod,
  });

  factory OauthWebviewScreen.apple() => const OauthWebviewScreen(
        signInMethod: SignInMethod.APPLE,
      );

  factory OauthWebviewScreen.google() => const OauthWebviewScreen(
        signInMethod: SignInMethod.GOOGLE,
      );

  static const PATH = "/oauth_webview_screen/:platform";
  static const ROUTE_NAME = "OauthWebviewScreen";

  @override
  State<OauthWebviewScreen> createState() => _OauthWebviewScreenState();
}

class _OauthWebviewScreenState extends State<OauthWebviewScreen> {
  final ChromeSafariBrowser chromeSafariBrowser = MyChromeSafariBrowser();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      initUniLinks();
      startOauth();
    });
  }

  void initUniLinks() {
    linkStream.listen((link) {
      if (link != null) {
        final Uri uri = Uri.parse(
          link,
        );

        final String? callbackData = uri.queryParameters["data"];

        print(callbackData);

        chromeSafariBrowser.close();

        context.go(
          RegisterNickNameScreen.PATH,
        );
      }
    });
  }

  void startOauth() {
    chromeSafariBrowser.open(
      url: WebUri(
        "https://gamemuncheol-was.firebaseapp.com",
      ),
    );
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
