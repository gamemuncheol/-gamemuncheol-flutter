import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/common/widget/app_text.dart';
import 'package:gamemuncheol/feature/auth/provider/privacy_policy_sheet_provider.dart';
import 'package:gamemuncheol/feature/auth/state/privacy_policy_sheet_state.dart';

class SingleTerm extends ConsumerStatefulWidget {
  // 항목 설명
  final String description;

  // 모두 동의 항목인 경우
  final bool isSuperTerm;

  // 모두 동의 항목인 경우
  final bool? isUnnecessaryTerm;

  const SingleTerm({
    super.key,
    required this.description,
    this.isSuperTerm = false,
    this.isUnnecessaryTerm,
  });

  @override
  ConsumerState<SingleTerm> createState() => _SingleTermState();
}

class _SingleTermState extends ConsumerState<SingleTerm> {
  void stateListener() {
    ref.listen(privacyPolicyNotifierProvider, (previous, next) {
      if (next is PrivacyPolicySheetStateAllAccepted) {
        setState(() {
          isAccepted = true;
        });
      }

      if (next is PrivacyPolicySheetStateAllRejected) {
        setState(() {
          isAccepted = false;
        });
      }
    });
  }

  void acceptALl() => ref
      .read(
        privacyPolicyNotifierProvider.notifier,
      )
      .acceptAll();

  void rejectALl() => ref
      .read(
        privacyPolicyNotifierProvider.notifier,
      )
      .rejectALl();

  void accept() => setState(() {
        isAccepted = ref
            .read(
              privacyPolicyNotifierProvider.notifier,
            )
            .accept(
              isUnnecessaryTerm: widget.isUnnecessaryTerm,
            );
      });

  void reject() => setState(() {
        isAccepted = ref
            .read(
              privacyPolicyNotifierProvider.notifier,
            )
            .reject(
              isUnnecessaryTerm: widget.isUnnecessaryTerm,
            );
      });

  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    stateListener();

    if (widget.isSuperTerm) {
      return Column(
        children: [
          renderTop(),
          renderBottom(),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => isAccepted ? reject() : accept(),
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

  Widget renderTop() {
    const double leftPadding = 12;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => ref.read(
            privacyPolicyNotifierProvider,
          ) is! PrivacyPolicySheetStateAllAccepted
              ? acceptALl()
              : rejectALl(),
          child: Row(
            children: [
              renderCheckBox(),
              Padding(
                padding: const EdgeInsets.only(
                  left: leftPadding,
                ).su(),
                child: const AppText(
                  "모두 동의",
                  color: ColorGuidance.FONT_BLACK,
                  size: 18,
                  weight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        renderSeeMoreButton(),
      ],
    );
  }

  Widget renderBottom() {
    const double space1 = 11;
    const double leftPadding = 42;

    return Column(
      children: [
        const SizedBox(
          height: space1,
        ).su(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: leftPadding,
              ).su(),
              child: AppText(
                widget.description,
                color: ColorGuidance.FONT_GREY,
                size: 14,
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

  Widget renderDescription({
    double? size,
  }) {
    const double leftPadding = 12;

    return Padding(
      padding: const EdgeInsets.only(
        left: leftPadding,
      ).su(),
      child: AppText(
        widget.description,
        color: ColorGuidance.FONT_BLACK,
        size: size ?? 16,
      ),
    );
  }

  Widget renderSeeMoreButton() {
    return SvgPicture.asset(
      AssetPaths.CHEVRON_RIGHT_PATH,
    );
  }
}
