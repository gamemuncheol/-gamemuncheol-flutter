import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/feature/auth/model/token_response.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';

mixin OauthWebviewScreenEvent {
  TokenResponse? _getToken({required String link}) {
    final Uri uri = Uri.parse(link);
    late final TokenResponse? tokenResponse;

    final acTokenKey = AppData.OAUTH_REDIRECT_QUERY_PARAM_ACCESSTOKEN_KEY;
    final refTokenKey = AppData.OAUTH_REDIRECT_QUERY_PARAM_REFRESHTOKEN_KEY;

    if (uri.queryParameters.isNotEmpty) {
      final Map<String, String> params = uri.queryParameters;
      tokenResponse = TokenResponse(
          accessToken: params[acTokenKey]!, refreshToken: params[refTokenKey]!);
    }

    return tokenResponse;
  }

  void startOauth({
    required SignInMethod signInMethod,
    required ChromeSafariBrowser browser,
  }) {
    browser.open(
      url: WebUri("${AppData.OAUTH_WAS_URL}?signInMethod=${signInMethod.name}"),
    );
  }

  void listenUniLinks({
    required ValueNotifier<TokenResponse?> token,
    required ChromeSafariBrowser browser,
  }) {
    linkStream.listen((link) async {
      if (link != null) {
        token.value = _getToken(link: link);
        await browser.close();
      }
    });
  }

  Future<void> signInWithOAuth(
    WidgetRef ref, {
    required SignInMethod signInMethod,
    required ValueNotifier<TokenResponse?> token,
  }) async {
    if (token.value == null) {
      locator.navKey.context.pop(false);
    } else {
      await ref
          .read(authNotifierProvider.notifier)
          .signInWithOAuth(token: token.value!, signInMethod: signInMethod)
          .whenComplete(() => locator.navKey.context.pop(true));
    }
  }
}
