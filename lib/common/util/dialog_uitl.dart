import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/widget/app_dialog.dart';

class DialogUtil {
  static show(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onSignleButtonTap,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          alignment: Alignment.center,
          content: AppDialog.singleButton(
            title: title,
            description: description,
            onSignleButtonTap: onSignleButtonTap,
          ),
        );
      },
    );
  }
}
