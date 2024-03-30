import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/auth/provider/privacy_policy_provider.dart';
import 'package:gamemuncheol/feature/auth/state/privacy_policy_state.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/mixin/privacy_policy_accept_screen_event.dart';

class Term extends HookConsumerWidget with PrivacyPolicyAcceptScreenEvent {
  final String description;
  final bool isAcceptAllTerm;
  final bool isUnnecessaryTerm;

  Term({
    super.key,
    required this.description,
    this.isAcceptAllTerm = false,
    this.isUnnecessaryTerm = false,
  });

  factory Term.acceptAllTerm({required String description}) {
    return Term(
      description: description,
      isAcceptAllTerm: true,
    );
  }

  factory Term.singleWithNeccesary({required String description}) {
    return Term(
      description: description,
      isAcceptAllTerm: false,
    );
  }

  factory Term.singleWithUnnecessary({required String description}) {
    return Term(
      description: description,
      isAcceptAllTerm: false,
      isUnnecessaryTerm: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> isAccepted = useState(false);
    stateListener(ref, isAccepted: isAccepted);

    // 전체 동의 항목인 경우
    if (isAcceptAllTerm) {
      return GestureDetector(
        onTap: () {
          ref.read(privacyPolicyNotifierProvider).state !=
                  PrivacyPolicyStates.allAccepted
              ? acceptALl(ref)
              : rejectALl(ref);
        },
        child: Container(
          color: AppColor.PRIMARY_WITHE,
          child: Column(
            children: [
              renderAcceptAllTitle(isAccepted: isAccepted),
              renderAcceptAllDescription(),
            ],
          ),
        ),
      );
    }
    // 개별 동의 항목인 경우
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => isAccepted.value
                ? reject(ref,
                    isUnnecessaryTerm: isUnnecessaryTerm,
                    isAccepted: isAccepted)
                : accept(ref,
                    isUnnecessaryTerm: isUnnecessaryTerm,
                    isAccepted: isAccepted),
            child: Container(
              color: AppColor.PRIMARY_WITHE,
              child: Row(
                children: [
                  renderCheckBox(isAccepted: isAccepted),
                  Expanded(child: renderDescription()),
                ],
              ),
            ),
          ),
        ),
        renderSeeMoreButton(),
      ],
    );
  }

  Widget renderAcceptAllTitle({required ValueNotifier<bool> isAccepted}) {
    final TextStyle termTextStyle =
        TextStyleBuilder().withFontSize(18).withMedium().build();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            renderCheckBox(isAccepted: isAccepted),
            const Gap(12).withWidth(),
            Text(
              "모두 동의",
              style: termTextStyle,
            ),
          ],
        ),
      ],
    );
  }

  Widget renderAcceptAllDescription() {
    final TextStyle descriptionTextStyle = TextStyleBuilder()
        .withColor(AppColor.FONT_GREY_03)
        .withFontSize(14)
        .build();

    return Column(
      children: [
        const Gap(11).withHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(42).withHeight(),
            Text(
              description,
              style: descriptionTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }

  Widget renderCheckBox({required ValueNotifier<bool> isAccepted}) {
    return SvgPicture.asset(
      isAccepted.value
          ? AppAsset.CHECKBOX_FILLED_VER_PATH
          : AppAsset.CHECKBOX_BLANK_VER_PATH,
    );
  }

  Widget renderDescription() {
    final TextStyle descriptionTextStyle =
        TextStyleBuilder().withFontSize(16).build();

    return Row(
      children: [
        const Gap(12).withHeight(),
        Expanded(
          child: Text(
            description,
            style: descriptionTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Widget renderSeeMoreButton() => SvgPicture.asset(AppAsset.ARROW_RIGHT_PATH);
}
