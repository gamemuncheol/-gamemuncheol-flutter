import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:uni_links/uni_links.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';

mixin OauthWebviewScreenEvent {
  void startOauth({required ChromeSafariBrowser chromeSafariBrowser}) {
    chromeSafariBrowser.open(url: WebUri(Data.OAUTH_WAS_URL));
  }

  String? getToken({required String link}) {
    final Uri uri = Uri.parse(link);

    final String accessTokenKey =
        Data.OAUTH_REDIRECT_QUERY_PARAM_ACCESSTOKEN_KEY;
    final String refreshTokenKey =
        Data.OAUTH_REDIRECT_QUERY_PARAM_REFRESHTOKEN_KEY;

    return "${uri.queryParameters[accessTokenKey]}/${uri.queryParameters[refreshTokenKey]}";
  }

  void listenUniLinks(
    WidgetRef ref, {
    required ValueNotifier<String?> token,
    required ChromeSafariBrowser chromeSafariBrowser,
  }) {
    linkStream.listen((link) async {
      if (link != null) {
        token.value = getToken(link: link);
        await chromeSafariBrowser.close();
      }
    });
  }

  Future<bool> signInWhenToken(
    BuildContext context,
    WidgetRef ref, {
    required ValueNotifier<String?> token,
    required SignInMethod signInMethod,
  }) async {
    if (token.value == null) {
      return false;
    } else {
      switch (signInMethod) {
        case SignInMethod.google:
          await ref
              .read(authNotifierProvider.notifier)
              .signInWithGoogle(token: token.value!);

        default:
          break;
      }
      return true;
    }
  }
}
