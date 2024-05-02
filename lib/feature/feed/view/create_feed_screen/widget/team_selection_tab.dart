import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/select_match_user_screen_event.dart';

class TeamSelectionTab extends StatelessWidget
    with SelectStakeHolderScreenEvent {
  final ValueNotifier<bool> inMyTeam;

  const TeamSelectionTab({
    super.key,
    required this.inMyTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildTab(
          context,
          onTap: () => selectTeam(inMyTeam: inMyTeam),
          selected: inMyTeam.value,
          label: "아군",
        ),
        buildTab(
          context,
          onTap: () => selectEnemy(inMyTeam: inMyTeam),
          selected: !inMyTeam.value,
          label: "적군",
        ),
      ],
    );
  }

  Widget buildTab(
    BuildContext context, {
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    const double selectedUnderlineHeight = 3;
    const double unSelectedUnderlineHeight = 1;

    final BoxDecoration frameDecoration =
        BoxDecoration(color: context.colorTheme.background);
    final BoxDecoration selectedUnderlineDecoration =
        frameDecoration.copyWith(color: context.colorTheme.primaryBlue);
    final BoxDecoration unSelctedunderlineDecoration =
        frameDecoration.copyWith(color: context.colorTheme.natural03);

    TextStyle selectedTextStyle = context.textStyleTheme.body2M
        .copyWith(color: context.colorTheme.primaryBlue);
    TextStyle unSelectedTextStyle =
        selectedTextStyle.copyWith(color: context.colorTheme.natural05);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: ContainerBuilder()
            .setBoxDecoration(
              frameDecoration,
            )
            .setChild(
              Column(
                children: [
                  buildLabel(
                    label: label,
                    labelStyle:
                        selected ? selectedTextStyle : unSelectedTextStyle,
                  ),
                  const Gap(8).setHeight(),
                  buildUnderLine(
                    height: selected
                        ? selectedUnderlineHeight
                        : unSelectedUnderlineHeight,
                    decoration: selected
                        ? selectedUnderlineDecoration
                        : unSelctedunderlineDecoration,
                  ),
                ],
              ),
            ),
      ),
    );
  }

  Widget buildLabel({required String label, required TextStyle labelStyle}) {
    return Text(label, style: labelStyle, textAlign: TextAlign.center);
  }

  Widget buildUnderLine({
    required double height,
    required BoxDecoration decoration,
  }) {
    return ContainerBuilder()
        .setHeigh(height)
        .setBoxDecoration(decoration)
        .build();
  }
}
