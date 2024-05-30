import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/util/theme_util.dart';

class LoadingIndicator extends StatelessWidget with ThemeProvider {
  final Color? color;
  const LoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: color ?? colorTheme.primaryBlue);
  }
}
