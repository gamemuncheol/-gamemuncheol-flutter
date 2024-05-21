import 'package:flutter/material.dart';

// 화면 밑에 버튼이 하나 있는 레이아웃
abstract class BottomButtonExpandedLayout extends StatelessWidget {
  const BottomButtonExpandedLayout({super.key});

  double get horizontalPadding => 16;

  Widget buildLayout(BuildContext context);
  Widget buildBottomButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                Expanded(
                  child: buildLayout(context),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: buildBottomButton(),
        ),
      ],
    );
  }
}
