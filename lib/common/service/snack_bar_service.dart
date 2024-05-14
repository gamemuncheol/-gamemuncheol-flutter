import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';

class SnackBarUtil {
  SnackBarUtil._();
  
  static snackBar(
    BuildContext context, {
    required String text,
  }) async {
    TextStyle snackBarStyle = TextStyleBuilder()
        .withColor(AppColor.primaryWhite)
        .withMedium()
        .build();

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: AppColor.primaryBlue,
        behavior: SnackBarBehavior.fixed,
        duration: const Duration(
          milliseconds: 2000,
        ),
        content: Center(
          child: Text(
            text,
            style: snackBarStyle,
          ),
        ),
      ),
    );
  }
}
