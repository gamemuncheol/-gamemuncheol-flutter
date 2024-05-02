import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';

class OneLeadingOneActionAppBar extends StatelessWidget {
  final Widget leading;
  final Widget actions;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onActionsTap;

  const OneLeadingOneActionAppBar({
    super.key,
    required this.leading,
    required this.actions,
    this.onLeadingTap,
    this.onActionsTap,
  });

  @override
  Widget build(BuildContext context) {
    const double verticalPadding = 7;
    const double frameWidth = 390;
    const double frameHeight = 56;

    return PaddingBuilder()
        .setPadding(
          vertical: verticalPadding,
        )
        .setChild(
          SizedBoxBuilder()
              .withSize(width: frameWidth, height: frameHeight)
              .withChild(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(onTap: onLeadingTap, child: leading),
                    GestureDetector(onTap: onActionsTap, child: actions),
                  ],
                ),
              ),
        );
  }
}
