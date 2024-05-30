import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 화면 밑에 버튼이 하나 있는 레이아웃
abstract class BottomButtonExpandedLayout extends StatelessWidget {
  const BottomButtonExpandedLayout({super.key});

  double get horizontalPadding => 16;

  Widget buildBottomButton();
  Widget buildBottomButtonExpandedLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding.sp,
            ),
            child: Column(
              children: [
                Expanded(
                  child: buildBottomButtonExpandedLayout(context),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: buildBottomButton(),
        ),
      ],
    );
  }
}
