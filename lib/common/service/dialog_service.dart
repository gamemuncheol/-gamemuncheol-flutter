import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/di/locator.dart';

mixin DialogService {
  Future<void> show({required Widget content}) async {
    await showDialog(
      context: locator.navKey.context,
      builder: (context) {
        const double elevation = 0;

        return AlertDialog(
            alignment: Alignment.center,
            elevation: elevation,
            content: content);
      },
    );
  }
}
