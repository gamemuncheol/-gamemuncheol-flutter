import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/auth/model/token_response.dart';
import 'package:gamemuncheol/feature/auth/presentation/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/component/my_browser.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/oauth_webview_screen.dart';

mixin OauthWebviewScreenState on BaseScreenV2State<OauthWebviewScreenV2> {
  // 웹뷰에서 받아올 토큰
  final ValueNotifier<TokenResponse?> token = ValueNotifier(null);

  // 브라우저 설정
  late final chromeSafariBrowser =
      MyChromeSafariBrowser(onClosedCallBack: signInWithOAuth);

  @override
  void initState() {
    listenUniLinks();
    startOauth();
    super.initState();
  }

  @override
  void dispose() {
    token.dispose();
    super.dispose();
  }

  // 화면에 들어오면 바로 웹으로 로그인하러 떠남!
  void startOauth() {
    chromeSafariBrowser.open(
      // https://우리 파베 호스팅 웹 주소?signInMethod=${signInMethod.name}
      url: WebUri(
          "${AppData.OAUTH_WAS_URL}?signInMethod=${widget.signInMethod.name}"),
    );
  }

  // link(앱 스킴으로 앱 켰을 때 딸려온 queryParameters)에서 token 추출
  TokenResponse? getToken({required String link}) {
    final uri = Uri.parse(link);
    TokenResponse? tokenResponse;

    final acTokenKey = AppData.OAUTH_REDIRECT_QUERY_PARAM_ACCESSTOKEN_KEY;
    final refTokenKey = AppData.OAUTH_REDIRECT_QUERY_PARAM_REFRESHTOKEN_KEY;

    if (uri.queryParameters.isNotEmpty) {
      final Map<String, String> params = uri.queryParameters;
      tokenResponse = TokenResponse(
          accessToken: params[acTokenKey]!, refreshToken: params[refTokenKey]!);
    }

    return tokenResponse;
  }

  // 앱으로 돌아올 때 1. 토큰을 추출하고
  // 2. 브라우저를 닫음
  void listenUniLinks() {
    linkStream.listen((link) async {
      if (link != null) {
        token.value = getToken(link: link);
        await chromeSafariBrowser.close();
      }
    });
  }

  // 브라우저가 닫힐 때 == 앱으로 돌아올 때 로그인
  Future<void> signInWithOAuth() async {
    if (token.value == null) {
      context.pop(false);
    } else {
      await ref
          .read(authNotifierProvider.notifier)
          .signIn(token: token.value!, signInMethod: widget.signInMethod)
          .whenComplete(() => context.pop(true));
    }
  }
}
