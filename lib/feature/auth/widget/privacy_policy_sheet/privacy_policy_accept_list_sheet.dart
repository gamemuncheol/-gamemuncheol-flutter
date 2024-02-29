import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';

import 'package:gamemuncheol/feature/auth/widget/privacy_policy_sheet/header.dart';
import 'package:gamemuncheol/feature/auth/widget/privacy_policy_sheet/privacy_policy_accept_list_sheet_scaffold.dart';
import 'package:gamemuncheol/feature/auth/widget/privacy_policy_sheet/single_term.dart';

class PrivacyPolicyAcceptListSheet extends ConsumerWidget {
  const PrivacyPolicyAcceptListSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrivacyPolicyAcceptListSheetScaffold(
      sheetHeader: renderSheetHeader(),
      accpetAllButton: renderAccpetAllButton(),
      divider1: renderDiver(),
      singleTermList: renderSingleTermList(),
    );
  }

  Widget renderSheetHeader() {
    return const DocsHeader(
      title: "약관에 동의해주세요",
      description: "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.",
    );
  }

  Widget renderAccpetAllButton() {
    return const SingleTerm(
      description: "서비스 이용을 위해 아래 약관에 모두 동의합니다.",
      isSuperTerm: true,
    );
  }

  Widget renderDiver() {
    const double topPadding = 21;
    const double bottomPadding = 25;
    const double dividerWidth = 1;
    const double dividerHeight = 328;

    return Padding(
      padding: const EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
      ).su(),
      child: Container(
        decoration: const BoxDecoration(
          color: ColorGuidance.WHITE100,
        ),
      ).su(
        height: dividerWidth,
        width: dividerHeight,
      ),
    );
  }

  Widget renderSingleTermList() {
    const double verticalPadding = 7;

    final List<String> descriptionList = [
      "[필수] 만 14세 이상입니다.",
      "[필수] 서비스 이용약관 동의",
      "[필수] 개인정보 처리방침 동의",
      "[선택] 마케팅 수신 동의",
    ];

    return Column(
      children: List.generate(
        descriptionList.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: verticalPadding,
          ).su(),
          child: SingleTerm(
            description: descriptionList[index],
            isUnnecessaryTerm: index == 3 ? true : null,
          ),
        ),
      ),
    );
  }
}
