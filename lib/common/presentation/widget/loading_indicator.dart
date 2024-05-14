import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/service/theme_service.dart';

class LoadingIndicator extends StatelessWidget with ThemeServiceProvider {
  final Color? color;
  const LoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: color ?? colorTheme.primaryBlue);
  }
}
