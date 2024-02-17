import 'package:flutter/widgets.dart';

import 'package:gamemuncheol/feature/auth/widget/privacy_policy_sheet/header.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/feature/auth/widget/privacy_policy_sheet/privacy_policy_summary_sheet_scaffold.dart';
import 'package:gamemuncheol/common/const/colors.dart';

class PrivacyPolicySummarySheet extends StatelessWidget {
  const PrivacyPolicySummarySheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrivacyPolicySummarySheetScaffold(
      sheetHeader: renderSheetHeader(),
      divider1: renderDiver(),
      summary: renderSummary(),
    );
  }

  Widget renderSheetHeader() {
    return const DocsHeader(
      title: "약관에 동의해주세요",
      description: "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.",
    );
  }

  Widget renderDiver() {
    const double bottomPadding = 15;
    const double dividerWidth = 1;
    const double dividerHeight = 328;

    return Padding(
      padding: const EdgeInsets.only(
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

  Widget renderSummary() {
    const String summary =
        "datadatadatadatadatadatadatadatadatadatadatadatadaatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata";

    return const Row(
      children: [
        Flexible(
          child: Text(
            summary + summary + summary + summary + summary + summary,
          ),
        ),
      ],
    );
  }
}
