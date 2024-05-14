import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/presentation/widget/app_dialog.dart';

mixin DialogService {
  Future<void> showSingleButtonDialog(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onSignleButtonTap,
  }) async {
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
