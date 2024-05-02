import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/mixin/privacy_policy_accept_screen_event.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_accept_screen_scaffold.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/widget/header.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/widget/next_button.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/widget/term.dart';

class PrivacyPolicyAcceptScreen extends ConsumerWidget
    with PrivacyPolicyAcceptScreenEvent {
  final Map<String, bool> terms;
  final VoidCallback nextPage;

  const PrivacyPolicyAcceptScreen({
    super.key,
    required this.terms,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrivacyPolicyAcceptScreenScaffold(
      nextButton: renderNextButton(
        onTap: () => nextWhen(
          ref,
          nextPage: nextPage,
          necessaryAcceptCount: calNeccesary(terms: terms),
        ),
      ),
      sheetHeader: renderSheetHeader(),
      accpetAllButton: renderAccpetAllButton(),
      divider: renderDivider(),
      singleTermList: renderSingleTerms(),
    );
  }

  Widget renderSheetHeader() {
    return const DocsHeader(
      title: "약관에 동의해주세요",
      description: "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.",
    );
  }

  Widget renderAccpetAllButton() {
    return Term.acceptAllTerm(
      description: "서비스 이용을 위해 아래 약관에 모두 동의합니다.",
    );
  }

  Widget renderDivider() {
    const double dividerWidth = 328;
    const double dividerHeight = 1.5;

    BoxDecoration dividerDecoration =
        const BoxDecoration(color: AppColor.NATURAL_02);

    return ContainerBuilder()
        .withSize(
          width: dividerWidth,
          height: dividerHeight,
        )
        .setBoxDecoration(dividerDecoration)
        .build();
  }

  Widget renderSingleTerms() {
    final double listViewVerticalPadding = 18.h;
    const double singleSheetVerticalPadding = 18;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: listViewVerticalPadding),
      itemCount: terms.length,
      itemBuilder: (context, index) {
        final bool isNeccesary = terms.values.toList()[index];
        final String description = terms.keys.toList()[index];

        return PaddingBuilder()
            .setPadding(vertical: singleSheetVerticalPadding)
            .setChild(
              isNeccesary
                  ? Term.singleWithNeccesary(description: description)
                  : Term.singleWithUnnecessary(description: description),
            );
      },
    );
  }

  Widget renderNextButton({required VoidCallback onTap}) {
    return PrivacyPolicySheetNextButton(
      onTap: onTap,
    );
  }
}
