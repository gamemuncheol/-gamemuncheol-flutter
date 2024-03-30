import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/layout/default_layout.dart';

class OAuthWebviewScreenScaffold extends StatelessWidget {
  const OAuthWebviewScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
