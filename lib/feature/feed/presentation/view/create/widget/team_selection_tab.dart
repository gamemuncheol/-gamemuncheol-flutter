import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gap/gap.dart';

class TeamSelectionTab extends StatelessWidget with ThemeServiceProvider {
  final VoidCallback onTap;
  final bool selected;
  final String label;

  const TeamSelectionTab({
    super.key,
    required this.onTap,
    required this.selected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final frameDeco = BoxDecoration(color: colorTheme.background);

    final selectedUnderlineDeco = BoxDecoration(color: colorTheme.primaryBlue);
    final unSelctedunderlineDeco = BoxDecoration(color: colorTheme.natural03);

    final selectedLabelStyle =
        textStyleTheme.body2M.copyWith(color: colorTheme.primaryBlue);
    final unSelectedLabelStyle =
        selectedLabelStyle.copyWith(color: colorTheme.natural05);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: frameDeco,
          child: Column(
            children: [
              Text(
                label,
                style: selected ? selectedLabelStyle : unSelectedLabelStyle,
                textAlign: TextAlign.center,
              ),
              Gap(8.h),
              Container(
                height: selected ? 3 : 1,
                decoration:
                    selected ? selectedUnderlineDeco : unSelctedunderlineDeco,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
