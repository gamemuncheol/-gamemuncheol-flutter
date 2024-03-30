import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:gamemuncheol/common/util/gap.dart';

class SocialAuthScreenScaffold extends StatelessWidget {
  final Widget backgroundVideo;
  final Widget logoWithPropaganda;
  final Widget socialLoginButtons;

  const SocialAuthScreenScaffold({
    super.key,
    required this.backgroundVideo,
    required this.logoWithPropaganda,
    required this.socialLoginButtons,
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
              const Gap(148).withHeight(),
              logoWithPropaganda,
              const Gap(148).withHeight(),
              socialLoginButtons,
              const Gap(74).withHeight(),
            ],
          )
        ],
      ),
    );
  }
}
