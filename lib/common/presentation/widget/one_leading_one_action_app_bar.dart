import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';

import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';

class OneLeadingOneActionAppBar extends StatelessWidget {
  final Widget leading;
  final Widget action;
  final String? title;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onActionsTap;

  const OneLeadingOneActionAppBar({
    super.key,
    required this.leading,
    this.title,
    required this.action,
    this.onLeadingTap,
    this.onActionsTap,
  });

  @override
  Widget build(BuildContext context) {
    const double verticalPadding = 7;
    const double frameHeight = 56;

    final TextStyle titleStyle = context.textStyleTheme.body4R;

    return PaddingBuilder()
        .indexMethod()
        .setPadding(vertical: verticalPadding)
        .setChild(
          SizedBoxBuilder().setHeigh(frameHeight).setChild(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(onTap: onLeadingTap, child: leading),
                    if (title != null) Text(title!, style: titleStyle),
                    GestureDetector(onTap: onActionsTap, child: action),
                  ],
                ),
              ),
        );
  }
}
