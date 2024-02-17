import 'package:flutter/widgets.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';

class PrivacyPolicySummarySheetScaffold extends StatelessWidget {
  // 헤더
  final Widget sheetHeader;

  // 구분선
  final Widget divider1;

  // 처리방침 요약본
  final Widget summary;

  const PrivacyPolicySummarySheetScaffold({
    super.key,
    required this.sheetHeader,
    required this.divider1,
    required this.summary,
  });

  final double topPadding = 30;
  final double leftPadding = 20;
  final double rightPadding = 20;
  final double scrollHeight = 300;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: leftPadding,
        right: rightPadding,
      ).su(),
      child: Column(
        children: [
          sheetHeader,
          divider1,
          SizedBox(
            height: scrollHeight,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: summary,
            ),
          ).su(),
        ],
      ),
    );
  }
}
