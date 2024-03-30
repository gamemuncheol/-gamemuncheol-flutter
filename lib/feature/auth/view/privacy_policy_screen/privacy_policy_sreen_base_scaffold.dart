import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';

abstract class PrivacyPolicyScreenBaseScaffold extends StatelessWidget {
  final Widget nextButton;

  const PrivacyPolicyScreenBaseScaffold({
    required this.nextButton,
    super.key,
  });

  Widget renderScaffold();

  @override
  Widget build(BuildContext context) {
    const double topPadding = 30;
    const double horizontalPadding = 36;

    return Column(
      children: [
        Expanded(
          child: PaddingBuilder()
              .withPadding(
                top: topPadding,
                horizontal: horizontalPadding,
              )
              .withChild(renderScaffold()),
        ),
        SafeArea(top: false, child: nextButton),
      ],
    );
  }
}
