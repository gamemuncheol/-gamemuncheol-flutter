import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_container.dart';

class PreviewButton extends StatelessWidget {
  final VoidCallback onTap;
  const PreviewButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const double frameHeight = 50;
    final BoxDecoration buttonDeco =
        BoxDecoration(color: context.colorTheme.transParent);

    final TextStyle textStyle = context.textStyleTheme.body3M
        .copyWith(color: context.colorTheme.primaryWhite);

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onTap,
        child: ContainerBuilder()
            .setHeigh(frameHeight)
            .setBoxDecoration(buttonDeco)
            .setChild(Center(child: Text("미리보기", style: textStyle))),
      ),
    );
  }
}
