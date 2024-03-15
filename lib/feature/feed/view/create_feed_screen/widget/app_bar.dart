import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/app_bar_event.dart';

class CustomAppBar extends StatefulWidget {
  final PageController pageController;
  final int totalPageLength;

  const CustomAppBar({
    super.key,
    required this.pageController,
    required this.totalPageLength,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with CustomAppBarEvent {
  @override
  void initState() {
    super.initState();
    pageListener();
  }

  @override
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 16;
    const double verticalPadding = 7;
    const double frameWidth = 390;
    const double frameHeight = 56;

    return SafeArea(
      
      child: PaddingBuilder()
          .withPadding(
            left: horizontalPadding,
            right: horizontalPadding,
            top: verticalPadding,
            bottom: verticalPadding,
          )
          .withChild(
            SizedBoxBuilder()
                .withSize(
                  width: frameWidth,
                  height: frameHeight,
                )
                .withChild(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      renderBackButton(),
                      renderCurrentStep(),
                    ],
                  ),
                ),
          ),
    );
  }

  Widget renderBackButton() {
    return GestureDetector(
      onTap: goPreStep,
      child: Container(
        color: ColorGuidance.PRIMARY_WITHE,
        child: SvgPicture.asset(
          AssetPaths.CHEVRON_LEFT_ICON_PATH,
        ),
      ),
    );
  }

  Widget renderCurrentStep() {
    const double frameWidth = 040;
    const double frameHeight = 24;

    final TextStyle stepStyle = TextStyleBuilder()
        .withColor(
          ColorGuidance.NATURAL_04,
        )
        .withFontSize(
          18,
        )
        .build();

    return SizedBoxBuilder()
        .withSize(
          width: frameWidth,
          height: frameHeight,
        )
        .withChild(
          Center(
            child: Text(
              "${currentPage + 1}/${widget.totalPageLength}",
              style: stepStyle,
            ),
          ),
        );
  }
}
