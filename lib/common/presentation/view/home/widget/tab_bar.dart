import 'package:flutter_hooks/flutter_hooks.dart';
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/presentation/view/home/mixin/home_screen_event.dart';

class HomeTabBar extends HookWidget with HomeScreenEvent {
  final PageController pageController;
  final List<String> tabs;

  const HomeTabBar({
    super.key,
    required this.pageController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    useEffect(() {
      listenPageChanged(
          pageController: pageController, currentIndex: currentIndex);
      return () {};
    }, []);

    final double topPadding = 16.h;
    const BoxDecoration boxDecoration =
        BoxDecoration(color: AppColor.primaryWhite);

    return ContainerBuilder()
        .setPadding(top: topPadding)
        .setBoxDecoration(boxDecoration)
        .setChild(
          Stack(
            children: [
              renderDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: tabs
                    .mapIndexed((index, tabName) => renderTab(
                          index: index,
                          tabName: tabName,
                          isSelected: currentIndex.value == index,
                          jumpTap: () {
                            jumpTab(
                              pageController: pageController,
                              index: index,
                            );
                          },
                        ))
                    .toList(),
              ),
              const Gap(16).setWidth(),
            ],
          ),
        );
  }

  Widget renderDivider() {
    const double dividerHeight = 1.3;
    const BoxDecoration dividerDecoration =
        BoxDecoration(color: AppColor.natural03);

    return Align(
      alignment: Alignment.bottomCenter,
      child: ContainerBuilder()
          .withSize(height: dividerHeight)
          .setBoxDecoration(dividerDecoration)
          .build(),
    );
  }

  Widget renderTab({
    required int index,
    required String tabName,
    required bool isSelected,
    required VoidCallback jumpTap,
  }) {
    final TextStyle tabTextStyle = TextStyleBuilder()
        .withColor(
          isSelected ? AppColor.primaryBlue : AppColor.natural04,
        )
        .withFontSize(18)
        .withMedium()
        .build();

    final double undelineHeight = isSelected ? 3 : 1;
    final BoxDecoration underlineDecoration = BoxDecoration(
      color: isSelected ? AppColor.primaryBlue : AppColor.natural03,
    );

    return GestureDetector(
      onTap: jumpTap,
      child: Container(
        color: AppColor.primaryWhite,
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tabName,
                style: tabTextStyle,
              ),
              ContainerBuilder()
                  .withSize(height: undelineHeight)
                  .setBoxDecoration(underlineDecoration)
                  .build(),
            ],
          ),
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
      HomeTabBar(
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
