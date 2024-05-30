// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/presentation/component/loading_indicator.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/event/oauth_webview_screen_event.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/oauth_webview_screen_layout.dart';

class OauthWebviewScreenV2 extends BaseScreenV2 {
  final SignInMethod signInMethod;

  const OauthWebviewScreenV2({super.key, required this.signInMethod});

  static const PATH = "/$NAME";
  static const NAME = "OAUTH_WEBVIEW_SCREEN";

  factory OauthWebviewScreenV2.apple() =>
      const OauthWebviewScreenV2(signInMethod: SignInMethod.apple);

  factory OauthWebviewScreenV2.google() =>
      const OauthWebviewScreenV2(signInMethod: SignInMethod.google);

  @override
  BaseScreenV2State<OauthWebviewScreenV2> createState() =>
      _OauthWebviewScreenV2State();
}

class _OauthWebviewScreenV2State extends BaseScreenV2State<OauthWebviewScreenV2>
    with DefaultLayout, OauthWebviewScreenState {
  @override
  Widget buildBody() {
    return const OAuthWebviewScreenLayout(
      indicator: LoadingIndicator(),
    );
  }
}
