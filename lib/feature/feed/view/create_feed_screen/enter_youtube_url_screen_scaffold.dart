import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class EnterYoutubeUrlScreenScaffold extends StatelessWidget {
  const EnterYoutubeUrlScreenScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

abstract class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
  });

  Widget renderAppBar();
  Widget renderScaffold();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          renderAppBar(),
          renderScaffold(),
        ],
      ),
    );
  }
}

class ScaffoldScreen extends BaseScreen {
  final Widget appBar;
  final Widget something;

  const ScaffoldScreen({
    super.key,
    required this.appBar,
    required this.something,
  });

  @override
  renderAppBar() => appBar;

  @override
  Widget renderScaffold() {
    return Column(
      children: [
        something,
      ],
    );
  }
}
