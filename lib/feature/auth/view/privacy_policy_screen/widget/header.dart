import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';

class DocsHeader extends StatelessWidget {
  final String title;
  final String description;

  const DocsHeader({
    super.key,
    required this.title,
    required this.description,
  });

  void cancel(BuildContext context) => context.pop();

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
                  renderTitleAndDescription(),
                  renderPopButton(cancle: () => cancel(context)),
                ],
              ),
            ],
          ),
        );
  }

  Widget renderTitleAndDescription() {
    final TextStyle titleStyle =
        TextStyleBuilder().withFontSize(20).withMedium().build();

    final TextStyle descriptionStyle = TextStyleBuilder()
        .withColor(AppColor.FONT_GREY_03)
        .withFontSize(16)
        .build();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        const Gap(12).setHeight(),
        Text(
          description,
          style: descriptionStyle,
        ),
      ],
    );
  }

  Widget renderPopButton({required VoidCallback cancle}) {
    return GestureDetector(
      onTap: cancle,
      child: SvgPicture.asset(AppAsset.CANCLE_ICON_PATH),
    );
  }
}
