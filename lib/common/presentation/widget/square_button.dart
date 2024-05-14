import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';

import 'package:gamemuncheol/common/util/app_container.dart';

class SquareButton extends StatelessWidget with ThemeServiceProvider {
  final String? label;
  final TextStyle labelStyle;
  final BoxDecoration buttonDecoration;
  final VoidCallback onTap;
  final double buttonHeight;
  final Widget? child;

  const SquareButton({
    super.key,
    this.label,
    required this.labelStyle,
    required this.buttonDecoration,
    required this.onTap,
    this.buttonHeight = 64,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: GestureDetector(
        onTap: onTap,
        child: ContainerBuilder()
            .setHeigh(buttonHeight)
            .setBoxDecoration(buttonDecoration)
            .setChild(
              Center(
                child: child ?? Text(label!, style: labelStyle),
              ),
            ),
      ),
    );
  }
}
