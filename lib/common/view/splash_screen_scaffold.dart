import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';

class SplashScreenScaffold extends StatelessWidget {
  const SplashScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      child: SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
