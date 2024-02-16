import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/feature/auth/provider/privacy_policy_sheet_provider.dart';
import 'package:gamemuncheol/feature/auth/widget/privacy_policy_sheet/privacy_policy_accept_list_sheet.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/common/widget/app_text.dart';

class PrivacyPolicyHome extends HookConsumerWidget {
  // 모든 약관 동의 후 실행할 로그인 함수
  final void Function() signInFunc;

  PrivacyPolicyHome({
    super.key,
    required this.signInFunc,
  });

  final double sheetHeight = 587;

  final BoxDecoration boxDecoration = BoxDecoration(
    color: ColorGuidance.PRIMARY_WITHE,
    borderRadius: BorderRadius.circular(
      10,
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = usePageController();

    return Container(
      decoration: boxDecoration,
      child: Stack(
        fit: StackFit.expand,
        children: [
          renderPages(
            pageController: pageController,
          ),
          renderNextButton(
            ref,
            pageController: pageController,
          ),
        ],
      ),
    ).su(
      height: sheetHeight,
    );
  }

  Widget renderPages({
    required PageController pageController,
  }) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        PrivacyPolicyAcceptListSheet(),
      ],
    );
  }

  Widget renderNextButton(
    WidgetRef ref, {
    required PageController pageController,
  }) {
    void goNextPage() => ref
        .read(
          privacyPolicyNotifierProvider.notifier,
        )
        .goNextPage(
          pageController: pageController,
        );

    const double buttonHeight = 64;

    const BoxDecoration boxDecoration = BoxDecoration(
      color: ColorGuidance.PRIMARY_BLUE,
    );

    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => goNextPage(),
          child: Container(
            decoration: boxDecoration,
            child: const Center(
              child: AppText(
                "다음",
                color: ColorGuidance.PRIMARY_WITHE,
                size: 16,
                weight: FontWeight.w500,
              ),
            ),
          ).su(
            height: buttonHeight,
          ),
        ),
      ),
    );
  }
}
