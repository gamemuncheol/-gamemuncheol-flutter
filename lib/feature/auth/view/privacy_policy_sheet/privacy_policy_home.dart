import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/widget/next_button.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/widget/privacy_policy_accept_list_sheet.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/widget/privacy_policy_summary_sheet.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/privacy_policy_home_scaffold.dart';

class PrivacyPolicyHome extends HookWidget {
  final SignInMethod signInMethod;

  const PrivacyPolicyHome({
    super.key,
    required this.signInMethod,
  });

  // 필수 동의 항목 계산
  int calNeccesary({
    required Map<String, bool> terms,
  }) {
    int necessaryAcceptCount = 0;

    terms.forEach((key, value) {
      if (value) {
        necessaryAcceptCount++;
      }
    });

    return necessaryAcceptCount;
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = usePageController();

    // 개인 정보 처리 방침
    final Map<String, bool> terms = {
      "[필수] 만 14세 이상입니다.": true,
      "[필수] 서비스 이용약관 동의": true,
      "[필수] 개인정보 처리방침 동의": true,
      "[선택] 마케팅 수신 동의": false,
      "[선택] 마케팅 수신 동의2": false,
    };

    // 개인 정보 처리 방침 요약
    const String summary =
        "datadatadatadatadatadatadatadatadatadatadatadatadaatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata";

    return PrivacyPolicyHomeScaffold(
      pages: renderPages(
        pageController: pageController,
        terms: terms,
        summary: summary,
      ),
      nextButton: renderNextButton(
        pageController: pageController,
        terms: terms,
      ),
    );
  }

  Widget renderPages({
    required PageController pageController,
    required Map<String, bool> terms,
    required String summary,
  }) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        PrivacyPolicyAcceptListSheet(
          terms: terms,
        ),
        PrivacyPolicySummarySheet(
          summary: summary,
        ),
      ],
    );
  }

  Widget renderNextButton({
    required PageController pageController,
    required Map<String, bool> terms,
  }) {
    final int necessaryAcceptCount = calNeccesary(
      terms: terms,
    );

    return NextButton(
      pageController: pageController,
      signInMethod: signInMethod,
      necessaryAcceptCount: necessaryAcceptCount,
    );
  }
}
