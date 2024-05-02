import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/model/data_state.dart';

class BlurLayout<T extends StateWithLoadingText> extends StatelessWidget {
  final dynamic provider;
  final Widget child;

  const BlurLayout({
    super.key,
    required this.provider,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    const double sigmaX = 5.0;
    const double sigmaY = 5.0;

    final TextStyle loadingTextStyle = context.textStyleTheme.baseTextStyle;

    return Material(
      child: Stack(
        children: [
          child,
          Consumer(
            builder: (context, ref, child) {
              final bool isLoading = ref.watch(provider) is T;

              if (isLoading) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: context.colorTheme.primaryBlue,
                        ),
                        const Gap(16).setHeight(),
                        Text(
                          (ref.watch(provider) as T).loadingText ?? "",
                          style: loadingTextStyle,
                        ),
                      ],
                    ),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
