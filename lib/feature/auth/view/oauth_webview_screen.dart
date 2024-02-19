// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_links/uni_links.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {}

  @override
  void onClosed() {}
}

class OauthWebviewScreen extends ConsumerStatefulWidget {
  final SignInMethod signInMethod;

  const OauthWebviewScreen({
    super.key,
    required this.signInMethod,
  });

  factory OauthWebviewScreen.google() => const OauthWebviewScreen(
        signInMethod: SignInMethod.GOOGLE,
      );

  static const PATH = "/oauth_webview_screen";
  static const ROUTE_NAME = "OauthWebviewScreen";

  @override
  ConsumerState<OauthWebviewScreen> createState() => _OauthWebviewScreenState();
}

class _OauthWebviewScreenState extends ConsumerState<OauthWebviewScreen> {
  final ChromeSafariBrowser chromeSafariBrowser = MyChromeSafariBrowser();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      initUniLinks();
      startOauth();
    });
  }

  Future<void> signInWithGoogle({
    required String token,
  }) async {
    await ref
        .read(
          authNotifierProvider.notifier,
        )
        .signInWithGoogle(
          token: token,
        );
  }

  void initUniLinks() async {
    linkStream.listen((link) async {
      if (link != null) {
        final Uri uri = Uri.parse(
          link,
        );

        final String? token = uri.queryParameters["data"];

        if (token != null) {
          if (widget.signInMethod == SignInMethod.GOOGLE) {
            await signInWithGoogle(
              token: token,
            );
          }
        }

        chromeSafariBrowser.close();
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
