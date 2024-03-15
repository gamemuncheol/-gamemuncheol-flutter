import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/util/app_padding.dart';

class PrivacyPolicyAcceptListSheetScaffold extends StatelessWidget {
  // 헤더
  final Widget sheetHeader;

  // 모두 동의 버튼
  final Widget accpetAllButton;

  // 구분선
  final Widget divider1;

  //  개별 동의 항목들
  final Widget singleTermList;

  const PrivacyPolicyAcceptListSheetScaffold({
    super.key,
    required this.sheetHeader,
    required this.accpetAllButton,
    required this.divider1,
    required this.singleTermList,
  });

  @override
  Widget build(BuildContext context) {
    const double topPadding = 30;
    const double leftPadding = 20;
    const double rightPadding = 20;

    return PaddingBuilder()
        .withPadding(
          top: topPadding,
          left: leftPadding,
          right: rightPadding,
        )
        .withChild(
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                sheetHeader,
                accpetAllButton,
                divider1,
                singleTermList,
              ],
            ),
          ),
        );
  }
}
