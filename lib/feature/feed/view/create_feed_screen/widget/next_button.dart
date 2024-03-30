import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/util/app_container.dart';

class CreateFeedScreenNextButton extends ConsumerWidget {
  final String text;
  final TextStyle textStyle;
  final BoxDecoration buttonDecoration;
  final VoidCallback onTap;

  const CreateFeedScreenNextButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.buttonDecoration,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double buttonHeight = 64;

    return SafeArea(
      top: false,
      bottom: true,
      child: GestureDetector(
        onTap: onTap,
        child: ContainerBuilder()
            .withSize(
              height: buttonHeight,
            )
            .withBoxDecoration(
              buttonDecoration,
            )
            .withChild(
              Center(
                child: Text(
                  text,
                  style: textStyle,
                ),
              ),
            ),
      ),
    );
  }
}
