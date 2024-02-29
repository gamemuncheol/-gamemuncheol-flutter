import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';

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

  final double topPadding = 30;
  final double leftPadding = 20;
  final double rightPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: leftPadding,
        right: rightPadding,
      ).su(),
      child: SingleChildScrollView(
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
