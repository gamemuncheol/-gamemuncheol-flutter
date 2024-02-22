// ignore_for_file: unnecessary_this

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/view/home_screen.dart';
import 'package:gamemuncheol/feature/user/view/register_nickname_screen.dart';
import 'package:gamemuncheol/common/router/redirect_state.dart';
import 'package:gamemuncheol/feature/auth/view/oauth_webview_screen.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen.dart';

class RedirectInjectionParam extends Equatable {
  // 리다이렉트 상태
  final ValueNotifier<RedirectState> redirectState;

  const RedirectInjectionParam(
    this.redirectState,
  );

  @override
  List<Object?> get props => [
        redirectState,
      ];

  // 리다이렉트 로직
  FutureOr<String?> redirectLogic(
    BuildContext context,
    GoRouterState goRouterState,
  ) async {
    // 리다이렉트 상태
    final RedirectState redirectState = this.redirectState.value;

    // 로그인 + 닉네임 등록 상태
    // 홈스크린으로 이동
    if (redirectState == RedirectState.AUTHENTICATED_WITH_NICKNAME) {
      return HomeScreen.PATH;

      // 로그인 상태
      // 닉네임 등록 화면으로 이동
    } else if (redirectState == RedirectState.AUTHENTICATED) {
      return RegisterNickNameScreen.PATH;

      // 로그아웃 상태
      // 소셜 로그인 화면으로 이동
    } else if (redirectState == RedirectState.UNAUTHENTICATED) {
      // 현재 위치
      final String currentPath = goRouterState.matchedLocation;

      // 로그인을 위한 웹뷰 화면으로 이동은 허용함
      if (currentPath == OauthWebviewScreen.PATH) {
        return null;
      }

      return SocialAuthScreen.PATH;
    }

    return null;
  }
}
