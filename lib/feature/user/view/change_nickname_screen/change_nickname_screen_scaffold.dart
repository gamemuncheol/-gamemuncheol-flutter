import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/layout/blur_layout.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/user/provider/change_nickname_provider.dart';
import 'package:gap/gap.dart';

class ChangeNicknameScreenScaffold extends StatelessWidget {
  final Widget title;
  final Widget textField;
  final Widget errorText;
  final Widget nextButton;

  const ChangeNicknameScreenScaffold({
    super.key,
    required this.title,
    required this.textField,
    required this.errorText,
    required this.nextButton,
  });

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 32;

    return BlurLayout<Loading>(
      provider: changeNicknamNotifierProvider,
      child: DefaultLayout(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PaddingBuilder()
                .withPadding(horizontal: horizontalPadding)
                .withChild(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SafeArea(bottom: false, child: SizedBox()),
                      const Gap(56).withHeight(),
                      title,
                      const Gap(120).withHeight(),
                      textField,
                      const Gap(16).withHeight(),
                      errorText,
                    ],
                  ),
                ),
            SafeArea(top: false, child: nextButton),
          ],
        ),
      ),
    );
  }
}
