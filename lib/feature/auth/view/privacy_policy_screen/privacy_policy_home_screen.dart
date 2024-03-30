// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/mixin/privacy_policy_home_screen_event.dart';

import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_accept_screen.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_summary_screen.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_home_screen_scaffold.dart';

class PrivacyPolicyHomeScreen extends HookWidget
    with PrivacyPolicyHomeScreenEvent {
  PrivacyPolicyHomeScreen({super.key});

  static const PATH = "/privacy_policy_home_screen";
  static const ROUTE_NAME = "PrivacyPolicyHomeScreen";

  // 개인 정보 처리 방침
  final Map<String, bool> terms = {
    "[필수] 만 14세 이상입니다.": true,
    "[필수] 서비스 이용약관 동의": true,
    "[필수] 개인정보 처리방침 동의": true,
    "[선택] 마케팅 수신 동의": false,
    "[선택] 커뮤니티 이용 방침 동의": false,
  };

  // 개인 정보 처리 방침 요약
  final String summary =
      "datadatadatadatadatadatadatadatadatadatadatadatadaatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata";

  @override
  Widget build(BuildContext context) {
    final PageController pageController = usePageController();

    return PrivacyPolicyHomeScreenScaffold(
      pageView: renderPageView(
        pageController: pageController,
        nextPage: () {
          nextPage(pageController: pageController);
        },
        goChangeNicknameScreen: () {
          goChangeNicknameScreen(context);
        },
      ),
    );
  }

  Widget renderPageView({
    required PageController pageController,
    required VoidCallback nextPage,
    required VoidCallback goChangeNicknameScreen,
  }) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        PrivacyPolicyAcceptScreen(
          terms: terms,
          nextPage: nextPage,
        ),
        PrivacyPolicySummaryScreen(
          summary: summary,
          goChangeNicknameScreen: goChangeNicknameScreen,
        ),
      ],
    );
  }
}
