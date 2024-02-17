import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';

class RegisterNicknameScreenScaffold extends StatelessWidget {
  // 회원가입 상태바
  final Widget registerStatusBar;

  // 문구
  final Widget title;

  // 텍스트 필드
  final Widget textField;

  // 에러 문구
  final Widget errorText;

  // 다음 버튼
  final Widget nextButton;

  const RegisterNicknameScreenScaffold({
    super.key,
    required this.registerStatusBar,
    required this.title,
    required this.textField,
    required this.errorText,
    required this.nextButton,
  });

  final double horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(
      context,
    );

    return DefaultLayout(
        child: SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ).su(),
              child: Column(
                children: [
                  registerStatusBar,
                  title,
                  textField,
                  errorText,
                ],
              ),
            ),
            nextButton,
          ],
        ),
      ),
    ));
  }
}
