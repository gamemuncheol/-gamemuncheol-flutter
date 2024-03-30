import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/layout/default_layout.dart';

abstract class CreateFeedScreenScaffoldBase extends StatelessWidget {
  final Widget appBar;
  final Widget? nextButton;

  const CreateFeedScreenScaffoldBase({
    required this.appBar,
    this.nextButton,
    super.key,
  });

  Widget renderScaffold();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          appBar,
          Expanded(child: renderScaffold()),
          if (nextButton != null) nextButton!,
        ],
      ),
    );
  }
}
