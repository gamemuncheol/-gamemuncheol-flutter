import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_sreen_base_scaffold.dart';
import 'package:gap/gap.dart';

class PrivacyPolicyAcceptScreenScaffold
    extends PrivacyPolicyScreenBaseScaffold {
  // 헤더
  final Widget sheetHeader;

  // 모두 동의 버튼
  final Widget accpetAllButton;

  // 구분선
  final Widget divider;

  //  개별 동의 항목들
  final Widget singleTermList;

  const PrivacyPolicyAcceptScreenScaffold({
    super.key,
    required super.nextButton,
    required this.sheetHeader,
    required this.accpetAllButton,
    required this.divider,
    required this.singleTermList,
  });

  @override
  Widget renderScaffold() {
    return Column(
      children: [
        SafeArea(child: sheetHeader),
        accpetAllButton,
        const Gap(21).withHeight(),
        divider,
        Expanded(child: singleTermList),
      ],
    );
  }
}
