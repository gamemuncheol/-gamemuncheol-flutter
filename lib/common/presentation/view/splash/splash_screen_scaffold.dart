import 'package:flutter/material.dart';

class SplashScreenScaffold extends StatelessWidget {
  final Widget indicator;
  const SplashScreenScaffold({super.key, required this.indicator});

  @override
  Widget build(BuildContext context) {
    return Center(child: indicator);
  }
}
