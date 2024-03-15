import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';

class Header extends StatelessWidget {
  // 제목
  final String title;

  // 설명
  final String description;

  const Header({
    super.key,
    required this.title,
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderSpace1(),
        renderTitle(
          title: title,
        ),
        renderSpace2(),
        renderDescription(
          description: description,
        ),
      ],
    );
  }

  Widget renderTitle({
    required String title,
  }) {
    final TextStyle titleStyle =
        TextStyleBuilder().withFontSize(26).withMedium().build();

    return Text(
      title,
      style: titleStyle,
    );
  }

  Widget renderSpace1() {
    const double space1 = 16;

    return const Gap(space1).withHeight();
  }

  Widget renderDescription({
    required String description,
  }) {
    final TextStyle descriptionStyle = TextStyleBuilder()
        .withColor(ColorGuidance.FONT_GREY_03)
        .withFontSize(16)
        .withRegular()
        .build();

    return Text(
      description,
      style: descriptionStyle,
    );
  }

  Widget renderSpace2() {
    const double space1 = 16;

    return const Gap(space1).withHeight();
  }
}
