import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';

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

  @override
  Widget build(BuildContext context) {
    const double topPadding = 30;
    const double leftPadding = 20;
    const double rightPadding = 20;
    const double frameHeight = 300;

    return PaddingBuilder()
        .withPadding(
          top: topPadding,
          left: leftPadding,
          right: rightPadding,
        )
        .withChild(
          Column(
            children: [
              sheetHeader,
              divider1,
              SizedBoxBuilder()
                  .withSize(
                    height: frameHeight,
                  )
                  .withChild(
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: summary,
                    ),
                  ),
            ],
          ),
        );
  }
}
