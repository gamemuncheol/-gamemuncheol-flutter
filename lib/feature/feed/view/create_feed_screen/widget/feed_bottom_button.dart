import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/presentation/widget/square_button.dart';

class FeedBottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool? unable;

  const FeedBottomButton({
    super.key,
    required this.onTap,
    this.unable = false,
  });

  factory FeedBottomButton.disAble() {
    return FeedBottomButton(unable: true, onTap: () {});
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = context.textStyleTheme.body2M
        .copyWith(color: context.colorTheme.onPrimaryBlue);

    final BoxDecoration buttonDecoration = BoxDecoration(
        color: context.colorTheme.primaryBlue.withOpacity(unable! ? 0.5 : 1));

    return SquareButton(
      onTap: onTap,
      label: "다음",
      labelStyle: labelStyle,
      buttonDecoration: buttonDecoration,
    );
  }
}
