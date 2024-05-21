// ignore_for_file: depend_on_referenced_packages, unused_local_variable
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/service/theme_service.dart';

class HomeTabBar extends HookWidget with ThemeServiceProvider {
  final List<String> tabs;

  const HomeTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    useEffect(() {
      return () {};
    }, []);

    final double topPadding = 16.h;
    final tabDecoration = BoxDecoration(color: colorTheme.background);

    return Container(
      padding: EdgeInsets.only(top: topPadding),
      decoration: tabDecoration,
      child: Stack(
        children: [
          buildDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tabs
                .mapIndexed((index, label) => buildTab(label: label))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    final double dividerHeight = 1.3.h;
    final dividerDecoration = BoxDecoration(color: colorTheme.natural03);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: dividerHeight,
        decoration: dividerDecoration,
      ),
    );
  }

  Widget buildTab({required String label}) {
    final double undelineHeight = 3.h;

    final labelStyle =
        textStyleTheme.body3M.copyWith(color: colorTheme.primaryBlue);
    final underlineDecoration = BoxDecoration(color: colorTheme.natural04);

    return Container(
      color: colorTheme.primaryWhite,
      child: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: labelStyle,
            ),
            Container(
              height: undelineHeight,
              decoration: underlineDecoration,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTabBarDelegate extends SliverPersistentHeaderDelegate {
  final List<String> tabs;

  const HomeTabBarDelegate({required this.tabs});
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      HomeTabBar(tabs: tabs);

  @override
  double get maxExtent => 50.h;

  @override
  double get minExtent => 50.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
