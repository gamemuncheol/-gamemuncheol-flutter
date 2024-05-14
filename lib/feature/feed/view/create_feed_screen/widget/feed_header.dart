import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/gap.dart';

class FeedScreenHeader extends StatelessWidget {
  final String title;
  final String description;

  const FeedScreenHeader({
    super.key,
    required this.title,
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle(context),
        const Gap(16).setHeight(),
        buildDescription(context),
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    final TextStyle titleStyle = context.textStyleTheme.title1M;

    return Text(title, style: titleStyle);
  }

  Widget buildDescription(BuildContext context) {
    final TextStyle descriptionStyle = context.textStyleTheme.body4R
        .copyWith(color: context.colorTheme.natural06);

    return Text(description, style: descriptionStyle);
  }
}
