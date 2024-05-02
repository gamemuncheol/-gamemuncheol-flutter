// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextStyleTheme extends ThemeExtension<CustomTextStyleTheme> {
  final Color defaultColor;
  final double height = 1;
  final double letterSpacing = -0.50;

  late final TextStyle baseTextStyle = TextStyle(
    color: defaultColor,
    letterSpacing: letterSpacing,
    height: height,
  );

  late final TextStyle baseTextStyleBold =
      baseTextStyle.copyWith(fontWeight: FontWeight.w900);

  late final TextStyle baseTextStyleMedium =
      baseTextStyle.copyWith(fontWeight: FontWeight.w700);

  late final TextStyle baseTextStyleRegular =
      baseTextStyle.copyWith(fontWeight: FontWeight.w500);

  late final TextStyle title1B = baseTextStyleBold.copyWith(fontSize: 26.sp);
  late final TextStyle title1M = baseTextStyleMedium.copyWith(fontSize: 26.sp);

  late final TextStyle title2B = baseTextStyleBold.copyWith(fontSize: 24.sp);
  late final TextStyle title2M = baseTextStyleMedium.copyWith(fontSize: 24.sp);

  late final TextStyle title3B = baseTextStyleBold.copyWith(fontSize: 22.sp);
  late final TextStyle title3M = baseTextStyleMedium.copyWith(fontSize: 22.sp);

  late final TextStyle title4B = baseTextStyleBold.copyWith(fontSize: 20.sp);
  late final TextStyle title4M = baseTextStyleMedium.copyWith(fontSize: 20.sp);

  late final TextStyle title5B = baseTextStyleBold.copyWith(fontSize: 18.sp);
  late final TextStyle title5M = baseTextStyleMedium.copyWith(fontSize: 18.sp);

  late final TextStyle body1M = baseTextStyleMedium.copyWith(fontSize: 22.sp);
  late final TextStyle body1R = baseTextStyleRegular.copyWith(fontSize: 22.sp);

  late final TextStyle body2M = baseTextStyleMedium.copyWith(fontSize: 20.sp);
  late final TextStyle body2R = baseTextStyleRegular.copyWith(fontSize: 20.sp);

  late final TextStyle body3M = baseTextStyleMedium.copyWith(fontSize: 18.sp);
  late final TextStyle body3R = baseTextStyleRegular.copyWith(fontSize: 18.sp);

  late final TextStyle body4M = baseTextStyleMedium.copyWith(fontSize: 16.sp);
  late final TextStyle body4R = baseTextStyleRegular.copyWith(fontSize: 16.sp);

  late final TextStyle body5M = baseTextStyleMedium.copyWith(fontSize: 14.sp);
  late final TextStyle body5R = baseTextStyleRegular.copyWith(fontSize: 14.sp);

  late final TextStyle cap1 = baseTextStyleRegular.copyWith(fontSize: 13.sp);
  late final TextStyle cap2 = baseTextStyleRegular.copyWith(fontSize: 12.sp);

  CustomTextStyleTheme({required this.defaultColor});

  @override
  CustomTextStyleTheme copyWith() {
    return CustomTextStyleTheme(defaultColor: defaultColor);
  }

  @override
  ThemeExtension<CustomTextStyleTheme> lerp(
      covariant ThemeExtension<CustomTextStyleTheme>? other, double t) {
    if (other is! CustomTextStyleTheme) {
      return this;
    }
    return CustomTextStyleTheme(
      defaultColor: Color.lerp(defaultColor, other.defaultColor, t)!,
    );
  }
}
