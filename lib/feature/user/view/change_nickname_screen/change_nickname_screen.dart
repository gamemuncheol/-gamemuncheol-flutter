// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/feature/user/mixin/register_nickname_screen_event.dart';
import 'package:gamemuncheol/feature/user/provider/change_nickname_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/feature/user/view/change_nickname_screen/change_nickname_screen_scaffold.dart';

class ChangeNicknameScreen extends HookConsumerWidget
    with ChangeNicknameScreenEvent {
  const ChangeNicknameScreen({
    super.key,
  });

  static const String PATH = "/register_nickname_screen";
  static const String ROUTE_NAME = "RegisterNickNameScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController textEditingController =
        useTextEditingController();

    return ChangeNicknameScreenScaffold(
      title: renderTitle(),
      textField: renderTextField(textEditingController: textEditingController),
      errorText: renderErrorText(),
      nextButton: renderNextButton(
        onTap: () async {
          await changeNickname(ref,
              nickname: textEditingController.text.trim());
        },
      ),
    );
  }

  Widget renderTitle() {
    TextStyle titleStyle =
        TextStyleBuilder().withFontSize(26).withBold().build();

    return Text(
      "롤문철에서 사용하실 닉네\n임을 입력해 주세요.",
      style: titleStyle,
    );
  }

  Widget renderTextField({
    required TextEditingController textEditingController,
  }) {
    const double frameHeight = 50;

    const UnderlineInputBorder textFieldDefaultBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: AppColor.NATURAL_03),
    );

    TextStyle hintStyle = TextStyleBuilder()
        .withColor(AppColor.NATURAL_04)
        .withFontSize(18)
        .withMedium()
        .build();

    return SizedBoxBuilder()
        .withSize(
          height: frameHeight,
        )
        .withChild(
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: "닉네임을 입력해주세요.",
              hintStyle: hintStyle,
              errorBorder: textFieldDefaultBorder,
              focusedBorder: textFieldDefaultBorder,
              enabledBorder: textFieldDefaultBorder,
            ),
          ),
        );
  }

  Widget renderErrorText() {
    TextStyle errorStyle = TextStyleBuilder()
        .withColor(AppColor.ERROR_RED)
        .withFontSize(14)
        .withRegular()
        .build();

    return Consumer(
      builder: (context, ref, child) {
        return ref.watch(changeNicknamNotifierProvider).when(
          error: (error) {
            return Text(error.message, style: errorStyle);
          },
          orElse: () {
            return const SizedBox();
          },
        );
      },
    );
  }

  Widget renderNextButton({required Future<void> Function() onTap}) {
    const double buttonHeight = 64;

    final TextStyle labelStyle = TextStyleBuilder()
        .withColor(AppColor.PRIMARY_WITHE)
        .withRegular()
        .build();

    const BoxDecoration buttoneDecoration = BoxDecoration(
      color: AppColor.PRIMARY_BLUE,
    );

    return GestureDetector(
      onTap: onTap,
      child: ContainerBuilder()
          .withSize(height: buttonHeight)
          .setBoxDecoration(buttoneDecoration)
          .setChild(
            Center(
              child: Text(
                "완료",
                style: labelStyle,
              ),
            ),
          ),
    );
  }
}
