import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/presentation/component/loading_indicator.dart';
import 'package:gamemuncheol/common/presentation/component/square_button.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';
import 'package:gamemuncheol/feature/member/presentation/provider/member_provider.dart';

class SheetNextButton extends ConsumerWidget with ThemeProvider {
  final VoidCallback onTap;
  const SheetNextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonDecoration = BoxDecoration(color: colorTheme.primaryBlue);
    final labelStyle =
        textStyleTheme.body3R.copyWith(color: colorTheme.primaryWhite);

    final bState = ref.watch(memberNotifierProvider);

    return Align(
      alignment: Alignment.bottomCenter,
      child: SquareButton(
        labelStyle: labelStyle,
        buttonDecoration: buttonDecoration,
        onTap: bState.isLoading ? () {} : onTap,
        child: Center(
          child: bState.whenBState(
            loading: () {
              return LoadingIndicator(
                color: colorTheme.primaryWhite,
              );
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
