import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/common/const/colors.dart';
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

  void cancle(BuildContext context) => context.pop(
        context,
      );

  @override
  Widget build(BuildContext context) {
    const double frameHeight = 90;

    return SizedBoxBuilder()
        .withSize(
          height: frameHeight,
        )
        .withChild(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  renderTitleAndDescription(
                    title: title,
                    description: description,
                  ),
                  renderPopButton(
                    cancle: () => cancle(
                      context,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
  }

  Widget renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    const double space1 = 6;

    final TextStyle titleStyle = TextStyleBuilder()
        .withFontSize(
          20,
        )
        .build();

    final TextStyle descriptionStyle = TextStyleBuilder()
        .withColor(
          ColorGuidance.FONT_GREY_03,
        )
        .withFontSize(
          16,
        )
        .build();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        const Gap(
          space1,
        ).withHeight(),
        Text(
          description,
          style: descriptionStyle,
        ),
      ],
    );
  }

  Widget renderPopButton({
    required VoidCallback cancle,
  }) {
    return GestureDetector(
      onTap: cancle,
      child: SvgPicture.asset(
        AssetPaths.CANCLE_ICON_PATH,
      ),
    );
  }
}
