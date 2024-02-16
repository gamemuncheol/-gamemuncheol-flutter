import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/widget/app_text.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';

class DocsHeader extends StatelessWidget {
  // 제목
  final String title;

  // 설명
  final String description;

  const DocsHeader({
    super.key,
    required this.title,
    required this.description,
  });

  final double frameHeight = 90;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: frameHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              renderTitleAndDescription(),
              renderPopButton(
                context,
              ),
            ],
          ),
        ],
      ),
    ).su();
  }

  Widget renderTitleAndDescription() {
    const double space1 = 6;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          color: ColorGuidance.FONT_BLACK,
          size: 20,
          weight: FontWeight.w700,
          letterSpacing: -0.50,
        ),
        const SizedBox(
          height: space1,
        ).su(),
        const AppText(
          "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.",
          color: ColorGuidance.FONT_GREY,
          size: 16,
          weight: FontWeight.w300,
        ),
      ],
    );
  }

  Widget renderPopButton(BuildContext context) {
    void cancle(BuildContext context) => context.pop(
          context,
        );

    return GestureDetector(
      onTap: () => cancle(
        context,
      ),
      child: SvgPicture.asset(
        AssetPaths.CANCLE_ICON_PATH,
      ),
    );
  }
}
