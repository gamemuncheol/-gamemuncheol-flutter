import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/const/colors.dart';

class TextStyleBuilder {
  Color _color = AppColor.PRIMARY_BLACK;
  double _fontSize = 16;
  FontWeight _fontWeight = FontWeight.w500;
  final double _height = 1;
  final double _letterSpacing = -0.50;

  TextStyleBuilder withFontSize(double fontSize) {
    _fontSize = fontSize;
    return this;
  }

  TextStyleBuilder withBold() {
    _fontWeight = FontWeight.w900;
    return this;
  }

  TextStyleBuilder withMedium() {
    _fontWeight = FontWeight.w700;
    return this;
  }

  TextStyleBuilder withRegular() {
    _fontWeight = FontWeight.w500;
    return this;
  }

  TextStyleBuilder withLight() {
    _fontWeight = FontWeight.w300;
    return this;
  }

  TextStyleBuilder withThin() {
    _fontWeight = FontWeight.w100;
    return this;
  }

  TextStyleBuilder withColor(Color textColor) {
    _color = textColor;
    return this;
  }

  TextStyle build() {
    return TextStyle(
      color: _color,
      fontSize: _fontSize.sp,
      fontWeight: _fontWeight,
      letterSpacing: _letterSpacing,
      height: _height,
    );
  }
}
