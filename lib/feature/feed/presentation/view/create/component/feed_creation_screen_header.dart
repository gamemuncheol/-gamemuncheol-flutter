import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/theme_util.dart';

class CreateFeedScreenHeader extends StatelessWidget with ThemeProvider {
  final String title;
  final String description;

  const CreateFeedScreenHeader({
    super.key,
    required this.title,
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = textStyleTheme.title1M;

    final descriptionStyle =
        textStyleTheme.body4R.copyWith(color: colorTheme.natural06);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Gap(16.h),
        Text(
          description,
          style: descriptionStyle,
        ),
      ],
    );
  }
}
