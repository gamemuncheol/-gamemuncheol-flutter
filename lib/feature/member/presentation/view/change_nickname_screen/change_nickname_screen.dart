// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/presentation/component/custom_text_form_filed.dart';
import 'package:gamemuncheol/common/presentation/component/square_button.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/member/presentation/provider/change_nickname_provider.dart';
import 'package:gamemuncheol/feature/member/presentation/view/change_nickname_screen/change_nickname_screen_layout.dart';
import 'package:gamemuncheol/feature/member/presentation/view/change_nickname_screen/event/change_nickname_screen_event.dart';

class ChangeNicknameScreen extends BaseScreenV2 {
  const ChangeNicknameScreen({super.key});

  static const String PATH = "/$NAME";
  static const String NAME = "CHANGE_NICKNAME_SCREEN";

  @override
  BaseScreenV2State<ChangeNicknameScreen> createState() =>
      _ChangeNickNaemScreenV2State();
}

class _ChangeNickNaemScreenV2State
    extends BaseScreenV2State<ChangeNicknameScreen>
    with BlurLayout, ChangeNicknameScreenEvent {
  @override
  ProviderListenable get provider => changeNickNameNotifierProvider;

  @override
  PreferredSizeWidget? buildAppBar() {
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
          child: SvgPicture.asset(
            AppAsset.CHEVRON_LEFT_BLACK,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildBody() {
    return ChangeNickNameScreenLayout(
      header: _buildHeader(),
      textField: _buildTextField(),
      errorText: _buildErrorText(),
      completeButton: _buildCompleteBtn(),
    );
  }

  Widget _buildHeader() {
    const title = "롤문철에서 사용하실 닉네\n임을 입력해 주세요.";
    final titleStyle = textStyleTheme.title1M;

    return Text(
      title,
      style: titleStyle,
    );
  }

  Widget _buildTextField() {
    const maxLines = 1;
    const maxLength = 16;
    const hintText = "닉네임을 입력해주세요.";

    return CustomTextFormField(
      textEditingController: nicknameController,
      isUnderLineTextFormField: true,
      maxLength: maxLength,
      maxLines: maxLines,
      hintText: hintText,
    );
  }

  Widget _buildErrorText() {
    return Consumer(
      builder: (context, ref, child) {
        final bState = ref.watch(changeNickNameNotifierProvider);

        return bState.whenBState(
          error: (message) {
            return Text(
              message,
              style: textStyleTheme.body5R.copyWith(color: colorTheme.errorRed),
            );
          },
          orElse: () {
            return const SizedBox();
          },
        );
      },
    );
  }

  Widget _buildCompleteBtn() {
    const lable = "완료";

    return SquareButton.label(
      onTap: changeNickName,
      label: lable,
    );
  }
}
