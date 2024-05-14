import 'package:flutter/material.dart';

class OAuthWebviewScreenLayout extends StatelessWidget {
  final Widget indicator;

  const OAuthWebviewScreenLayout({super.key, required this.indicator});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: indicator,
    );
  }
}
