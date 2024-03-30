import 'package:flutter/services.dart';

mixin SystemUtil {
  void portraitUp() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void resetSetting() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }
}
