import 'package:flutter/widgets.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';

class SocialAuthScreenScaffold extends StatelessWidget {
  // 배경 동영상
  final Widget backgroundVideo;

  // 롤문철 로고
  final Widget lolMunCheolLogo;

  // 소셜 로그인 버튼
  final Widget socialLoginButton;

  const SocialAuthScreenScaffold({
    super.key,
    required this.backgroundVideo,
    required this.lolMunCheolLogo,
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
              lolMunCheolLogo,
              socialLoginButton,
            ],
          )
        ],
      ),
    );
  }
}
