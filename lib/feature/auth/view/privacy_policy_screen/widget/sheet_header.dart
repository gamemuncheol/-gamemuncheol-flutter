import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';

class SheetHeader extends StatelessWidget with ThemeServiceProvider {
  final String title;
  final String description;

  const SheetHeader({
    super.key,
    required this.title,
    required this.description,
  });

  void popSheet() => locator.navKey.context.pop();

  @override
  Widget build(BuildContext context) {
    final double frameHeight = 90.h;

    return SizedBox(
      height: frameHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildContent(
                title: title,
                descriptioin: description,
              ),
              buildPopButton(popSheet: popSheet),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildContent({required String title, required String descriptioin}) {
    final TextStyle titleStyle = textStyleTheme.title4M;
    final TextStyle descriptionStyle =
        textStyleTheme.body4R.copyWith(color: colorTheme.natural06);
        
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Gap(12.h),
        Text(
          description,
          style: descriptionStyle,
        ),
      ],
    );
  }

  Widget buildPopButton({required VoidCallback popSheet}) {
    return GestureDetector(
      onTap: popSheet,
      child: SvgPicture.asset(
        AppAsset.closeBlack,
      ),
    );
  }
}
