import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';
import 'package:gamemuncheol/feature/auth/presentation/provider/privacy_policy_provider.dart';
import 'package:gamemuncheol/feature/auth/presentation/state/privacy_policy_state.dart';

class AcceptAllButton extends ConsumerWidget with ThemeProvider {
  final VoidCallback acceptALl;
  final VoidCallback rejectALl;

  const AcceptAllButton({
    super.key,
    required this.acceptALl,
    required this.rejectALl,
  });

  final String title = "모두 동의";
  final String description = "서비스 이용을 위해 아래 약관에 모두 동의합니다.";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(privacyPolicyNotifierProvider).status ==
        PrivacyPolicyStatus.allAccepted;

    final titleStyle = textStyleTheme.body3M;
    final descriptionStyle =
        textStyleTheme.body4R.copyWith(color: colorTheme.natural06);

    return GestureDetector(
      onTap: () {
        isSelected ? rejectALl() : acceptALl();
      },
      child: Container(
        color: colorTheme.background,
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(isSelected
                    ? AppAsset.CHECKBOX_FILLED
                    : AppAsset.CHECKBOX_BLANK),
                Gap(12.w),
                Text(
                  title,
                  style: titleStyle,
                ),
              ],
            ),
            Gap(24.h),
            Row(
              children: [
                Text(
                  description,
                  style: descriptionStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
