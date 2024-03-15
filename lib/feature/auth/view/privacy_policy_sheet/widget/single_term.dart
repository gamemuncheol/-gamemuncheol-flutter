import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/feature/auth/provider/privacy_policy_sheet_provider.dart';
import 'package:gamemuncheol/feature/auth/state/privacy_policy_sheet_state.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/mixin/single_term_event.dart';
import 'package:gap/gap.dart';

class SingleTerm extends ConsumerStatefulWidget {
  // 항목에 대한 설명
  final String description;

  // 모두 동의 항목
  final bool isAcceptAllTerm;

  // 선택 항목
  final bool? isUnnecessaryTerm;

  const SingleTerm({
    super.key,
    required this.description,
    this.isAcceptAllTerm = false,
    this.isUnnecessaryTerm,
  });

  factory SingleTerm.acceptAll({
    required String description,
  }) {
    return SingleTerm(
      description: description,
      isAcceptAllTerm: true,
    );
  }

  factory SingleTerm.singleWithNeccesary({
    required String description,
  }) {
    return SingleTerm(
      description: description,
      isAcceptAllTerm: false,
    );
  }

  factory SingleTerm.singleWithUnnecessary({
    required String description,
  }) {
    return SingleTerm(
      description: description,
      isAcceptAllTerm: false,
      isUnnecessaryTerm: true,
    );
  }

  @override
  ConsumerState<SingleTerm> createState() => _SingleTermState();
}

class _SingleTermState extends ConsumerState<SingleTerm> with SigleTermEvent {
  @override
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    stateListener(
      ref,
    );

    // 모두 동의 항목의 경우
    if (widget.isAcceptAllTerm) {
      return Column(
        children: [
          renderAcceptAllTitle(),
          renderAcceptAllDescription(),
        ],
      );
    }

    // 개별 항목의 경우
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => isAccepted
              ? reject(
                  ref,
                )
              : accept(
                  ref,
                ),
          child: Row(
            children: [
              renderCheckBox(),
              renderDescription(),
            ],
          ),
        ),
        renderSeeMoreButton(),
      ],
    );
  }

  Widget renderAcceptAllTitle() {
    const double leftPadding = 12;

    final TextStyle termTextStyle = TextStyleBuilder()
        .withFontSize(
          18,
        )
        .build();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => ref.read(
            privacyPolicyNotifierProvider,
          ) is! PrivacyPolicySheetStateAllAccepted
              ? acceptALl(
                  ref,
                )
              : rejectALl(
                  ref,
                ),
          child: Row(
            children: [
              renderCheckBox(),
              PaddingBuilder()
                  .withPadding(
                    left: leftPadding,
                  )
                  .withChild(
                    Text(
                      "모두 동의",
                      style: termTextStyle,
                    ),
                  ),
            ],
          ),
        ),
        renderSeeMoreButton(),
      ],
    );
  }

  Widget renderAcceptAllDescription() {
    const double space1 = 11;
    const double leftPadding = 42;

    final TextStyle descriptionTextStyle = TextStyleBuilder()
        .withColor(
          ColorGuidance.FONT_GREY_03,
        )
        .withFontSize(
          14,
        )
        .build();

    return Column(
      children: [
        const Gap(
          space1,
        ).withHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PaddingBuilder()
                .withPadding(
                  left: leftPadding,
                )
                .withChild(
                  Text(
                    widget.description,
                    style: descriptionTextStyle,
                  ),
                ),
          ],
        ),
      ],
    );
  }

  Widget renderCheckBox() {
    return SvgPicture.asset(
      isAccepted
          ? AssetPaths.CHECKBOX_FILLED_VER_PATH
          : AssetPaths.CHECKBOX_BLANK_VER_PATH,
    );
  }

  Widget renderDescription() {
    const double leftPadding = 12;

    final TextStyle descriptionTextStyle = TextStyleBuilder()
        .withFontSize(
          16,
        )
        .build();

    return PaddingBuilder()
        .withPadding(
          left: leftPadding,
        )
        .withChild(
          Text(
            widget.description,
            style: descriptionTextStyle,
          ),
        );
  }

  Widget renderSeeMoreButton() {
    return SvgPicture.asset(
      AssetPaths.ARROW_RIGHT_PATH,
    );
  }
}
