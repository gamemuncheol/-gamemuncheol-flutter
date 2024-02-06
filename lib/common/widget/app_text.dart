import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/const/colors.dart';

class AppText extends StatelessWidget {
  // 문구
  final String text;

  // 컬러
  final Color color;

  // 문구 크기
  final double size;

  // 두께 정도
  final FontWeight weight;

  // 정렬 방식
  final TextAlign? align;

  const AppText(
    this.text, {
    super.key,
    this.color = AppColors.FONT_BLACK,
    this.size = 14,
    this.weight = FontWeight.w300,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: weight,
      ),
      textAlign: align,
    );
  }
}
