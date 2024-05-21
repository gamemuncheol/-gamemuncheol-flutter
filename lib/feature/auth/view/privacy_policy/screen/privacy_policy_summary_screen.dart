import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy/event/privacy_policy_summary_screen_event.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy/screen/privacy_policy_summary_screen_layout.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy/widget/sheet_header.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy/widget/sheet_next_button.dart';

class PrivacyPolicySummaryScreen extends BaseScreen
    with PrivacyPolicySummaryScreenEvent {
  final String summary;

  PrivacyPolicySummaryScreen({super.key, required this.summary});

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    return PrivacyPolicySummaryScreenLayout(
      nextButton: buildNextButton(onTap: () => agree(ref)),
      sheetHeader: buildSheetHeader(),
      divider: buildDivider(),
      summary: buildSummary(),
    );
  }

  Widget buildSheetHeader() {
    const String title = "약관에 동의해주세요";
    const String description = "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.";

    return const SheetHeader(
      title: title,
      description: description,
    );
  }

  Widget buildDivider() {
    final double dividerWidth = 328.w;
    final double dividerHeight = 1.5.h;

    final BoxDecoration dividerDecoration =
        BoxDecoration(color: colorTheme.natural02);

    return Container(
      width: dividerWidth,
      height: dividerHeight,
      decoration: dividerDecoration,
    );
  }

  Widget buildSummary() {
    double verticalPadding = 18.h;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      children: [
        Row(
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
        ),
      ],
    );
  }

  Widget buildNextButton({required VoidCallback onTap}) {
    return SheetNextButton(onTap: onTap);
  }
}
