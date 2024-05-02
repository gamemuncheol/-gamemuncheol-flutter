import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';

abstract class CreateFeedScreenBase extends StatelessWidget {
  final Widget stepBar;
  final Widget? bottomButton;

  const CreateFeedScreenBase({
    required this.stepBar,
    this.bottomButton,
    super.key,
  });

  Widget renderScaffold();

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 32;

    return DefaultLayout(
      child: Column(
        children: [
          Expanded(
            child: PaddingBuilder()
                .setPadding(horizontal: horizontalPadding)
                .setChild(
                  Column(
                    children: [
                      SafeArea(top: true, bottom: false, child: stepBar),
                      Expanded(child: renderScaffold()),
                    ],
                  ),
                ),
          ),
          if (bottomButton != null)
            SafeArea(top: false, bottom: true, child: bottomButton!),
        ],
      ),
    );
  }
}
