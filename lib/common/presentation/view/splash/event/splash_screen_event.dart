import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/common/presentation/view/home/home_screen.dart';

mixin SplashScreenEvent {
  void pushHome() {
    locator.navKey.context.pushReplacement(HomeScreen.PATH);
  }
}
