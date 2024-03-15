// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/view/home/mixin/tab_bar_event.dart';

class CustomTabBar extends StatefulWidget {
  final PageController pageController;
  final List<String> tabs;

  const CustomTabBar({
    super.key,
    required this.pageController,
    required this.tabs,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with CustomTabBarEvent {
  @override
  void initState() {
    super.initState();
    listenPageChanged();
  }

  @override
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const double leftPadding = 16;
    const double rightPadding = 16;
    const double topPadding = 16;

    const BoxDecoration boxDecoration = BoxDecoration(
      color: ColorGuidance.PRIMARY_WITHE,
    );

    return ContainerBuilder()
        .withPadding(
          left: leftPadding,
          right: rightPadding,
          top: topPadding,
        )
        .withBoxDecoration(
          boxDecoration,
        )
        .withChild(
          Stack(
            children: [
              renderDivider(),
              PaddingBuilder()
                  .withPadding(
                    left: leftPadding,
                    right: rightPadding,
                  )
                  .withChild(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: widget.tabs
                          .mapIndexed(
                            (index, tabName) => renderTab(
                              index: index,
                              tabName: tabName,
                            ),
                          )
                          .toList(),
                    ),
                  ),
            ],
          ),
        );
  }

  Widget renderDivider() {
    const double dividerHeight = 1.3;
    const BoxDecoration dividerDecoration = BoxDecoration(
      color: ColorGuidance.NATURAL_03,
    );

    return Align(
      alignment: Alignment.bottomCenter,
      child: ContainerBuilder()
          .withSize(
            height: dividerHeight,
          )
          .withBoxDecoration(
            dividerDecoration,
          )
          .build(),
    );
  }

  Widget renderTab({
    required int index,
    required String tabName,
  }) {
    const double selectedTabUnderlineHeight = 3;
    const double unSelectedTabUnderlineHeight = 1;

    final bool isSelected = currentIndex == index;

    TextStyle tabTextStyle = TextStyleBuilder()
        .withColor(
          isSelected ? ColorGuidance.PRIMARY_BLUE : ColorGuidance.NATURAL_04,
        )
        .withFontSize(18)
        .withMedium()
        .build();

    BoxDecoration underlineDecoration = BoxDecoration(
      color: isSelected ? ColorGuidance.PRIMARY_BLUE : ColorGuidance.NATURAL_03,
    );

    return GestureDetector(
      onTap: () => jump(
        index: index,
      ),
      child: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tabName,
              style: tabTextStyle,
            ),
            ContainerBuilder()
                .withSize(
                  height: isSelected
                      ? selectedTabUnderlineHeight
                      : unSelectedTabUnderlineHeight,
                )
                .withBoxDecoration(
                  underlineDecoration,
                )
                .build(),
          ],
        ),
      ),
    );
  }
}

class HomeTabBarDelegate extends SliverPersistentHeaderDelegate {
  final PageController pageController;
  final List<String> tabs;

  HomeTabBarDelegate({
    required this.pageController,
    required this.tabs,
  });

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      CustomTabBar(
        pageController: pageController,
        tabs: tabs,
      );

  @override
  double get maxExtent => 50.h;

  @override
  double get minExtent => 50.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
