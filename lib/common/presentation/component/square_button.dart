import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/util/theme_util.dart';

class SquareButton extends StatelessWidget with ThemeProvider {
  final VoidCallback onTap;
  final String? label;
  final TextStyle? labelStyle;
  final BoxDecoration? buttonDecoration;
  final Widget? child;

  const SquareButton({
    super.key,
    required this.onTap,
    this.buttonDecoration,
    this.label,
    this.labelStyle,
    this.child,
  });

  factory SquareButton.label({
    required VoidCallback onTap,
    required String label,
    TextStyle? labelStyle,
    BoxDecoration? buttonDecoration,
  }) {
    return SquareButton(
      onTap: onTap,
      label: label,
      labelStyle: labelStyle,
      buttonDecoration: buttonDecoration,
    );
  }

  factory SquareButton.child({
    required VoidCallback onTap,
    BoxDecoration? buttonDecoration,
    required Widget child,
  }) {
    return SquareButton(
      onTap: onTap,
      buttonDecoration: buttonDecoration,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonHeight = 60.h;

    final defaultLabelStyle =
        textStyleTheme.body2M.copyWith(color: colorTheme.onPrimaryBlue);

    final defaultDecoration = BoxDecoration(color: colorTheme.primaryBlue);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        decoration: buttonDecoration ?? defaultDecoration,
        child: Center(
          child: child ??
              Text(
                label!,
                style: labelStyle ?? defaultLabelStyle,
              ),
        ),
      ),
    );
  }
}
