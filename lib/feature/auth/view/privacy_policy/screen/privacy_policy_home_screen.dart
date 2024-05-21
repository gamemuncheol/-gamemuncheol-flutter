// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';

import 'package:gamemuncheol/feature/auth/view/privacy_policy/screen/privacy_policy_accept_screen.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy/screen/privacy_policy_home_screen_Layout.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy/screen/privacy_policy_summary_screen.dart';

class PrivacyPolicyHomeScreen extends BaseScreen {
  PrivacyPolicyHomeScreen({super.key});

  static const PATH = "/privacy_policy_home_screen";
  static const NAME = "PrivacyPolicyHomeScreen";

  final Map<String, bool> terms = {
    "[필수] 만 14세 이상입니다.": true,
    "[필수] 서비스 이용약관 동의": true,
    "[필수] 개인정보 처리방침 동의": true,
    "[선택] 마케팅 수신 동의": false,
    "[선택] 커뮤니티 이용 방침 동의": false,
  };

  final String summary =
      "가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 ";

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final PageController pageController = usePageController();

    return PrivacyPolicyHomeScreenLayout(
      pageView: buildPageView(
        pageController: pageController,
        summary: summary,
        terms: terms,
      ),
    );
  }

  Widget buildPageView({
    required PageController pageController,
    required Map<String, bool> terms,
    required String summary,
  }) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        PrivacyPolicyAcceptScreen(terms: terms, pageController: pageController),
        PrivacyPolicySummaryScreen(summary: summary),
      ],
    );
  }
}
