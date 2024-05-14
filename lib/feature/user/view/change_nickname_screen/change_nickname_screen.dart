// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/presentation/view/base_screen.dart';
import 'package:gamemuncheol/common/presentation/widget/custom_text_form_filed.dart';
import 'package:gamemuncheol/common/presentation/widget/square_button.dart';
import 'package:gamemuncheol/feature/user/event.dart/change_nickname_screen_event.dart';
import 'package:gamemuncheol/feature/user/provider/change_nickname_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/feature/user/view/change_nickname_screen/change_nickname_screen_layout.dart';

class ChangeNickNameScreen extends BaseScreen with ChangeNicknameScreenEvent {
  ChangeNickNameScreen({super.key});

  static const String name = "ChangeNickNameScreen";
  static const String path = "/change_nickname_screen";

  @override
  get provider => changeNickNameNotifierProvider;

  @override
  AppBar? buildAppBar() {
    final double leadingWidth = 44.w;
    final double leadingPadding = 16.w;

    return AppBar(
      elevation: 0,
      backgroundColor: colorTheme.background,
      leadingWidth: leadingWidth,
      leading: GestureDetector(
        onTap: onLeadingTap,
        child: Padding(
          padding: EdgeInsets.only(left: leadingPadding),
          child: SvgPicture.asset(AppAsset.chevronLeftBlack),
        ),
      ),
    );
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final TextEditingController textEditingController =
        useTextEditingController();

    return ChangeNickNameScreenLayout(
      title: buildTitle(),
      textField: buildTextField(nicknameController: textEditingController),
      errorText: buildErrorText(),
      nextButton: buildNextButton(
        onTap: () async {
          final String nickname = textEditingController.text.trim();
          await changeNickName(ref, nickname: nickname);
        },
      ),
    );
  }

  Widget buildTitle() {
    const String title = "롤문철에서 사용하실 닉네\n임을 입력해 주세요.";
    final TextStyle titleStyle = textStyleTheme.title1M;

    return Text(
      title,
      style: titleStyle,
    );
  }

  Widget buildTextField({
    required TextEditingController nicknameController,
  }) {
    const int maxLines = 1;
    const int maxLength = 16;
    const String hintText = "닉네임을 입력해주세요.";

    return CustomTextFormField(
      textEditingController: nicknameController,
      isUnderLineTextFormField: true,
      maxLength: maxLength,
      maxLines: maxLines,
      hintText: hintText,
    );
  }

  Widget buildErrorText() {
    final TextStyle errorStyle =
        textStyleTheme.body5R.copyWith(color: colorTheme.errorRed);

    return Consumer(
      builder: (context, ref, child) {
        final bState = ref.watch(changeNickNameNotifierProvider);

        return bState.whenBState(
          error: (message) {
            return Text(
              message,
              style: errorStyle,
            );
          },
          orElse: () {
            return const SizedBox();
          },
        );
      },
    );
  }

  Widget buildNextButton({required Future<void> Function() onTap}) {
    final labelStyle =
        textStyleTheme.body3R.copyWith(color: colorTheme.onPrimaryBlue);
    final buttonDecoration = BoxDecoration(color: colorTheme.primaryBlue);

    const String lable = "완료";

    return SquareButton(
      onTap: onTap,
      label: lable,
      labelStyle: labelStyle,
      buttonDecoration: buttonDecoration,
    );
  }
}
