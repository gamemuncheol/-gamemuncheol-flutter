// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/feature/user/view/rigister_nickname_screen/widget/app_bar.dart';
import 'package:gamemuncheol/feature/user/view/rigister_nickname_screen/register_nickname_screen_scaffold.dart';

class RegisterNickNameScreen extends HookConsumerWidget {
  const RegisterNickNameScreen({
    super.key,
  });

  static const String PATH = "/register_nickname_screen";
  static const String ROUTE_NAME = "RegisterNickNameScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController textEditingController =
        useTextEditingController();

    return RegisterNicknameScreenScaffold(
      registerStatusBar: renderAppBar(),
      title: renderTitle(),
      textField: renderTextField(
        textEditingController: textEditingController,
      ),
      errorText: renderErrorText(),
      nextButton: renderNextButton(),
    );
  }

  Widget renderAppBar() => const CustomAppBar();

  Widget renderNextButton() => const _NextButton();

  Widget renderTitle() {
    const double space1 = 30;
    TextStyle titleStyle =
        TextStyleBuilder().withFontSize(26).withBold().build();

    return Column(
      children: [
        const Gap(space1).withHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "롤문철에서 사용하실 닉네\n임을 입력해 주세요.",
              style: titleStyle,
            )
          ],
        ),
      ],
    );
  }

  Widget renderTextField({
    required TextEditingController textEditingController,
  }) {
    const double topPadding = 120;
    const double frameHeight = 38;

    const UnderlineInputBorder textFieldDefaultBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: ColorGuidance.NATURAL_03,
      ),
    );

    TextStyle hintStyle = TextStyleBuilder()
        .withColor(ColorGuidance.NATURAL_04)
        .withMedium()
        .build();

    return PaddingBuilder()
        .withPadding(
          top: topPadding,
        )
        .withChild(
          SizedBoxBuilder()
              .withSize(
                height: frameHeight,
              )
              .withChild(
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "닉네임을 입력해주세요.",
                    hintStyle: hintStyle,
                    focusedBorder: textFieldDefaultBorder,
                    errorBorder: textFieldDefaultBorder,
                    enabledBorder: textFieldDefaultBorder,
                  ),
                ),
              ),
        );
  }

  Widget renderErrorText() {
    const double topPadding = 16;

    TextStyle hintStyle = TextStyleBuilder()
        .withColor(ColorGuidance.ERROR_RED)
        .withFontSize(14)
        .withRegular()
        .build();

    return Column(
      children: [
        const Gap(topPadding).withHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "이미 등록된 아이디(이메일)입니다.",
              style: hintStyle,
            ),
          ],
        ),
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 64;

    final TextStyle buttonTextStyle = TextStyleBuilder()
        .withColor(ColorGuidance.PRIMARY_WITHE)
        .withRegular()
        .build();

    const BoxDecoration buttoneDecoration = BoxDecoration(
      color: ColorGuidance.PRIMARY_BLUE,
    );

    return SafeArea(
      child: GestureDetector(
        onTap: () {},
        child: ContainerBuilder()
            .withSize(
              height: buttonHeight,
            )
            .withBoxDecoration(
              buttoneDecoration,
            )
            .withChild(
              Center(
                child: Text(
                  "다음",
                  style: buttonTextStyle,
                ),
              ),
            ),
      ),
    );
  }
}
