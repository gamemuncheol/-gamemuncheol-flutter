import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';

class PrivacyPolicyHomeScaffold extends StatelessWidget {
  // 페이지들
  final Widget pages;

  // 다음 버튼
  final Widget nextButton;

  const PrivacyPolicyHomeScaffold({
    super.key,
    required this.pages,
    required this.nextButton,
  });

  @override
  Widget build(BuildContext context) {
    const double sheetHeight = 587;

    final BoxDecoration sheetDeco = BoxDecoration(
      color: ColorGuidance.PRIMARY_WITHE,
      borderRadius: BorderRadius.circular(
        10,
      ),
    );

    return ContainerBuilder()
        .withSize(
          height: sheetHeight,
        )
        .withBoxDecoration(
          sheetDeco,
        )
        .withChild(
          Stack(
            fit: StackFit.expand,
            children: [
              pages,
              nextButton,
            ],
          ),
        );
  }
}
