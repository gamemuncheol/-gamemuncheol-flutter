import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/layout/default_layout.dart';

class PrivacyPolicyHomeScreenScaffold extends StatelessWidget {
  final Widget pageView;

  const PrivacyPolicyHomeScreenScaffold({
    super.key,
    required this.pageView,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: pageView);
  }
}
