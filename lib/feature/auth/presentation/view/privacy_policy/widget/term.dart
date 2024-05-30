import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/assets.dart';

class Term extends HookConsumerWidget with ThemeProvider {
  final bool isUnNeccesary;
  final String description;

  final void Function(
    WidgetRef ref, {
    required bool isUnNeccesary,
    required ValueNotifier<bool> isAccepted,
  }) accept;

  final void Function(
    WidgetRef ref, {
    required bool isUnNeccesary,
    required ValueNotifier<bool> isAccepted,
  }) reject;

  final void Function(
    WidgetRef ref, {
    required ValueNotifier<bool> isAccepted,
  }) listenGlobalEvent;

  Term({
    super.key,
    this.isUnNeccesary = false,
    required this.description,
    required this.accept,
    required this.reject,
    required this.listenGlobalEvent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> isAccepted = useState(false);
    listenGlobalEvent(ref, isAccepted: isAccepted);

    return Container(
      color: colorTheme.background,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (isAccepted.value) {
                  reject(
                    ref,
                    isAccepted: isAccepted,
                    isUnNeccesary: isUnNeccesary,
                  );
                } else {
                  accept(
                    ref,
                    isAccepted: isAccepted,
                    isUnNeccesary: isUnNeccesary,
                  );
                }
              },
              child: Row(
                children: [
                  buildCheckBox(isAccepted: isAccepted),
                  Expanded(
                    child: buildDescription(),
                  ),
                ],
              ),
            ),
          ),
          buildSeeMoreButton(),
        ],
      ),
    );
  }

  Widget buildCheckBox({required ValueNotifier<bool> isAccepted}) {
    return SvgPicture.asset(
      isAccepted.value
          ? AppAsset.CHECKBOX_FILLED
          : AppAsset.CHECKBOX_BLANK,
    );
  }

  Widget buildDescription() {
    final TextStyle descriptionStyle =
        textStyleTheme.body4R.copyWith(color: colorTheme.primaryBlack);

    return Row(
      children: [
        Gap(12.h),
        Expanded(
          child: Text(
            description,
            style: descriptionStyle,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Widget buildSeeMoreButton() => SvgPicture.asset(AppAsset.CHEVRON_RIGHT_BLACK);
}
