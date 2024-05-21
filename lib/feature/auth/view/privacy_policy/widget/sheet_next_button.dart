import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gamemuncheol/common/presentation/widget/loading_indicator.dart';
import 'package:gamemuncheol/common/presentation/widget/square_button.dart';
import 'package:gamemuncheol/feature/user/provider/user_provider.dart';

class SheetNextButton extends ConsumerWidget with ThemeServiceProvider {
  final VoidCallback onTap;
  const SheetNextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonDecoration = BoxDecoration(color: colorTheme.primaryBlue);
    final labelStyle =
        textStyleTheme.body3R.copyWith(color: colorTheme.onPrimaryBlue);

    final bState = ref.watch(userNotifierProvider);

    return Align(
      alignment: Alignment.bottomCenter,
      child: SquareButton(
        labelStyle: labelStyle,
        buttonDecoration: buttonDecoration,
        onTap: bState.isLoading ? () {} : onTap,
        child: Center(
          child: bState.whenBState(
            loading: () {
              return LoadingIndicator(color: colorTheme.primaryWhite);
            },
            orElse: () {
              return Text(
                "다음",
                style: labelStyle,
              );
            },
          ),
        ),
      ),
    );
  }
}
