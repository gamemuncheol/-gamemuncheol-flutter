import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/mixin/privacy_policy_summary_screen_event.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_summary_screen_scaffold.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/widget/header.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/widget/next_button.dart';

class PrivacyPolicySummaryScreen extends ConsumerWidget
    with PrivacyPolicySummaryScreenEvent {
  final String summary;
  final VoidCallback goChangeNicknameScreen;

  const PrivacyPolicySummaryScreen({
    super.key,
    required this.summary,
    required this.goChangeNicknameScreen,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrivacyPolicySummaryScreenScaffold(
      nextButton: renderNextButton(
        onTap: () =>
            agree(ref, goChangeNicknameScreen: goChangeNicknameScreen),
      ),
      sheetHeader: renderSheetHeader(),
      divider: renderDivider(),
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
    const double dividerWidth = 1.5;
    const double dividerHeight = 328;

    BoxDecoration dividerDecoration =
        const BoxDecoration(color: AppColor.NATURAL_02);

    return ContainerBuilder()
        .withSize(
          height: dividerWidth,
          width: dividerHeight,
        )
        .setBoxDecoration(dividerDecoration)
        .build();
  }

  Widget renderSummary() {
    double listViewVerticalPadding = 18.h;

    return ListView(
      padding: EdgeInsets.symmetric(vertical: listViewVerticalPadding),
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

  Widget renderNextButton({required VoidCallback onTap}) {
    return PrivacyPolicySheetNextButton(onTap: onTap);
  }
}
