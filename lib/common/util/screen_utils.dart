import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenUtilPadding on EdgeInsets {
  EdgeInsets useScreenUtil() {
    return copyWith(
      left: left.w,
      right: right.w,
      top: top.h,
      bottom: bottom.h,
    );
  }
}

extension ScreenUtilContainer on Container {
  Container useScreenUtil({
    double? width,
    double? height,
  }) {
    return Container(
      margin: margin,
      padding: padding,
      width: width?.w,
      height: height?.h,
      decoration: decoration,
      child: child,
    );
  }
}

extension ScreenUtilSizedBox on SizedBox {
  SizedBox useScreenUtil() {
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: child,
    );
  }
}
