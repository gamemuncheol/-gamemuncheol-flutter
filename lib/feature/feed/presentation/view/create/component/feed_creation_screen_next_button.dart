import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/presentation/component/square_button.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';

class CreateFeedScreenNextButton extends StatelessWidget
    with ThemeProvider {
  final VoidCallback onTap;
  final bool? unable;
  final String? label;

  const CreateFeedScreenNextButton({
    super.key,
    required this.onTap,
    this.unable = false,
    this.label = "다음",
  });

  factory CreateFeedScreenNextButton.disAble() {
    return CreateFeedScreenNextButton(unable: true, onTap: () {});
  }

  @override
  Widget build(BuildContext context) {
    final BoxDecoration buttonDecoration = BoxDecoration(
        color: colorTheme.primaryBlue.withOpacity(unable! ? 0.5 : 1));

    return SquareButton.label(
      onTap: onTap,
      label: label!,
      buttonDecoration: buttonDecoration,
    );
  }
}
