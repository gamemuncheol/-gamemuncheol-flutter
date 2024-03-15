import 'package:flutter/widgets.dart';

import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/widget/header.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/widget/privacy_policy_summary_sheet_scaffold.dart';

class PrivacyPolicySummarySheet extends StatelessWidget {
  final String summary;

  const PrivacyPolicySummarySheet({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return PrivacyPolicySummarySheetScaffold(
      sheetHeader: renderSheetHeader(),
      divider1: renderDivider(),
      summary: renderSummary(),
    );
  }

  Widget renderSheetHeader() {
    return const DocsHeader(
      title: "약관에 동의해주세요",
      description: "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.",
    );
  }

  Widget renderDivider() {
    const double bottomPadding = 15;
    const double dividerWidth = 1;
    const double dividerHeight = 328;

    BoxDecoration dividerDecoration = const BoxDecoration(
      color: ColorGuidance.WHITE100,
    );

    return PaddingBuilder()
        .withPadding(
          bottom: bottomPadding,
        )
        .withChild(
          ContainerBuilder()
              .withSize(
                height: dividerWidth,
                width: dividerHeight,
              )
              .withBoxDecoration(
                dividerDecoration,
              )
              .build(),
        );
  }

  Widget renderSummary() {
    return Row(
      children: [
        Flexible(
          child: Text(
            summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary +
                summary,
          ),
        ),
      ],
    );
  }
}
