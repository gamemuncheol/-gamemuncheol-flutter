import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double topMargin = 45;
    const double frameWidth = 390;
    const double frameHeight = 56;
    const double verticalPadding = 7;

    return ContainerBuilder()
        .withMargin(
          top: topMargin,
        )
        .withPadding(
          top: verticalPadding,
          bottom: verticalPadding,
        )
        .withSize(
          width: frameWidth,
          height: frameHeight,
        )
        .withChild(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              renderWidget1(),
              renderWidget2(),
              renderCurrentStep(),
            ],
          ),
        );
  }

  Widget renderWidget1() {
    return SizedBoxBuilder()
        .withSize(
          width: 28,
          height: 28,
        )
        .build();
  }

  Widget renderWidget2() {
    return SizedBoxBuilder()
        .withSize(
          width: 282,
          height: 24,
        )
        .build();
  }

  Widget renderCurrentStep() {
    const double frameWidth = 40;
    const double frameHeight = 24;

    return SizedBoxBuilder()
        .withSize(
          width: frameWidth,
          height: frameHeight,
        )
        .withChild(
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
        );
  }
}
