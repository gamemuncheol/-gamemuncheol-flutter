import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;

  const DefaultLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colorTheme.background,
      body: child,
    );
  }
}
