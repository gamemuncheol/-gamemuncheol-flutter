import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/gap.dart';

class CreateFeedScreenHeader extends StatelessWidget {
  final String title;
  final String description;

  const CreateFeedScreenHeader({
    super.key,
    required this.title,
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderTitle(title: title),
        const Gap(16).withHeight(),
        renderDescription(description: description),
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

  Widget renderDescription({
    required String description,
  }) {
    final TextStyle descriptionStyle = TextStyleBuilder()
        .withColor(AppColor.FONT_GREY_03)
        .withFontSize(16)
        .withRegular()
        .build();

    return Text(
      description,
      style: descriptionStyle,
    );
  }
}
