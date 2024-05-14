import 'package:flutter/services.dart';
import 'package:gamemuncheol/common/const/colors.dart';

mixin SystemUtil {
  void setDefaultSystemUiMode() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ],
    );
  }

  void setWhiteThemeSystemUiMode() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.transParent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColor.transParent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void portraitUp() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
