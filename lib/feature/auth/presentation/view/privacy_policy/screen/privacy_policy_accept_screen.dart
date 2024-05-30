import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/util/theme_util.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/event/privacy_policy_accept_screen_event.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/screen/privacy_policy_accept_screen_layout.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/widget/accpet_all_button.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/widget/sheet_header.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/widget/sheet_next_button.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/privacy_policy/widget/term.dart';

class PrivacyPolicyAcceptScreen extends BaseScreen
    with PrivacyPolicyAcceptScreenEvent, ThemeProvider {
  final Map<String, bool> terms;
  final PageController pageController;

  PrivacyPolicyAcceptScreen({
    super.key,
    required this.terms,
    required this.pageController,
  });

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    // 무조건 동의해야 하는 항목 수
    final int passCount =
        useMemoized(() => calPassCount(terms: terms), [terms]);

    return PrivacyPolicyAcceptScreenLayout(
      nextButton: buildNextButton(
        onTap: () {
          nextPage(ref, pageController: pageController, passCount: passCount);
        },
      ),
      sheetHeader: buildSheetHeader(),
      accpetAllButton: buildAccpetAllButton(
        acceptALl: () => acceptALl(ref),
        rejectALl: () => rejectALl(ref),
      ),
      divider: buildDivider(),
      terms: buildTerms(
        accept: accept,
        reject: reject,
        listenGlobalEvent: listenGlobalEvent,
      ),
    );
  }

  Widget buildSheetHeader() {
    const String title = "약관에 동의해주세요";
    const String description = "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.";

    return const SheetHeader(title: title, description: description);
  }

  Widget buildAccpetAllButton({
    required VoidCallback acceptALl,
    required VoidCallback rejectALl,
  }) {
    return AcceptAllButton(
      acceptALl: acceptALl,
      rejectALl: rejectALl,
    );
  }

  Widget buildDivider() {
    final double dividerWidth = 328.w;
    final double dividerHeight = 1.5.h;

    final dividerDecoration = BoxDecoration(color: colorTheme.natural02);

    return Container(
      width: dividerWidth,
      height: dividerHeight,
      decoration: dividerDecoration,
    );
  }

  Widget buildTerms({
    required void Function(
      WidgetRef ref, {
      required bool isUnNeccesary,
      required ValueNotifier<bool> isAccepted,
    }) accept,
    required void Function(
      WidgetRef ref, {
      required bool isUnNeccesary,
      required ValueNotifier<bool> isAccepted,
    }) reject,
    required void Function(
      WidgetRef ref, {
      required ValueNotifier<bool> isAccepted,
    }) listenGlobalEvent,
  }) {
    final double listViewVerticalPadding = 18.h;
    final double sheetVerticalPadding = listViewVerticalPadding;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: listViewVerticalPadding),
      itemCount: terms.length,
      itemBuilder: (context, index) {
        final bool isUnNeccesary = !terms.values.toList()[index];
        final String description = terms.keys.toList()[index];

        return Padding(
          padding: EdgeInsets.symmetric(vertical: sheetVerticalPadding),
          child: Term(
            listenGlobalEvent: listenGlobalEvent,
            isUnNeccesary: isUnNeccesary,
            description: description,
            accept: accept,
            reject: reject,
          ),
        );
      },
    );
  }

  Widget buildNextButton({required VoidCallback onTap}) {
    return SheetNextButton(onTap: onTap);
  }
}
