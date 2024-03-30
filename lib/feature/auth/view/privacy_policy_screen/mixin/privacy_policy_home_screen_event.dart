import 'package:flutter/material.dart';

import 'package:gamemuncheol/feature/user/view/change_nickname_screen/change_nickname_screen.dart';
import 'package:go_router/go_router.dart';

mixin PrivacyPolicyHomeScreenEvent {
  void nextPage({required PageController pageController}) {
    const int speed = 100;

    pageController.nextPage(
      duration: const Duration(milliseconds: speed),
      curve: Curves.easeIn,
    );
  }

  void goChangeNicknameScreen(BuildContext context) {
    context.go(ChangeNicknameScreen.PATH);
  }
}
