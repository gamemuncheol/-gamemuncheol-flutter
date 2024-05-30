// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/screen/privacy_policy_accept_screen.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/screen/privacy_policy_summary_screen.dart';

class PrivacyPolicyHomeScreen extends BaseScreenV2 {
  const PrivacyPolicyHomeScreen({super.key});

  static const PATH = "/$NAME";
  static const NAME = "PRIVACY_POLICY_HOME_SCREEN";

  @override
  BaseScreenV2State<PrivacyPolicyHomeScreen> createState() =>
      _PrivacyPolicyScreenV2State();
}

class _PrivacyPolicyScreenV2State
    extends BaseScreenV2State<PrivacyPolicyHomeScreen> with DefaultLayout {
  final Map<String, bool> terms = {
    "[필수] 만 14세 이상입니다.": true,
    "[필수] 서비스 이용약관 동의": true,
    "[필수] 개인정보 처리방침 동의": true,
    "[선택] 마케팅 수신 동의": false,
    "[선택] 커뮤니티 이용 방침 동의": false,
  };

  final String summary =
      "가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 가나다라마바사 ";

  final PageController controller = PageController();

  @override
  Widget buildBody() {
    return PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        PrivacyPolicyAcceptScreen(terms: terms, pageController: controller),
        PrivacyPolicySummaryScreen(
          summary: summary,
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
