// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/const/colors.dart';

class CustomColorTheme extends ThemeExtension<CustomColorTheme> {
  final Color natural02;
  final Color natural03;
  final Color natural04;
  final Color natural05;
  final Color natural06;

  final Color errorRed = AppColor.ERROR_RED;

  final Color primaryBlue;
  final Color onPrimaryBlue;
  final Color primaryGreen;
  final Color onPrimaryGreen;
  final Color primaryBlack = AppColor.PRIMARY_BLACK;
  final Color onPrimaryBlack = AppColor.PRIMARY_WITHE;
  final Color primaryWhite = AppColor.PRIMARY_WITHE;
  final Color onpPrimaryWhite = AppColor.PRIMARY_BLACK;

  final Color background;

  CustomColorTheme({
    required this.natural02,
    required this.natural03,
    required this.natural04,
    required this.natural05,
    required this.natural06,
    required this.primaryBlue,
    required this.onPrimaryBlue,
    required this.primaryGreen,
    required this.onPrimaryGreen,
    required this.background,
  });

  @override
  CustomColorTheme copyWith({
    Color? natural02,
    Color? natural03,
    Color? natural04,
    Color? natural05,
    Color? natural06,
    Color? primaryBlue,
    Color? onPrimaryBlue,
    Color? primaryGreen,
    Color? onPrimaryGreen,
    Color? background,
  }) {
    return CustomColorTheme(
      natural02: natural02 ?? this.natural02,
      natural03: natural03 ?? this.natural03,
      natural04: natural04 ?? this.natural04,
      natural05: natural05 ?? this.natural05,
      natural06: natural06 ?? this.natural06,
      primaryBlue: primaryBlue ?? this.primaryBlue,
      onPrimaryBlue: onPrimaryBlue ?? this.onPrimaryBlue,
      primaryGreen: primaryGreen ?? this.primaryGreen,
      onPrimaryGreen: onPrimaryGreen ?? this.onPrimaryGreen,
      background: background ?? this.background,
    );
  }

  @override
  CustomColorTheme lerp(CustomColorTheme? other, double t) {
    if (other is! CustomColorTheme) {
      return this;
    }
    return CustomColorTheme(
      natural02: Color.lerp(natural02, other.natural02, t)!,
      natural03: Color.lerp(natural03, other.natural03, t)!,
      natural04: Color.lerp(natural04, other.natural04, t)!,
      natural05: Color.lerp(natural05, other.natural05, t)!,
      natural06: Color.lerp(natural06, other.natural06, t)!,
      primaryBlue: Color.lerp(primaryBlue, other.primaryBlue, t)!,
      onPrimaryBlue: Color.lerp(onPrimaryBlue, other.onPrimaryBlue, t)!,
      primaryGreen: Color.lerp(primaryGreen, other.primaryGreen, t)!,
      onPrimaryGreen: Color.lerp(onPrimaryGreen, other.onPrimaryGreen, t)!,
      background: Color.lerp(background, other.background, t)!,
    );
  }
}
