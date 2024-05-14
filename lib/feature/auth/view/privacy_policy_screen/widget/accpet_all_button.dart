import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gamemuncheol/feature/auth/provider/privacy_policy_provider.dart';
import 'package:gamemuncheol/feature/auth/state/privacy_policy_state.dart';
import 'package:gap/gap.dart';

class AcceptAllButton extends ConsumerWidget with ThemeServiceProvider {
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
    final PrivacyPolicyStatus status =
        ref.watch(privacyPolicyNotifierProvider).status;

    final TextStyle titleStyle = textStyleTheme.body3M;
    final TextStyle descriptionStyle =
        textStyleTheme.body4R.copyWith(color: colorTheme.natural06);

    return GestureDetector(
      onTap: () {
        status != PrivacyPolicyStatus.allAccepted ? acceptALl() : rejectALl();
      },
      child: Container(
        color: colorTheme.background,
        child: Column(
          children: [
            Row(
              children: [
                buildCheckBox(
                  isSelected: status == PrivacyPolicyStatus.allAccepted,
                ),
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

  Widget buildCheckBox({required bool isSelected}) {
    return SvgPicture.asset(
      isSelected
          ? AppAsset.CHECKBOX_FILLED_VER_PATH
          : AppAsset.CHECKBOX_BLANK_VER_PATH,
    );
  }
}
