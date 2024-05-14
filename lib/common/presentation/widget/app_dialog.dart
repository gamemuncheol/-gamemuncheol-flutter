import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/util/app_container.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String description;
  final bool useSingleButton;
  final VoidCallback onSignleButtonTap;

  const AppDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onSignleButtonTap,
    this.useSingleButton = true,
  });

  factory AppDialog.singleButton({
    required String title,
    required String description,
    required VoidCallback onSignleButtonTap,
  }) {
    return AppDialog(
      title: title,
      description: description,
      onSignleButtonTap: onSignleButtonTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    const double frameWidth = 262;
    const double frameHeight = 330;
    const BoxDecoration frameDeoration =
        BoxDecoration(color: Colors.transparent);

    const double dialogHeight = 280;
    final BoxDecoration dialogDeoration = BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: context.colorTheme.natural02);

    const double imageHeight = 130;

    return Stack(
      children: [
        ContainerBuilder()
            .setWidth(frameWidth)
            .setHeigh(frameHeight)
            .setBoxDecoration(frameDeoration)
            .build(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(30).setHeight(),
            ContainerBuilder()
                .setHeigh(dialogHeight)
                .setBoxDecoration(dialogDeoration)
                .setChild(renderContent(context)),
          ],
        ),
        ContainerBuilder()
            .setWidth(frameWidth)
            .setHeigh(imageHeight)
            .setChild(Image.asset(AppAsset.DIALOG_ICON)),
      ],
    );
  }

  Widget renderContent(BuildContext context) {
    final TextStyle titleStyle = context.textStyleTheme.title4B;
    final TextStyle descriptionStyle = context.textStyleTheme.body5R
        .copyWith(color: context.colorTheme.natural06);

    return Column(
      children: [
        const Expanded(child: SizedBox()),
        Text(
          title,
          style: titleStyle,
          textAlign: TextAlign.center,
        ),
        const Gap(18).setHeight(),
        Text(
          description,
          style: descriptionStyle,
          textAlign: TextAlign.center,
        ),
        const Gap(22).setHeight(),
        buildSingleButton(context),
        const Gap(26).setHeight(),
      ],
    );
  }

  Widget buildSingleButton(BuildContext context) {
    const double buttonWidth = 230;
    const double buttonHeight = 44;

    const double buttonMargin = 32;

    final TextStyle labelStyle = context.textStyleTheme.body4M
        .copyWith(color: context.colorTheme.onPrimaryBlue);

    final BoxDecoration dialogDeoration = BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      color: context.colorTheme.primaryBlue,
    );
    return GestureDetector(
      onTap: onSignleButtonTap,
      child: ContainerBuilder()
          .setMargin(horizontal: buttonMargin)
          .setWidth(buttonWidth)
          .setHeigh(buttonHeight)
          .setBoxDecoration(dialogDeoration)
          .setChild(Center(child: Text("확인", style: labelStyle))),
    );
  }
}
