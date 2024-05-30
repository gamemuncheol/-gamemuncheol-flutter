import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/di/locator.dart';

class ScaffoldService {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}

mixin SnackBarService {
  void showSnackBar({required Widget content}) {
    locator.scaffoldKey.currentState!
        .showSnackBar(_buildSnackBar(content: content));
  }

  SnackBar _buildSnackBar({required Widget content}) {
    const double elevation = 0;
    const Duration duration = Duration(milliseconds: 2000);

    return SnackBar(
      elevation: elevation,
      backgroundColor: AppColor.primaryBlue,
      behavior: SnackBarBehavior.fixed,
      duration: duration,
      content: Center(
        child: content,
      ),
    );
  }
}
