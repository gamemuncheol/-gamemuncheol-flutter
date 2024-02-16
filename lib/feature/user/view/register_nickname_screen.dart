// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/common/widget/app_text.dart';

class RegisterNickNameScreen extends HookConsumerWidget {
  const RegisterNickNameScreen({
    super.key,
  });

  static const String PATH = "/register_nickname_screen";
  static const String ROUTE_NAME = "RegisterNickNameScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.sizeOf(context);

    const double contentPadding = 16;

    return DefaultLayout(
      child: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: contentPadding,
                ).su(),
                child: Column(
                  children: [
                    renderTopBar(),
                    renderTitle(),
                    renderTextField(),
                    renderErrorText(),
                  ],
                ),
              ),
              renderNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderTopBar() => const _TopBar();

  Widget renderNextButton() {
    const double buttonHeight = 64;

    const double bottomPadding = 34;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: bottomPadding,
      ).su(),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(
            color: ColorGuidance.PRIMARY_BLUE,
          ),
          child: const Center(
            child: AppText(
              "다음",
              color: ColorGuidance.PRIMARY_WITHE,
              size: 16,
              weight: FontWeight.w500,
            ),
          ),
        ).su(
          height: buttonHeight,
        ),
      ),
    );
  }

  Widget renderTitle() {
    const double titleTopPadding = 30;

    return Column(
      children: [
        const SizedBox(
          height: titleTopPadding,
        ).su(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              "롤문철에서 사용하실 닉네\n임을 입력해 주세요.",
              color: ColorGuidance.FONT_BLACK,
              size: 26,
              weight: FontWeight.w900,
            )
          ],
        ),
      ],
    );
  }

  Widget renderTextField() {
    const double topPadding = 120;
    const double frameHeight = 38;

    const UnderlineInputBorder textFieldDefaultBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: ColorGuidance.NATURAL_03,
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(
        top: topPadding,
      ).su(),
      child: const SizedBox(
        height: frameHeight,
        child: TextField(
          decoration: InputDecoration(
            hintText: "닉네임을 입력해주세요.",
            hintStyle: TextStyle(
              color: ColorGuidance.NATURAL_04,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            focusedBorder: textFieldDefaultBorder,
            errorBorder: textFieldDefaultBorder,
            enabledBorder: textFieldDefaultBorder,
          ),
        ),
      ).su(),
    );
  }

  Widget renderErrorText() {
    const double topPadding = 16;

    return Column(
      children: [
        const SizedBox(
          height: topPadding,
        ).su(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              "이미 등록된 아이디(이메일)입니다.",
              color: ColorGuidance.ERROR_RED,
              size: 14,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    const double topPadding = 45;

    const double frameWidth = 390;

    const double frameHeight = 56;

    const double verticalPadding = 7;

    return Container(
      margin: const EdgeInsets.only(
        top: topPadding,
      ).su(),
      padding: const EdgeInsets.symmetric(
        vertical: verticalPadding,
      ).su(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          renderWidget1(),
          renderWidget2(),
          renderCurrentStep(),
        ],
      ),
    ).su(
      width: frameWidth,
      height: frameHeight,
    );
  }

  Widget renderWidget1() {
    return const SizedBox(
      width: 28,
      height: 28,
    ).su();
  }

  Widget renderWidget2() {
    return const SizedBox(
      width: 282,
      height: 24,
    ).su();
  }

  Widget renderCurrentStep() {
    const double frameWidth = 40;

    const double frameHeight = 24;

    const double processSize = 16;

    return const SizedBox(
      width: frameWidth,
      height: frameHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppText(
            "1/4",
            size: processSize,
          ),
        ],
      ),
    ).su();
  }
}
