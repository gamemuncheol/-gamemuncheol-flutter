import 'package:flutter/widgets.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';

class SocialAuthScreenScaffold extends StatelessWidget {
  final Widget backgroundVideo;

  final Widget mainObject;

  final Widget socialLoginButton;

  const SocialAuthScreenScaffold({
    super.key,
    required this.backgroundVideo,
    required this.mainObject,
    required this.socialLoginButton,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Stack(
        fit: StackFit.expand,
        children: [
          backgroundVideo,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mainObject,
              socialLoginButton,
            ],
          )
        ],
      ),
    );
  }
}
