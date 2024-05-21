import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gamemuncheol/common/presentation/widget/loading_indicator.dart';

class BlurLayout<T extends StateMapper> extends StatelessWidget
    with ThemeServiceProvider {
  final Widget screen;
  final dynamic provider;

  const BlurLayout({
    super.key,
    required this.screen,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    const double sigmaX = 5.0;
    const double sigmaY = 5.0;

    final TextStyle loadingTextStyle = textStyleTheme.baseTextStyle;

    return Material(
      child: Stack(
        children: [
          screen,
          Consumer(
            builder: (context, ref, child) {
              final bState = (ref.watch(provider) as StateMapper);

              return bState.whenBState(
                orElse: () {
                  return const SizedBox();
                },
                loadingWithMessage: (message) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LoadingIndicator(),
                          if (message.isNotEmpty) Gap(18.h),
                          if (message.isNotEmpty)
                            Text(
                              message,
                              style: loadingTextStyle,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
