import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/gap.dart';

class TeamSelectionTab extends StatelessWidget {
  final ValueNotifier<bool> inMyTeam;
  final Function({required ValueNotifier<bool> inMyTeam}) selectInTeam;
  final Function({required ValueNotifier<bool> inMyTeam}) selectInEnemy;

  const TeamSelectionTab({
    super.key,
    required this.inMyTeam,
    required this.selectInTeam,
    required this.selectInEnemy,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildTab(
          onTap: () => selectInTeam(inMyTeam: inMyTeam),
          selected: inMyTeam.value,
          label: "아군",
        ),
        buildTab(
          onTap: () => selectInEnemy(inMyTeam: inMyTeam),
          selected: !inMyTeam.value,
          label: "적군",
        ),
      ],
    );
  }

  Widget buildTab({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Builder(
      builder: (context) {
        final BoxDecoration frameDecoration =
            BoxDecoration(color: context.colorTheme.background);

        // 선택 탭 밑줄
        final BoxDecoration selectedUnderlineDecoration =
            frameDecoration.copyWith(color: context.colorTheme.primaryBlue);

        // 미선택 탭 밑줄
        final BoxDecoration unSelctedunderlineDecoration =
            frameDecoration.copyWith(color: context.colorTheme.natural03);

        // 선택 라벨 스타일
        TextStyle selectedTextStyle = context.textStyleTheme.body2M
            .copyWith(color: context.colorTheme.primaryBlue);

        // 미선택 라벨 스타일
        TextStyle unSelectedTextStyle =
            selectedTextStyle.copyWith(color: context.colorTheme.natural05);

        return Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: ContainerBuilder()
                .setBoxDecoration(frameDecoration)
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
                        height: selected ? 3 : 1,
                        decoration: selected
                            ? selectedUnderlineDecoration
                            : unSelctedunderlineDecoration,
                      ),
                    ],
                  ),
                ),
          ),
        );
      },
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
